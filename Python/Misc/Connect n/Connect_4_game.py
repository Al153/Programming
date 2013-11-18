import os
import connect_n
#A really really really general connect 4 style game.
#customisable:
#			No. of players
#			player pieces
#			grid size
#			length to win

class Game:
	def __init__(self,player_lookup,size,length_to_win):
		self.player_lookup = player_lookup   #in form {0:"x"}
		self.reverse_player_lookup = {}

		for player,piece in player_lookup.iteritems: #reverses the player lookup table: ie you can find a player from their counter
			self.reverse_player_lookup[piece] = player
		
		self. clear = lambda:os.system("cls")
		self.size = size
		self.Engine = connect_n.Grid(size[0],size[1],length_to_win)

	def print_grid(self):
		clear()
		grid_data = self.Engine.dump_grid() #get the data from the grid
		for x in xrange(self.size[0]):
			for y in xrange(self.size[1],0,-1):
				try:
					player = player_lookup[grid_data[x][y]]  #gets the player number from the grid and converts their number into a name 

				except:
					player = ' '
				print '['+player+']',
			print "\n"
	

	def run(self): 
		while self.engine.win != False:
			for player in self.player_lookup:
				error = 1
				while not error:
					try: 
						position = input("Player "+player+" please enter the column you want to place into ")
						if not self.Engine.place(int(position),player):
							error = 1
							print "Please enter a Valid column number"
						else: error = 0
					except ValueError:
						print "Please enter a valid column number"
				print_grid()
		print "player "+self.Engine.win+"wins"









			

