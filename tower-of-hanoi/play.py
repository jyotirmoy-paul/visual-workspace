# visualizing tower of hanoi for n discs

from random import randint
import pygame
import time

# imp variables
peg_dist = 10
const_height = 15
const_width = 20
delay_constant = 75
screen_x = 1366
screen_y = 600


class Disc:
	# disc will be represented by a rectangle (in 2D)
	def __init__(self,x,y,width,color):
		
		self.x = x
		self.y = y
		self.width = width
		self.color = color

		# some constants of the disc 
		self.height = const_height

	# drawing the disc
	def draw(self,win):
		
		pygame.draw.rect(win,self.color,(self.x,self.y,self.width,self.height))


	# moving animation from one tower to another tower
	def move(self,coordinate):
		x,y = coordinate

		# current pos - to move pos
		x_diff = abs(self.x - x)
		y_diff = abs(self.y - y)
		
		if y_diff == 0:

			# first 5 steps climbing the tower height
			tower_climb = (n+1)*const_height - (screen_y - self.y) # remaining dist to climb in the tower
			step = 5
			while(step > 0):
				pygame.time.delay(delay_constant)
				
				# straight climbing tower_climb distance
				self.y -= tower_climb/5 # dividing the whole tower_climb dist 10 equal parts
				
				draw_discs(win)
				step -= 1
			
			# just shifting the box to the req x pos in same level
			jump_step = 10
			while(jump_step >= -10):
				pygame.time.delay(delay_constant)
				
				# handling the motion in y direction - 20 steps
				direction = 1
				if jump_step < 0:
					direction = -1
				self.y -= (jump_step**2) * 0.5 * direction
				
				jump_step -= 1
				
				# handling the motion in x direction - 20 steps
				if self.x < x:
					# moving to the right
					self.x += x_diff/20
				elif self.x > x:
					# moving to the right
					self.x -= x_diff/20
				
				# finally drawing the motion
				draw_discs(win)

			# now falling in the y direction
			step = 5
			while(step > 0):
				pygame.time.delay(delay_constant)
				
				self.y += abs(tower_climb - y_diff)/5 
				
				draw_discs(win)
				step -= 1
				
				
		# jumping to a different y location
		else:
			# falling in y motion
			# starting from a higher pos and ending at a lower pos in y direction
			if self.y < y:
				# the whole process happens in 20 steps
				
				# first 5 steps climbing the tower height
				tower_climb = (n+1)*const_height - (screen_y - self.y) # remaining dist to climb in the tower
				step = 5
				while(step > 0):
					pygame.time.delay(delay_constant)
					
					# straight climbing tower_climb distance
					self.y -= tower_climb/5 # dividing the whole tower_climb dist 10 equal parts
					
					draw_discs(win)
					step -= 1

				# now jumping to the same level at a different pos in x
				jump_step = 10
				while(jump_step >= -10):
					pygame.time.delay(delay_constant)
					
					# handling the motion in y direction - 20 steps
					direction = 1
					if jump_step < 0:
						direction = -1
					self.y -= (jump_step**2) * 0.5 * direction
					
					jump_step -= 1
					
					# handling the motion in x direction - 20 steps
					if self.x < x:
						# moving to the right
						self.x += x_diff/20
					elif self.x > x:
						# moving to the right
						self.x -= x_diff/20
					
					# finally drawing the motion
					draw_discs(win)
				

				# now falling the previously climbed distance
				step = 5
				while(step > 0):
					pygame.time.delay(delay_constant)
					
					self.y += abs(tower_climb + y_diff)/5 
					
					draw_discs(win)
					step -= 1

			# climbing in y motion
			# starting from a lower pos and ending at a higher pos
			else:
				# climb to the rest tower height - x
				# then jump to the required tower
				# then fall x - y_diff dist

				# first 5 steps climbing the tower height
				tower_climb = (n+1)*const_height - (screen_y - self.y) # remaining dist to climb in the tower
				step = 5
				while(step > 0):
					pygame.time.delay(delay_constant)
					
					# straight climbing tower_climb distance
					self.y -= tower_climb/5 # dividing the whole tower_climb dist 10 equal parts
					
					draw_discs(win)
					step -= 1
				
				# now jumping to the same level and moving in the required x direction in 20 steps
				k = 10 #jumping constant
				jump_step = k
				while(jump_step >= -k):
					pygame.time.delay(delay_constant)
					
					# handling the motion in y direction - 20 steps
					direction = 1
					if jump_step < 0:
						direction = -1

					self.y -= (jump_step**2) * 0.5 * direction
					
					jump_step -= 1
					
					# handling the motion in x direction - 20 steps
					if self.x < x:
						# moving to the right
						self.x += x_diff/20
					elif self.x > x:
						# moving to the right
						self.x -= x_diff/20
					
					# finally drawing the motion - this function draws all the discs
					draw_discs(win)

				# now falling (tower_climb - y_diff) height in the current tower
				step = 5
				while(step > 0):
					pygame.time.delay(delay_constant)
					
					# straight falling y_diff distance
					self.y += abs(tower_climb - y_diff)/5 # dividing the whole y_diff dist 10 equal parts
					
					draw_discs(win)
					step -= 1

# DiSC CLASS ENDS HERE

class Tower(Disc):
	# using all the functionalities of the Disc class
	
	def __init__(self,x,y,width,color):
		super().__init__(x,y,width,color)

		# heights of each towers
		self.height = (n+1)*const_height


