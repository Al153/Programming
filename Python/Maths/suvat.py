import math #for trig

class Particle:
	def __init__(self,x_position,y_position):
		self.x_position = x_position
		self.y_position = y_position
		self.x_velocity, self.y_velocity = 0,0
		self.x_acceleration, self.y_acceleration = 0,0

	def tick(self,time_period):
		self.x_position += self.x_velocity*time_period
		self.y_position += self.y_velocity*time_period

		self.x_velocity += self.x_acceleration*time_period
		self.y_velocity += self.y_acceleration*time_period




class Advanced_particle: #added forces
	def __init__(self,mass,position,velocity):
		self.mass = mass
		self.Particle = Particle(position[0],position[1])
		self.Particle.x_velocity = velocity[0]
		self.Particle.y_velocity = velocity[1]

	def exert_force(self,magnitude,direction,time_period): #direction where 0 radians = horizontal, pi/2 radians = vertical
		self.Particle.x_acceleration = magnitude*math.cos(direction)/self.mass
		self.Particle.y_acceleration = magnitude*math.sin(direction)/self.mass
		self.Particle.tick(time_period)

class orbital_system:
	def __init__(self,particle_1,particle_2,time_period):
		self.particle_1 = particle_1
		self.particle_2 = particle_2
		self.G = 1 #should be: 6.67384 * 10**(-11) #gravitationl constant
		self.time_period = time_period

	def track(self,time):
		x1 = []
		y1 = []
		x2 = []
		y2 = []
		for i in xrange(int(time/self.time_period)):
			x1.append(self.particle_1.Particle.x_position)
			y1.append(self.particle_1.Particle.y_position)
			x2.append(self.particle_2.Particle.x_position)
			y2.append(self.particle_2.Particle.y_position)
			self.tick()
		return x1,y1,x2,y2

	def tick(self):
		magnitude, angle_1,angle_2 = self.find_g()
		self.particle_1.exert_force(magnitude,angle_1,self.time_period)
		self.particle_2.exert_force(magnitude,angle_2,self.time_period)
	
	def find_g(self):
		#return both g and and its direction
		x_displacement = self.particle_2.Particle.x_position-self.particle_1.Particle.x_position
		y_displacement = self.particle_2.Particle.y_position-self.particle_1.Particle.y_position
		radius = math.sqrt((x_displacement)**2 + (y_displacement)**2)
		magnitude = (self.G*self.particle_1.mass*self.particle_2.mass)/radius
		
		angle_1 = abs(math.asin(y_displacement/radius))
		if x_displacement >= 0 and y_displacement >= 0:
			pass

		elif x_displacement < 0 and y_displacement >= 0:
			angle_1 += 0.5*math.pi

		elif x_displacement < 0 and y_displacement < 0:
			angle_1 += math.pi

		elif x_displacement >= 0 and y_displacement < 0:
			angle_1 += 1.5*math.pi


		angle_2 = angle_1 + math.pi
		return magnitude, angle_1,angle_2






		
import matplotlib.pyplot as plt

ball = Advanced_particle(1,[0,0],[10,10])

x = []
y = []
while ball.Particle.y_position >= 0:
	ball.exert_force(9.81*ball.mass,1.5*math.pi,0.001)
	x.append(ball.Particle.x_position)
	y.append(ball.Particle.y_position)

orbits = orbital_system(
		Advanced_particle(100000000,[0,0],[0,0]),
		Advanced_particle(1,[0,100],[10,0]),
		0.01)

x1,y1,x2,y2 = orbits.track(100)

plt.plot(x1,y1)
plt.plot(x2,y2)
plt.show()
		
