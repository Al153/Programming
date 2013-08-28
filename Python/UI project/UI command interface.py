import Hash
import User_class


class TextUI:
	def __init__(self):
		self.quit = False
		self.login_state = False #whether user is logged in
		self.user_name = False #Name of logged in user
		self.user_list = open("User_list.txt","r+")
		self.Log = op("Log.txt","r+")

	def command(self):


	def login(self):
		error = 1
		while error:
			user_name = str(raw_input("User ID"))
			for line in self.user_list:

				for letter in line:

