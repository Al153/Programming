/******************************************* 
 *  playn.c                                * 
 *  Automatic Playfair solver              *
 *  by J.W. Stumpel, Jan. 2000 - Oct 2002  *
 *******************************************/

#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#define SKIP             'J'
#define SAMPLE_SIZE	200000


typedef struct
{
  int key[25];
  float score;
}
KEYSQUARE;


int N = 0;
int digstat[25][25];		/* log digram frequency table */
int dfreq[25][25];		/* digram frequency count in text */

int *cbuf, *pbuf;

KEYSQUARE mysquare;
KEYSQUARE champion;


/* function prototypes */
void generate_firstkey (void);
void exchange_rows (void);
void flip8 (void);
void flip5 (void);
void flip7 (void);
void flip6 (void);
void turncol (void);
void turnrow (void);
void exchange_cols (void);
void decode (KEYSQUARE * K);
void measure (KEYSQUARE * K);
void read_stats (FILE * f);
void display_solution (void);
void display_key (KEYSQUARE * K);
void stir (int times);
void stir3 (void);

int
main (int argc, char **argv)
{
  int n = 0, j, k, length, improved = 0;
  float score, T, diff;
  char *filename = "distat.log";
  int *p;
  FILE *statsfile, *infile;

  statsfile = fopen (filename, "r");

  if (!statsfile)
    {
      printf ("\nFile %s not found\n", filename);
      return 1;
    }

  read_stats (statsfile);
  fclose (statsfile);

  if (argc != 2)
    {
      printf ("Usage: playn <filename>\n");
      exit (1);
    }

  infile = fopen (argv[1], "r");
  if (!infile)
    {
      printf ("File %s not found\n", argv[1]);
      return 1;
    }

  fseek (infile, 0, SEEK_END);
  length = ftell (infile);
  rewind (infile);
  cbuf = (int *) malloc (length * sizeof (int));
  pbuf = (int *) malloc (length * sizeof (int));

  printf ("File length is %d\n", length);
  if (!cbuf || !pbuf)
    {
      printf ("allocation failed!\n");
      return 1;
    }

/* slurp the file */
  p = cbuf;
  while ((k = fgetc (infile)) != EOF)
    if (isalpha (k))
      {
	k = toupper (k);
	if (k >= SKIP)
	  k--;
	*p++ = k - 'A';
	N++;
      }
  fclose (infile);
  if (N % 2)
    {
      printf ("\n\n    **WARNING**\nFile has odd number of characters!\n"
	      "Padding with 'X' at end\n\n");
      *p++ = 'X';
      N++;
    }
  printf ("file read\n");

  T = 0.04;
  generate_firstkey ();
  decode (&mysquare);
  measure (&mysquare);
  champion = mysquare;
  while (1)
    {
      mysquare = champion;
      decode (&mysquare);
      display_solution ();
      printf ("Temperature: %f\n", T);
      improved = 0;
      for (j = 0; j < 4000; j++)
	{
	  n = rand () % 1000;
	  if (n < 3)
	      flip8 ();
	  else if (n < 6)
	      flip5 ();
	  else if (n < 9)
	      flip7 ();
	  else if (n < 15)
	      turncol ();
	  else if (n < 21)
	      turnrow ();
	  else if (n < 200)
	      exchange_rows ();
	  else if (n < 400)
	      exchange_cols ();
	  else if (n < 600)
	      stir (1);
	  else if (n >= 850)
	      stir3 ();
	  else
	      stir (1);

	  decode (&mysquare);
	  measure (&mysquare);
	  score = mysquare.score;

	  diff = mysquare.score - champion.score;

	  if (diff > 0)
	    improved++;

	  if (diff > 0 || ((float) rand () / RAND_MAX < exp (diff / T)))
	      champion = mysquare;
	  else
	    mysquare = champion;

	  if (improved > 50)
	    break;
	}
      T *= 0.98;
      if (!improved)
	break;
    }
  return 0;
}


