class Grid:
	def __init__(self,x_size,y_size,length_to_win):
		self.width = x_size
		self.height = y_size
		self.grid = [[]]*x_size #grid
		self.length_to_win
		self.win = False #gets changed to a player's number in the event of a win

	def place(self,position,player):
		"places a piece in the grid. returns True if successful, False if unsuccessful"
		print "placing"
		if position>=self.width or position<0:  #if invalid column
			return False
		elif len(self.grid[position]) == self.height - 1:   #if column is already full
			return False
		else: #if coordinates valid:
			self.grid[position].append(player)   #"Player" is the number for a player's piece
			self.win_test(player,position,len(grid[position])-1)   #sees if this player has won
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


			



