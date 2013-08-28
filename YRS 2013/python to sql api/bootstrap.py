import SQLaccess
import json

#Access = SQLaccess.Access()

#prepared_report = '("Mallard duck","OX16 8BB",0,"I saw some ducks near the canal today","to_remove")'
#Access.add_report(prepared_report)

#print Access.search_postcode("RG17 7HT")
#print "\n\n"
#print Access.search_postcode_and_species("RG17 7HT","Badger")

#Access.remove_report("to_remove")


open("APIfile.json","w").close()
Communication_file = open("APIfile.json","r+")

report = json.dumps(["Fox","OX14 3LA","On the way home last night we saw a fox","Paul Jones"])
#postcode = json.dumps(["LL14 8QB"])
postcode_and_species = json.dumps(["OX1 5DL","Mallard duck"])


print "Report: ",report
#print "postcode: ",postcode
print "Postcode and species:",postcode_and_species

Communication_file.write(report)
Communication_file.close()
import submit_a_report
print "Report submitted"

open("APIfile.json","w").close()

Communication_file = open("APIfile.json","r+")
Communication_file.write(postcode_and_species)
Communication_file.close()

import get_where_can_I_find
Communication_file = open("APIfile.json","r+")
print "Where can I find? ", Communication_file.read()