import sys		 
import json		 #For cross platform file formats
import SQLaccess #Access to SQL server
import PostcodeSort #for where can I find function

#code called by PHP, IO through APIfile.json
def get_sites_near_me(): #call shell_exec("get_sites_near_me.py "); -- postcode is in array form: str postcode
	Communication_file.seek(0)
	postcode = Communication_file.read()
	print "postcode: ",postcode
	postcode = json.loads(postcode)
	postcode = postcode[0]
	result = json.dumps(Access.search_postcode(postcode)) #uses JSON format to communicate with PHP
	print "\n\n result of get sites near me: ",result,"\n\n"
	Communication_file.write(result)


def get_where_can_I_find(): #call shell_exec("get_where_can_I_find.py "); -- data is in array form [str species, str postcode]
	global Communication_file
	Communication_file.seek(0)
	data = json.loads(Communication_file.read())
	log.write(data)
	log.close()
	Communication_file.close()
	#print "data: ",data 
	species = data[1]
	postcode = data[0]
	#print postcode, species
	reports = Access.search_postcode_and_species(postcode,species)
	postcodes = [report[1] for report in reports]
	best = PostcodeSort.main(postcodes)
	#print "Best: ",best
	result = json.dumps(best)
	#print result
	Communication_file = open("APIfile.json","w") 
	Communication_file.write(result)
	Communication_file.close()


	#returns [ [str postcode, int reports] , [str postcode0, str postcode1....]

#done
def submit_a_report(): #call shell_exec("submit_a_report.py "); -- report is in array form [str species, str postcode, str comment, str nickname]
	#global Communication_file
	#Communication_file.seek(0)
	print "Comm file: ",repr(Communication_file)
	report = Communication_file.read()
	print "\n\nReport loaded: >",report,"<END of report\n\n"
	report = json.loads(report)
	prepared_report = Access.prepare_report(report)
	Access.add_report(prepared_report)

#possible feature
def log_access():
	pass


Access = SQLaccess.Access()
Communication_file = open("APIfile.json","r+") 
log = open("Log.txt","w")