Struct card    state suit number next
	int state   state
	int suit    suit
	int number  number
	int  next    next 
end Struct

card ace_of_spades 1 83 1 0
card queen_of_clubs 1 67 12 $ace_of_spades  
card new_card 1 68 13 0 			#new card is a king of diamonds


def next_pointer gp0
int 1 4
int return 10
ptr loop

Load next_pointer @queen_of_clubs
Store next_pointer @new_card.next

Load next_pointer @new_card 
	ADD next_pointer @1 %loop
	Load gp1 0 [next_pointer]
	Out 0 [next_pointer]
	ADD next_pointer @1
	Outd 0 [next_pointer]
	Out @return
	ADD next_pointer @1
	Load next_pointer 0 [next_pointer]
	if next_pointer then Load PC @loop
Halt

