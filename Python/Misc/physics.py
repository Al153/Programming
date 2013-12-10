class Entity(object):
	"""docstring for Entity"""
	def __init__(self, position,velocity,acceleration,mass):
		self.position = position
		self.velocity = velocity
		self.acceleration = acceleration
		self.mass = mass

	def update(self):
		self.position = (self.position[0]+self.velocity[0],self.position[1]+self.velocity[1])
		self.velocity = (self.velocity[0]+self.acceleration[0],self.velocity[1]+self.velocity[1])

	def force(self,resultant_force):
		self.acceleration = (resultant_force[0]/self.mass,resultant_force[1]/self.mass)
		