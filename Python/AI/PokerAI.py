import random #for shuffling, etc

class Deck:
	def __init__(self):
		self.cards = [Card(0,i) for i in xrange(2,15)] + [Card(1,i) for i in xrange(2,15)] + [Card(2,i) for i in xrange(2,15)] + [Card(3,i) for i in xrange(2,15)]

	def shuffle(self):
		for x in range(4):                                                #4 shuffle cycles
			for i in xrange(52):
				j = random.randrange(0,52)
				self.cards[i], self.cards[j] = self.cards[j],self.cards[i]  #everyposition is guaranteed to be swapped at least 4 times with and expectation of 8
	def deal(self,players):
		player_hands = [ [] for i in xrange(players)]
		for i in xrange(players*5):
			player_hands[i%players].append(self.cards[i])
		return player_hands



class Card:
	def __init__(self,suit,rank):  #rank between 2 and 14 (for ace)
		self.suit = suit
		self.rank = rank




class game:
	def __init__(self,players_list,player_names,buy_in,blind_size):  
		#players list of the form of [0,0,1,0 . . .] where 0 indicates a human player and 1 indicates an ai
		#blind_size indicates size ofsmall blind. big blind is double this
		self.players = [ Human(buy_in,player_names[i],self) if not players_list[i] else Ai(buy_in,player_names[i],self) for i in xrange(len(players_list))  ] #allocates players
		self.blind =  0 #index of big_blind player
		self.pot = 0
		self.all_in_pot = 0
		self.blind_size = blind_size
		
	def set_up_round:
		round_deck = Deck
		round_deck.shuffle()
		player_hands = round_deck.deal(len(self.players))
		for i in range(len(self.players)):
			players[i].cards = player_hands[i]

		#now get the blinds
		self.players[self.blind].blind(2*self.blind_size)
		self.players[(self.blind+1)%len(self.players)].blind(self.blind_size)
		self.blind = (self.blind+1)%len(self.players)





class Player:
	def __init__(self,money,name,parent_game):   #parent game is a pointer to the overall game allowing gathering of information, especially for the ai
		self.balance = money
		self.name = name
		self.game = parent_game
		self.folded = 0

	def blind(self,blind_size):
		if blind_size < self.balance:
			self.game.pot += blind_size
			self.balance -= blind_size
			


class Human(Player):
	pass

class Ai(Player):

	def get_round_score(self):  #will generate a total score for the hand, this is used to determine whether/how much to bet
		#needs to score hand objectively based on:
			 # -high card
			 # -pairs, two pair, threes, fours, full house etc
			 # -straights
			 # -flushes

		duplicates_score = self.get_duplicates_score()
		high_card_score = self.get_high_card_score()
#		flush_score = self.get_flush_score()
#		straight_score = self.get_straight_score()
#		bluff_score = self.get_bluff_score()

	def get_high_card_score(self):
		return max(   #simply the highest card
			self.cards[0].rank,
			self.cards[1].rank,
			self.cards[2].rank,
			self.cards[3].rank,
			self.cards[4].rank
			)

	def get_duplicates_score(self):
		collation_list = range(15) #to collect numbers of each type of card. Range of 15 to allow easy, though inefficient indexing
		for card in self.cards:
			collation_list[card.rank] += 1


game_state = game([0,1,0],["fred","ai","john"],150)
for player in game_state.players:
	print player







#testing
deck = Deck()
deck.shuffle()
hands = deck.deal(2)
print [ [ (card.suit,card.rank)  for card in hand.cards]		for hand in hands]

#high card
#pair
#two pair
#three of a kind
#straight
#flush
#full house
#four of a kind
#straight flush




