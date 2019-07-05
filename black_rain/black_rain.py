import pygame
from random import randint
import math
import time

screen_width = 1000
screen_height = 700
background_color = (32,32,32)
color_of_rain = rain_color = (190,190,190)
thunder_time_index = time.time()
isBgBlack = False

class Drop:
    def __init__(self, win):
        self.width = 1
        self.height = randint(5,20)
        self.x = randint(0,screen_width) # distribute along x direction
        self.y = randint(-800,-100)
        self.win = win
        self.y_speed = randint(3,5)
    
    def fall(self,r_color):
        pygame.draw.rect(self.win,r_color,(self.x,self.y,self.width,self.height))

        if self.y < screen_height:
            self.y += self.y_speed
            self.y_speed += 0.005
        else:
            self.y = randint(-200,0)
            self.y_speed = randint(3,5)


# setting up pygame
pygame.init()
window = pygame.display.set_mode((screen_width,screen_height))
pygame.display.set_caption('Black Rain')

# play rain sound
rain_sound = pygame.mixer.Sound('rain.wav')
rain_sound.play(-1)

# thunder sound
thunder_sound = pygame.mixer.Sound('thunder.wav')

# creating 500 rain drops
drops = []
for i in range(1000):
    drops.append(Drop(window))

# making the rain drops fall
while True:

    thunder_index = randint(-1000,1000)
    if thunder_index == 0:
        # call a thunder ---> it's thundering  : D

        thunder_sound.play()
        
        thunder_time_index = time.time() + 0.3
    else:
        if thunder_time_index < time.time():
            window.fill(background_color)
            color_of_rain = rain_color
        else:
            window.fill(rain_color)
            color_of_rain = background_color


    # add listener for exiting pygame
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            import sys
            pygame.quit()
            sys.exit()

    # finally make each drops to fall    
    for drop in drops:
        drop.fall(color_of_rain)

    pygame.display.update()
