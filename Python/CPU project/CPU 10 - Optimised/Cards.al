Struct card    state suit number next
	int state   state
	int suit    suit
	int number  number
	int  next    next 
end Struct

Struct pile pointer
	int top pointer
end Struct


card ace_of_spades 0 83 1 0
card queen_of_clubs 0 67 12 $ace_of_spades  
pile pile_1 $queen_of_clubs
pile temp 0

card new_card 0 68 13 0 			#new card is a king of diamonds

#________________ required constants ______________
int 4 4
int 8 8

#____________ debugging ______________
int A 65
int B 66
int C 67





#_____ scripting _____
Load gp0 @pile_1

Load gp1 @new_card
Goto @add_to_pile
Goto @print_pile
Load gp1 @temp
Move One gp2
Goto @split_pile
Move gp1 gp0
Goto @print_pile

#Goto @delete_from_pile
#Goto @print_pile
Halt



#_______________ Add to Pile _______________
#gp0 pile, gp1 new_card ==> gp0: pile 
#adds a face up card to the 

ptr add_to_pile
def add_to_pile.pile 		gp0
def add_to_pile.new_card 	gp1
def add_to_pile.top 		gp2




	Load add_to_pile.top   0 [add_to_pile.pile] %add_to_pile   #get the pointer to the top_card
	Store add_to_pile.top 12 [add_to_pile.new_card] 		   #store the pointer to the new card\'s next section
	Store add_to_pile.new_card 0 [add_to_pile.pile]  
Move Jump PC 

#______________ delete from pile ______________
#gp0 pile ==> gp0 pile, gp1 old_top_card

ptr  delete_from_pile

def delete_from_pile.pile gp0
def delete_from_pile.top_card gp1
def delete_from_pile.new_top gp2

	Load delete_from_pile.top_card 0 [delete_from_pile.pile] %delete_from_pile  #get pointer to the top
	Load delete_from_pile.new_top 12 [delete_from_pile.top_card] 				#get the pointer to the new top
	Store Zero 12 [delete_from_pile.top_card]
	Store delete_from_pile.new_top 0 [delete_from_pile.pile]
Move Jump PC 

#_______________ Print Pile ______________
#gp0 pile, gp1 aux ==> None
#prints out face up cards in a pile 



def print_pile.next_pointer gp0
def print_pile.state gp1

int return 10
int print_pile.pile_address 0

ptr print_pile
ptr print_pile.loop
ptr print_pile.return


Store gp0 		 @print_pile.pile_address %print_pile
Load print_pile.next_pointer 0 [gp0] 
	Load print_pile.state 0 [print_pile.next_pointer] %print_pile.loop
	if print_pile.state then Load PC @print_pile.return

	Load gp1 4 [print_pile.next_pointer]
	Out 4 [print_pile.next_pointer]
	Outd 8 [print_pile.next_pointer]
	Out @return
	Load print_pile.next_pointer 12 [print_pile.next_pointer]
	if print_pile.next_pointer then Load PC @print_pile.loop

Load gp0 @print_pile.pile_address %print_pile.return
Move Jump PC

#______________ split_pile ______________
#gp0: pile, gp1: new_pile, gp2: depth

ptr split_pile
ptr split_pile.loop
ptr split_pile.return

def split_pile.pile gp0
def split_pile.new_pile gp1
def split_pile.depth gp2
def split_pile.next_card gp3
def split_pile.previous_card gp4
def split_pile.top_card gp5

Load split_pile.next_card 0 [split_pile.pile] %split_pile
Move split_pile.next_card split_pile.top_card
Move Zero split_pile.previous_card

	Compare split_pile.depth Zero %split_pile.loop
	if Equal then Load PC @split_pile.return
	SUB split_pile.depth One

		Move split_pile.next_card split_pile.previous_card
		Load split_pile.next_card 12 [split_pile.next_card]
		if split_pile.depth then Load PC @split_pile.loop

Store split_pile.next_card 0 [split_pile.pile]		%split_pile.return
Store split_pile.top_card 0 [split_pile.new_pile]
Store Zero 12 [split_pile.previous_card]
Move Jump PC

