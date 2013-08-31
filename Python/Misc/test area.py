mylist = [0,1,2,3,1,2,3]
i = 0
while i < len(mylist):
	if mylist[i] == 1:
		mylist.append(2)
	i += 1
print mylist
end = raw_input("press enter to close")