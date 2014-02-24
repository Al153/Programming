class logic_graph:
	def __init__(self,column_names,rules):
		self.column_names = column_names
		self.rules = rules
		self.links = rules["must"]



	def link_to_column(self,start_column,column_index,end_column):
		for 

	def link(self,column_1,index_1,column_2,index_2):
		

	def test_all_rules(self):
		for rule in self.rules["must"]:
			if not test_rule(rule,0):
				return False

		for rule in self.rules["avoid"]:
			if not test_rule(rule,1):
				return False
		return True




	def test_rule(self,rule,avoid_flag):
		return (rule in self.links)^(avoid_flag)



#zB
Beispiel =  logic_graph(
			{
				"namen":
					["peter","johannes","hans"],
				"alte":
					["7","6","5"],
				"lieblingsport":
					["fuBball","schwimmen","laufen"]
			},
			{
				"must":
					[
						("peter","6"),
						("5","laufen"),
						("johannes","schwimmen")
					],
				"avoid":[]
			}

	)

print Beispiel.brute_force_solve()