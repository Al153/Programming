type color = int * int * int
type xy = int * int
datatype image = Image of xy * color array array;

fun image ((w,h):xy) ((r,g,b):color) = Image((w,h),Array.tabulate(h,fn i => Array.array(w,(r,g,b))));
fun size (Image(xy,_)) = xy;
fun drawPixel (Image(wh,a)) c ((x,y):xy) = Array.update(Array.sub(a,y),x,c);
fun format4 i = StringCvt.padLeft #" " 4 (Int.toString i);
fun pixelString x y arr =	let
								val (r,g,b) = Array.sub(Array.sub(arr,y-1),x-1) 
							in
								(format4 r) ^ (format4 g) ^ (format4 b)
							end;

fun getPx width x y arr = if x = width 	then (pixelString x y arr)
									else (pixelString x y arr) ^ (getPx width (x+1) y arr);

fun getRows ((w,h):xy) y arr =  if y = h 	then (getPx w 1 y arr) ^ "\n"
											else (getPx w 1  y arr) ^ "\n" ^ (getRows ((w,h):xy) (y+1) arr);


fun toPPM (Image((w,h),arr)) filename =
  let
  	val oc = TextIO.openOut filename
  in
     TextIO.output(oc,"P3\n" ^ Int.toString w ^ " " ^ Int.toString h ^ "\n255\n");
     TextIO.output(oc, getRows (w,h) 1 arr);
     TextIO.closeOut oc
  end;


fun drawHoriz im c ((x,y):xy) len = if len = 0 then () else (drawPixel im c (x,y);drawHoriz im c (x+1,y) (len-1));
fun drawVert im c ((x,y):xy) len = if len = 0 then () else (drawPixel im c (x,y);drawVert im c (x,y+1) (len-1));
fun drawDiag im c ((x,y):xy) len = if len = 0 then () else (drawPixel im c (x,y);drawDiag im c (x+1,y+1) (len-1));



(*
val im=image (100,100) (1,10,100);
drawHoriz im (255,255,255) (33,50) 33;
drawVert im (255,0,0) (50,33) 33;
drawDiag im (0,255,0) (33,33) 33;
toPPM im "testimage.ppm"; *)

fun iterLine im colour x0 y0 x1 y1 dx dy err sx sy =
      if x0 = x1 andalso y0 = y1 then
        (drawPixel im colour (x0, y0))
      else
        ((drawPixel im colour (x0, y0));
          let 
            val e2 = 2*err;
            val updatedErr = if e2> (~dy) then err-dy else err;
          in
            (iterLine im colour (if e2> (~dy) then x0 + sx else x0) (if e2< dx then y0 + sy else y0) x1 y1 dx dy (if e2<dx then updatedErr +dx else updatedErr) sx sy)
          end
        )
      ;

fun drawLine im colour ((x0,y0):xy) ((x1,y1):xy) =
      let
        val dx = Int.abs (x1 - x0);
        val dy = Int.abs (y1 - y0); 
        val sx = if x0<x1 then 1 else ~1;
        val sy = if y0<y1 then 1 else ~1;
      in
        ( iterLine im colour x0 y0 x1 y1 dx dy (dx-dy) sx sy)
      end;