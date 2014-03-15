int length 6
int 4 4
int 2 2

array test_array $length [0,1,2,2,4,5]
int return_addr 0






ptr Prep_search
ptr search
ptr return_high_bound
ptr return_low_bound
ptr return_middle

def target gp0
def trial gp1

def high_bound gp2
def low_bound gp3
def middle gp4
def index gp5


Load target @4
Goto @Prep_search
Halt
#__________ prep search _________


Load high_bound @length %Prep_search

SUB high_bound One
Move high_bound index
MUL index @4
Move Zero low_bound

Load trial @test_array
Compare target trial
if Equal then Load PC @return_low_bound

Load trial @test_array [index]
Compare target trial
if Equal then Load PC @return_high_bound

Load PC @search


#_____________ search _____________
Compare high_bound low_bound %search
if Equal then Load PC @return_high_bound

#else:
	Move high_bound middle
	ADD middle low_bound
	DIV middle @2

	Compare middle low_bound
	if Equal then Load PC @return_high_bound
	#else:
		Move middle index
		MUL index @4
		Load trial @test_array [index]
		
		Compare trial target
		if Equal then Load PC @return_middle

		#else:
			Compare trial target
			if Greater then Move middle high_bound
			Compare trial target
			if Less then Move middle low_bound
		Load PC @search

#_______________ return values ______________
Move high_bound gp0 %return_high_bound
Move Zero gp1
Move Zero gp2
Move Zero gp3
Move Zero gp4
Move Zero gp5
#ADD Jump @4
#ADD Jump @4

Move Jump PC

Move low_bound gp0 %return_low_bound
Move Zero gp1
Move Zero gp2
Move Zero gp3
Move Zero gp4
Move Zero gp5
#ADD Jump @4
#ADD Jump @4

Move Jump PC

Move middle gp0 %return_middle
Move Zero gp1
Move Zero gp2
Move Zero gp3
Move Zero gp4
Move Zero gp5
#ADD Jump @4
#ADD Jump @4

Move Jump PC