void
read_stats (FILE * f)
{
  int i, j, n = 0;

  for (i = 0; i < 25; i++)
    for (j = 0; j < 25; j++)
      if (fscanf (f, "%d", &digstat[i][j]))
	n++;

  if (n != 625)
    {
      printf ("log-stat file corrupted... exiting....\n");
      exit (1);
    }
}



void
generate_firstkey ()
/* generate a random starting key */
{
  int i, j, rank[25];
  for (j = 0; j < 25; j++)
    rank[j] = j;

  srand (time (0));
  for (j = 0; j < 25; j++)
    {
      i = rand () % (25 - j);
      mysquare.key[j] = rank[i];
      rank[i] = rank[24 - j];
    }

/*  for (j = 0; j < 25; j++)
   printf ("%2d ", mysquare.key[j]);
   printf ("\n");  */
}

void
stir (int n)
/* this stirs up the brew by exchanging n random key pairs */
{
  int i, j;
  int temp;
  if (n < 0)
    return;
  while (n--)
    {
      i = rand () % 25;
      do
	j = rand () % 25;
      while (j == i);
      temp = mysquare.key[i];
      mysquare.key[i] = mysquare.key[j];
      mysquare.key[j] = temp;
    }
}

void
stir3 (void)
/* makes a random 3-swap in the keysquare */
{
  int i, j, k;
  int temp;
  i = rand () % 25;
  do
    j = rand () % 25;
  while (j == i);
  do
    k = rand () % 25;
  while ((k == i) || (k == j));
  temp = mysquare.key[i];
  mysquare.key[i] = mysquare.key[j];
  mysquare.key[j] = mysquare.key[k];
  mysquare.key[k] = temp;
}

void
flip8 (void)
/*flip the whole keysquare, exchanging rows and columns */
{
  int i, j;
  KEYSQUARE tempsquare;
  for (i = 0; i < 5; i++)
    for (j = 0; j < 5; j++)
      tempsquare.key[i + 5 * j] = mysquare.key[5 * i + j];
  tempsquare.score = mysquare.score;
  mysquare = tempsquare;
}

void
flip5 (void)
/*flip the whole keysquare, exchanging top and bottom */
{
  int i, j;
  KEYSQUARE tempsquare;
  for (i = 0; i < 5; i++)
    for (j = 0; j < 5; j++)
      tempsquare.key[i + 5 * j] = mysquare.key[i + 5 * (4 - j)];
  tempsquare.score = mysquare.score;
  mysquare = tempsquare;
}

void
flip7 (void)
/*flip the whole keysquare, exchanging left and right */
{
  int i, j;
  KEYSQUARE tempsquare;
  for (i = 0; i < 5; i++)
    for (j = 0; j < 5; j++)
      tempsquare.key[i + 5 * j] = mysquare.key[(4 - i) + 5 * j];
  tempsquare.score = mysquare.score;
  mysquare = tempsquare;
}

void
flip6 (void)
/*flip the whole keysquare, exchanging left and right, AND top and bottom */
{
  int i, j;
  KEYSQUARE tempsquare;
  for (i = 0; i < 5; i++)
    for (j = 0; j < 5; j++)
      tempsquare.key[i + 5 * j] = mysquare.key[(4 - i) + 5 * (4 - j)];
  tempsquare.score = mysquare.score;
  mysquare = tempsquare;
}

