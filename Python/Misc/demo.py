data_file = open("data.txt","r") #opens a file as an object
totals = {} #creates a dictionary to store the totals

for line in data_file:		#iterates through lines
	split_line = line.split(" ") #assuming line has a space between the date, item name, and price
	date = split_line[0]         #gets the date and other parts for use laters
	item = split_line[1]
	price = split_line[2]

	price = price[2:] #remove the pound sign (pound sign is unicode so takes up two characters which both needto be removed hence [2:] rather than [1:]
	if item in totals: #if there is a record for this item
		totals[item] += float(price) #increment the record, needs to convert a string to a float
	else:
		totals[item] = float(price) #otherwise create a record

results_file = open("result.txt","w")  #create an output file
for item in totals:						#for every item record
	results_file.write(item+": "+str(totals[item])+"\n")  			#write a line to the file, adds a carriage return to the end

results_file.close()
data_file.close()