class ALU:
	def __init__(self,control_bus,data_bus):
		self.control_bus = control_bus
		self.data_bus = data_bus
		self.field_register = {"start":0,"end":0}
		self.reg1 = [0]*4
		self.reg2 = [0]*4
		self.state = "ready"

	def clock(self):
		if state == "ready":
			pass #get command + reg1 value

		elif state == "reg2":
			pass #get reg2 value

		elif state == "calculate":
			pass #do calculation

		elif state == "return":
			pass #return