void
decode (KEYSQUARE * K)
{
  int j, n = 0, row[25], col[25];
  int c0, c1, p0, p1, *in = cbuf, *out = pbuf;

  for (j = 0; j < 25; j++)
    {
      row[K->key[j]] = j / 5;
      col[K->key[j]] = j % 5;
    }

  while (n < N)
    {
      c0 = *in++;
      c1 = *in++;

      if (row[c0] == row[c1])
	{
	  p0 = col[c0] ? K->key[5 * row[c0] + col[c0] - 1]
	    : K->key[5 * row[c0] + 4];
	  p1 = col[c1] ? K->key[5 * row[c1] + col[c1] - 1]
	    : K->key[5 * row[c1] + 4];
	}
      else if (col[c0] == col[c1])
	{
	  p0 = row[c0] ? K->key[5 * (row[c0] - 1) + col[c0]]
	    : K->key[20 + col[c0]];
	  p1 = row[c1] ? K->key[5 * (row[c1] - 1) + col[c1]]
	    : K->key[20 + col[c1]];
	}
      else
	{
	  p0 = K->key[5 * row[c0] + col[c1]];
	  p1 = K->key[5 * row[c1] + col[c0]];
	}
      *out++ = p0;
      *out++ = p1;
      n += 2;
    }
}


void
exchange_rows (void)
/* exchange 2 random rows in keysquare */
{
  int temp;
  int j, rowa, rowb;
  rowa = rand () % 5;
  do
    rowb = rand () % 5;
  while (rowb == rowa);

  for (j = 0; j < 5; j++)
    {
      temp = mysquare.key[5 * rowa + j];
      mysquare.key[5 * rowa + j] = mysquare.key[5 * rowb + j];
      mysquare.key[5 * rowb + j] = temp;
    }
}

void
exchange_cols (void)
/* exchange 2 random cols in keysquare */
{
  int temp;
  int j, cola, colb;
  cola = rand () % 5;
  do
    colb = rand () % 5;
  while (colb == cola);
  for (j = 0; j < 5; j++)
    {
      temp = mysquare.key[5 * j + cola];
      mysquare.key[5 * j + cola] = mysquare.key[5 * j + colb];
      mysquare.key[5 * j + colb] = temp;
    }
}

void
turnrow (void)
{
  int temp, j, k = rand () % 5;
  for (j = 0; j < 2; j++)
    {
      temp = mysquare.key[k + 5 * j];
      mysquare.key[k + 5 * j] = mysquare.key[k + 5 * (4 - j)];
      mysquare.key[k + 5 * (4 - j)] = temp;
    }
}


void
turncol (void)
{
  int temp, j, k = rand () % 5;
  for (j = 0; j < 2; j++)
    {
      temp = mysquare.key[5 * k + j];
      mysquare.key[5 * k + j] = mysquare.key[5 * k + (4 - j)];
      mysquare.key[5 * k + (4 - j)] = temp;
    }
}


void
measure (KEYSQUARE * K)
{
  int i, j, n = 1, *p = pbuf;
  long digvalue = 0;		/* this has to hold rather big integers. */

  j = *p++;

  while (n++ < N)
    {
      i = j;
      j = *p++;
      dfreq[i][j]++;
    }

  for (i = 0; i < 25; i++)
    for (j = 0; j < 25; j++)
      {
	n = dfreq[i][j];
	if (n)
	  {
	    digvalue += n * digstat[i][j];
	    dfreq[i][j] = 0;
	  }
      }

  K->score = (float) digvalue / N;
/*fprintf (stderr, "%7.4f\n", K->score); *//*TEST */
}


void
display_key (KEYSQUARE * K)
{
  int j, k;
  for (j = 0; j < 25; j++)
    {
      k = K->key[j] + 'A';
      if (k >= SKIP)
	k++;
      putchar (k);
    }
  putchar ('\n');
}

void
display_solution (void)
{
  int c, i = 0, j = 0, k = 0;
  while (i < N)
    {
      c = pbuf[i++] + 'A';
      if (c >= SKIP)
	c++;
      putchar (c);
      j++;
      if (j == 2)
	{
	  j = 0;
	  putchar (' ');
	}
      k++;
      if (k == 32)
	{
	  k = 0;
	  putchar ('\n');
	}
    }
  putchar ('\n');
  printf ("score: %f\n", mysquare.score);
  printf ("keysquare: ");
  display_key (&mysquare);
  printf ("\n");