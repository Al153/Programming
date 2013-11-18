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
		self. clear = lambda:os.system("cls")
		self.size = size
		self.Engine = Engine(size[0],size[1],length_to_win)

	def print_grid(self):
		#self.clear()
		grid_data = self.Engine.dump_grid() #get the data from the grid
		for y in xrange(self.size[1],0,-1):
			for x in xrange(self.size[0]):
				try:
					piece = self.player_lookup[grid_data[x][y]]  #gets the player number from the grid and converts their number into a name 

				except IndexError:
					piece = ' '
				print '['+piece+']',
			print "\n"
	

	def run(self): 
		while self.Engine.win == False:
			for player in self.player_lookup:
				error = 1
				while error:
					try: 
						position = input("Player "+str(player)+" please enter the column you want to place into ")
						if not self.Engine.place(int(position),player):
							error = 1
							print "Please enter a Valid column number"
						else:
							error = 0
					except ValueError:
						print "Please enter a valid column number"
				self.print_grid()
		print "player "+str(self.Engine.win)+"wins"








class Engine:
	def __init__(self,x_size,y_size,length_to_win):
		self.width = x_size
		self.height = y_size
		self.grid = [[]]*x_size #grid
		self.length_to_win =length_to_win
		self.win = False #gets changed to a player's number in the event of a win

	def place(self,position,player):
		"places a piece in the grid. returns True if successful, False if unsuccessful"
		print position, player
		if position>=self.width or position<0:  #if invalid column
			return False
		elif len(self.grid[position]) == self.height - 1:   #if column is already full
			return False
		else: #if coordinates valid:
			print "coordinates valid"
			print self.grid[position]
			self.grid[position]].append(player)   #"Player" is the number for a player's piece
			self.win_test(player,position,len(self.grid[position])-1)   #sees if this player has won
			return True

	def win_test(self,player,x_coord,y_coord):
		"tests around the piece to see if the given player has won"
		#tests the four possible lines the win could be in (up-down,bottomleft-topright,left-right and bottom_right,top-left)

		directions = [
			[0,1],    #  |
			[1,1],    #  /
			[1,0],    #  \
			[1,-1]    #  -
		]
		for direction in directions:
			temp_x = x_coord    #stores the coordinates for manipulation
			temp_y = y_coord    
			direction_valid = 1   #stores whether this particular direction is still to be tested.
			direction_score = 1   #the number of this player in a row

			#=============== tests in positive direction ============
			while direction_valid:
				temp_x += direction[0] #moves pointer in direction of "direction"
				temp_y += direction[1] 
				try:
					position_player = self.grid[temp_x][temp_y]   #finds the player occupying this part of the grid, triggers IndexError if invalid
					if position_player == player:
						direction_score += 1   #increases direction score
						if direction_score == self.length_to_win:
							self.win = player
							break
					else:
						direction_valid = 0
				except IndexError:
					direction_valid = 0

			#=============== tests in negative direction ============
			temp_x = x_coord    #stores the coordinates for manipulation
			temp_y = y_coord    
			direction_valid = 1   #stores whether this particular direction is still to be tested.
			

			while direction_valid:
				temp_x -= direction[0] #moves pointer in opposite direction of "direction"
				temp_y -= direction[1] 
				try:
					position_player = self.grid[temp_x][temp_y]   #finds the player occupying this part of the grid, triggers IndexError if invalid
					if position_player == player:
						direction_score += 1   #increases direction score
						if direction_score == self.length_to_win:
							self.win = player
							break
					else:
						direction_valid = 0
				except IndexError:
					direction_valid = 0

	def dump_grid(self):
		#print self.grid
		return self.grid


game = Game({0:"O",1:"X",2:"Z"},(6,7),4)
game.run()
