import pygame
pygame.init

black = (  0,  0,  0)
white = (255,255,255)
green = (  0,255,  0)
red   = (255,  0,  0)
blue  = (  0,  0,255)

pi=3.141592653

size=[700,500]
screen=pygame.display.set_mode(size)

pygame.display.set_caption("My game")

done = False #loop till user clicks the close button

#--------main program loop--------
while done == False: #(loop)
    #ALL EVENT PROCESSING HAPPENS BELOW HERE
    for event in pygame.event.get():#user did something
        if event.type == pygame.QUIT: #if user clicked close
           done = True # flag to exit loop
    #ALL EVENT PROCESSING HAPPENS ABOVE HERE

           

    #ALL GAME LOGIC HAPPENS BELOW THIS LINE
    
    #ALL GAME LOGIC HAPPENS ABOVE THIS LINE

           
    #ALL CODE TO DRAW GOES BELOW HERE
    screen.fill(white) #clear screen
    y_offset = 0
    while y_offset < 100:
        pygame.draw.line(screen,green,[0,0 + y_offset ],[100,100 + y_offset],5)
        y_offset +=10
    
    pygame.display.flip() #update screen
    #ALL CODE TO DRAW GOES ABOVE HERE

    pygame.time.clock.tick(20) #limits to 20 fps

pygame.quit () # quits program at the end of loop


    