# function to draw discs 
def draw_discs(win):
	
	# clearing everything that was previously drawn
	win.fill((200,200,200))
	
	# first draw the towers
	draw_towers()

	# now, draw all discs in all towers with different attributes as set
	for disc in ft_disc_list:
		disc.draw(win)
	for disc in st_disc_list:
		disc.draw(win)
	for disc in tt_disc_list:
		disc.draw(win)

	# finally updating the display
	# update() method to be called once per frame to remove flickering of the display
	pygame.display.update()
	

# recursively getting the steps to solve a n disc tower of hanoi problem
def get_the_steps(start,temp,end,n):
	
	global steps
	if n <= 0:
		return
	
	get_the_steps(start,end,temp,n-1)
	steps.append((start,end))
	get_the_steps(temp,start,end,n-1)

# disc moving according to the stored steps logic defined here
def move_the_disc(step):
	
	# list to store the disc in the three towers individually
	global ft_disc_list
	global st_disc_list
	global tt_disc_list
	
	starting, ending = step
	
	
	# first tower to second tower
	if starting == 1 and ending == 2:
		
		n_st = len(st_disc_list)
		
		if len(ft_disc_list) != 0:
			ft_top = ft_disc_list.pop()
			
			y = screen_y - (n_st + 1) * const_height
			x = second_tower - ft_top.width/2
			
			st_disc_list.append(ft_top)
			
			ft_top.move((x,y))
		
	# first tower to third tower
	elif starting == 1 and ending == 3:
		
		n_st = len(tt_disc_list)
		
		if len(ft_disc_list) != 0:
			ft_top = ft_disc_list.pop()
			
			y = screen_y - (n_st + 1) * const_height
			x = third_tower - ft_top.width/2
			
			tt_disc_list.append(ft_top)
			
			ft_top.move((x,y))
	
	# second tower to first tower
	elif starting == 2 and ending == 1:
		
		n_st = len(ft_disc_list)
		
		if len(st_disc_list) != 0:
			ft_top = st_disc_list.pop()
			
			y = screen_y - (n_st + 1) * const_height
			x = first_tower - ft_top.width/2
			
			ft_disc_list.append(ft_top)
			
			ft_top.move((x,y))
		
	# second tower to third tower
	elif starting == 2 and ending == 3:
		n_st = len(tt_disc_list)
		
		if len(st_disc_list) != 0:
			ft_top = st_disc_list.pop()
			
			y = screen_y - (n_st + 1) * const_height
			x = third_tower - ft_top.width/2
			
			tt_disc_list.append(ft_top)
			
			ft_top.move((x,y))
	
	# third tower to first tower
	elif starting == 3 and ending == 1:
		n_st = len(ft_disc_list)
		
		if len(tt_disc_list) != 0:
			ft_top = tt_disc_list.pop()
			
			y = screen_y - (n_st + 1) * const_height
			x = first_tower - ft_top.width/2
			
			ft_disc_list.append(ft_top)
			
			ft_top.move((x,y))
	
	# third tower to second tower
	elif starting == 3 and ending == 2:
		n_st = len(st_disc_list)
		
		if len(tt_disc_list) != 0:
			ft_top = tt_disc_list.pop()
			
			y = screen_y - (n_st + 1) * const_height
			x = second_tower - ft_top.width/2
			
			st_disc_list.append(ft_top)
			
			ft_top.move((x,y))
	

# this function draws the toweres whenever necessary
def draw_towers():
	# drawing the tower_01,tower_02 and tower_03
	tower_01.draw(win)
	tower_02.draw(win)
	tower_03.draw(win)

# the main driver code snippet
n = int(input('Enter n: '))

# max 20 discs are allowed ~ because of the time complexity
if n <= 20 and n>= 1:
	
	# initializing pygame
	pygame.init()
	win = pygame.display.set_mode((screen_x,screen_y))
	win.fill((200,200,200))
	pygame.display.set_caption('Visualize Tower of Hanoi')
	
	# creating n disc with different attributes
	max_width = (n+1)*const_width
	
	# storing discs individually in three towers
	ft_disc_list = []
	st_disc_list = []
	tt_disc_list = []
	
	# position of the towers
	first_tower = screen_x/2 - peg_dist - max_width
	second_tower = screen_x/2
	third_tower = screen_x/2 + peg_dist + max_width
	
	# building the towers in their respective positions
	# x,y,width and color
	tower_01 = Tower(first_tower-3,screen_y - ((n+1)*const_height),6,(0,0,0))
	tower_02 = Tower(second_tower-3,screen_y - ((n+1)*const_height),6,(0,0,0))
	tower_03 = Tower(third_tower-3,screen_y - ((n+1)*const_height),6,(0,0,0))
	
	# the arrangement of the discs in the first tower
	for i in range(1,n+1):
		width = max_width - i*const_width
		# the discs arranged keeping the first_tower at center
		x = first_tower - width/2
		y = screen_y - i*const_height
		ft_disc_list.append(Disc(x,y,width,(randint(0,150),randint(0,150),randint(0,150))))
	
	# function to draw all the discs in their initial position
	draw_discs(win)
	
	# wait for 3 seconds
	time.sleep(3)
	
	# all the discs are created and placed properly, time to play the game!
	# finding out the steps for solving and storing in steps list
	steps = []
	get_the_steps(1,2,3,n) # 1 - start, 2 - temp, 3 - dist
	
	# loop through all the steps
	for step in steps:
		pygame.time.delay(delay_constant)

		for event in pygame.event.get():
			if event.type == pygame.QUIT:
				import sys
				pygame.quit()
				sys.exit()
				
		# function to move the required disc and draw all the other as it is
		move_the_disc(step)
	
	# wait for 4 secs before quiting pygame
	time.sleep(4)
	
	pygame.quit()
	print('Completed!\nNumber of steps taken : {}'.format(len(steps)))
	
else:
	print('Enter a value between 1 and 20 (both inclusive)')
		


