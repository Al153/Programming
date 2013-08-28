import MySQLdb
class Access:
	def __init__(self):
		self.database = self.connect()
		self.Cursor = self.create_cursor(self.database)
		#print self.Cursor.execute("SELECT version()")

	def connect(self):
		database = MySQLdb.connect(host = '127.0.0.1',port = 3306, user ='Access',passwd = 'hello_world',db ='wherecanifind')
		return database

	def create_cursor(self,database):
		return database.cursor()

	def commit(self):
		self.database.commit()

	#to make better!
	def find_postcode_prefix(self,postcode):
		prefix = ""
		for character in postcode:
			try:
				int(character) #if character is a digit: break
				break
			except:
				prefix += character
		return prefix

	#needs completion
	def prepare_report(self,report): #needs to convert report into a tuple
		species = report[0]
		postcode = report[1]
		picture = 0 #can be added in future
		comment = report[2]
		nickname = report[3]
		tuple_string = '"('
		for element in report:
			tuple_string += element+", "
			#print element
		tuple_string = tuple_string[:-2]
		tuple_string += ')"'
		#print tuple_string
		#return tuple_string
		#postcode_prefix = postcode[:2]

		prepared_report = (species.encode('ascii'),postcode.encode('ascii'),picture,comment.encode('ascii'),nickname.encode('ascii'))
		print str(prepared_report)
		return str(prepared_report)



#Main callable functions

	def search_postcode(self,postcode):
		postcode_prefix = self.find_postcode_prefix(postcode)
		prefix_length = str(len(postcode_prefix))
		print "prefix length is: ", prefix_length
		#print postcode_prefix
		#print prefix_length
		request_return = self.Cursor.execute("SELECT * from report WHERE SUBSTRING(Postcode,1,"+prefix_length+") = '"+postcode_prefix+"'")
		print prefix_length
		if prefix_length == '2':
			print "Prefix length is 2"
			to_return = self.Cursor.fetchall()
			print to_return
			return to_return
		else:
			print "prefix_length = 1"
			output_array = []
			for report in self.Cursor.fetchall():
				postcode = report[1]
				try:
					int(postcode[1]) #tests if second part of postcode is a digit
					output_array.append(report)
				except:
					pass
			return output_array



	def search_postcode_and_species(self,postcode,species):
		print "postcode and species: ",postcode, species
		postcode_prefix = self.find_postcode_prefix(postcode)
		prefix_length = str(len(postcode_prefix))
		print "postcode prefix: ", postcode_prefix
		request_return = self.Cursor.execute("SELECT * from report WHERE SUBSTRING(Postcode,1,"+prefix_length+") = '"+postcode_prefix+"' AND Species = '"+species+"'")

		if prefix_length == '2':
			to_return = self.Cursor.fetchall()
			print to_return
			return to_return
		else:
			output_array = []
			for report in self.Cursor.fetchall():
				postcode = report[1]
				try:
					int(postcode[1]) #tests if second part of postcode is a digit
					output_array.append(report)
				except:
					pass
			return output_array


	def add_report(self,prepared_report):
		#print "INSERT INTO report (Species, Postcode,Picture, Comment,NickName) VALUES "+ prepared_report
		try:
			#print "\n\nPrepared report:" ,prepared_report,"\n\n"
			self.Cursor.execute("INSERT INTO report (Species, Postcode, Picture, Comment, NickName) VALUES "+ prepared_report)
			self.commit()
			#print "\n\nAdd to SQL database successful!\n\n"
		except MySQLdb.Error() as Error:
			print format(Error)
		self.commit()

	def remove_report(self,NickName):
		self.Cursor.execute("DELETE from report WHERE NickName = \'" +NickName+"\'")
		#.
		#.
		self.commit()


