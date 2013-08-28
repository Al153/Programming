import pygame
pygame.init()
while 1:
    print 'going'
    pressed = pygame.key.get_pressed()
    for i in range (len(pressed)):
        if pressed[i] == 1:print i
