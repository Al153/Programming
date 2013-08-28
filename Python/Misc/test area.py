my_list = [0,1,2,3,4,5]
my_list_2 = [7,8,9]
my_list = my_list[:3]+my_list_2+my_list[4:]
print my_list

for item in my_list:
	print item
	if item == 2:
		index = my_list.index(item)
		my_list.insert(index+1,"bar")