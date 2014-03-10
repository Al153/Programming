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

card new_card 0 68 13 0 			#new card is a king of diamonds


int 4 4
int 8 8




Load print_pile.next_pointer @queen_of_clubs
Store print_pile.next_pointer @new_card.next

#_______________ Add to Pile _______________
#gp0 pile, gp1, new_card ==> none
#adds a face up card to the 


#_______________ Print Pile ______________
#gp0 pile, gp1 aux ==> None
#prints out face up cards in a pile 



def print_pile.next_pointer gp0
def print_pile.state gp1

int return 10

ptr print_pile
ptr print_pile.loop
ptr print_pile.return



Load print_pile.next_pointer 0 [gp0] %print_pile
	Load print_pile.state [print_pile.next_pointer] #checl 
	if print_pile.state then Load PC @print_pile.return

	ADD print_pile.next_pointer @4 
	Load gp1 0 [print_pile.next_pointer]
	Out 0 [print_pile.next_pointer]
	ADD print_pile.next_pointer @4
	Outd 0 [print_pile.next_pointer]
	Out @return
	ADD print_pile.next_pointer @4
	Load print_pile.next_pointer 0 [print_pile.next_pointer]
	if print_pile.next_pointer then Load PC @print_pile.loop
	
ADD Jump @8 %print_pile.return
Move Jump PC


