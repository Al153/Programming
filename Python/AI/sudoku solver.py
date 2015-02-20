class Sudoku:
	def __init__(self,grid): #grid is 4d array, with 0s in to represent blanks
		self.grid = [[SudokuSquare(square,self,row.index(square),grid.index(row)) for square in row] for row in grid]
		for row in self.grid:
			for square in row:
				square.remove_unambiguous()


class SudokuSquare:
	def __init__(self,square,parent,x,y):
			self.raw_grid = square
			# sets self up with possible values
			self.parent = parent
			self.grid = [[Number(value) for value in row] for row in square]
			self.row_contains
			self.x = x
			self.y = y
			self.contains = set([])

	def summarize_row(self,row_number):
		#returns the set of numbers that a row in the square must contain (ie, the numbers that are definite, and those that only exist in the value sets of cells in that row)
		row_contains_set = set([])
		for cell in self.grid[row_number]:
			if cell.definite:
				row_contains_set += cell.value
			else: 
				#check if number turns up outside of the row
				for number in cell.value:
					found = 0
					for i in range(3):
						if found: break
						if i != row_number:
							for cell in self.grid[i]:
								if number in cell.value:
									found = 1
									break
					if not found:
						row_contains_set.add(number)
		return row_contains_set




	def summarize_column(self,column_number):
		column_contains_set = set([])
		for row in self.grid: #goes through column
			if row[column_number].definite: 			#if a cell is definitely set, then add that number to the contains set
				column_contains_set += row[column_number].contains
			else: 										#if a cell does not have only one possible value, then check if any of those values are unique to the column, if they are then add that value to the contains set
				
				for number in row[column_number].contains:
					#check if number exists elsewhere in grid
					found = 0
					for row2 in self.grid:
						for i in range(3):
							if i != column_number:
								if number in row2[i].value:
									found = 1
									break
						if found: break
					if not found:
						column_contains_set.add(number)
		return column_contains_set

	def get_row_possibilities(self,row_number):
		return_set = set([])
		for cell in self.grid[row_number]:
			return_set += cell.value
		return return_set

	def get_column_possibilities(self,column_number):
		return_set([])
		for row in self.grid:
			return_set += row[column_number].value


	def last_elimination(self):
		#checks to see if a square is the only place a particular number could go, by both checking against the row, column and the square
		changes = 1
		self.remove_unambiguous()
		while changes:
			changes = 0


			for y in range(3):
				for x in range(3):
					for number in self.grid[y][x].value
						if not self.grid[y][x].definite: #for every cell in the square that isn't definite yet:
							found = 0
							for y1 in range(3):
								for x1 in range(3):
									if y1 != y and x1 != x: #for all other cells
										if number in self.grid[y1][x1].value:
											found = 1
											break
								if found = 1:
									break
							if not found: 					#if number not found anywhere in grid
								self.grid[y][x].definite = 1
								self.grid[y][x].values = set([number])
								break

							found = 0 						#now check row and column
							#now gonna check the row and column the cell is in
							#check row:
							if number not in (self.grid[y][(x+1)%3].value + self.grid[y][(x+1)%3].value):




							#check column:
							if number not in (self.grid[y][(x+1)%3].value + self.grid[y][(x+1)%3].value):


						
						if self.grid[y][x].value - set_to_check != self.grid[y][x].value: 		#if removing the set of items would make a change:
							self.grid[y][x].value -= set_to_check
							changes = 1

			if changes:
				self.remove_unambiguous()				#go and do direct elimination on other cells
				square1.direct_elimination()
				square2.direct_elimination()
				square3.direct_elimination()
				square4.direct_elimination()





	def direct_elimination(self):
		#checks to see if the positioning of other numbers means that no numbers can be in this particular square
		changes = 1
		self.remove_unambiguous()
		while changes:
			changes = 0

			for y in range(3):
				for x in range(3):
					if not self.grid[y][x].definite: #for every cell in the square that isn't definite yet:
						#check the global grid to see if any eliminations can be made
						#if they can, changes = 1
						#check the row:
						set_to_check = set([])

						square1 = self.parent.grid[self.y][(self.x+1)%3]
						square2 = self.parent.grid[self.y][(self.x-1)%3]

						set_to_check += square1.summarize_row(y)
						set_to_check += square2.summarize_row(y) 

						square3 = self.parent.grid[(self.y-1)%3][self.x]
						square4 = self.parent.grid[(self.y+1)%3][self.x]

						set_to_check += square3.summarize_column(x)
						set_to_check += square4.summarize_column(x)

						if self.grid[y][x].value - set_to_check != self.grid[y][x].value: 		#if removing the set of items would make a change:
							self.grid[y][x].value -= set_to_check
							changes = 1

			if changes:
				self.remove_unambiguous()				#go and do direct elimination on other cells
				square1.direct_elimination()
				square2.direct_elimination()
				square3.direct_elimination()
				square4.direct_elimination()
				

	def remove_unambiguous(self):
		changes = 1
		while changes: #repeats as often as needed
			changes = 0
			for row in self.grid: #finds all the definite values
				for number in row:
					if len(number.value) == 1:
						self.contains.add(number.value[0]) #updates the contains set
						number.define = 1
			for row in self.grid:
				for number in row:
					if not number.definite:
						number.value -= contains #removes any numbers in the contains set






class Number:
	def __init__(self,value):
		if value: #if value is set
			self.value = set([value])
			self.definite = 1
		else
			self.value = set(range(10))
			self.definite = 0







#set of functions to generate the sudoku array from a grid

def create_sudoku_grid(sudoku_string):
	grid_rows = [sudoku_string.split("\n")[3*i:3*i+3] for i in range(3)]
	return [create_sudoku_row(row) for row in grid_rows]

def create_sudoku_row(row):
	#row is a list of three lists
	squares = [(rows[i][3*j:3*j+3] for i in range 3) for j in range(3)]
	return [create_sudoku_square(square) for square in squares]

def create_sudoku_square(square):
	return [[int(row[i]) for i in range(3)] for row in square]


local_sudoku = Sudoku(create_sudoku_grid(
'''0010023004

'''

))