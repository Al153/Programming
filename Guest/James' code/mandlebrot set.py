#Import pygame and threading
import pygame,threading
from pygame.locals import *

LIMIT=12
MAX_ITERATIONS=56
NUM_THREADS=256

done=False
stop_refresh=False
screen=pygame.display.set_mode((960,960))
disp_rect=[-2,-1.5,1,1.5]
width,height=screen.get_size()
chunk_fraction=1
cur_iterations=8
zoom=0.4
section=0

class Worker(threading.Thread):
    def __init__(self,num):
        self.num=num
        threading.Thread.__init__(self)
    def run(self):
        global section
        for pixelw in range(int(width/16)):
            pixelw+=int((self.num-(self.num%16))/16*width/16)
            for pixelh in range(int(height/16)):
                pixelh+=int(self.num%16*height/16)
                c=complex(disp_rect[0]+(disp_rect[2]-disp_rect[0])*(pixelw/width),disp_rect[1]+(disp_rect[3]-disp_rect[1])*(pixelh/height))
                col=(0,0,0)
                z=0
                for i in range(cur_iterations):
                    z=z**2+c
                    if abs(z)>LIMIT:
                        break;
                    else:
                        col=[col[0]+255/cur_iterations,col[1]+255/cur_iterations,col[2]+255/cur_iterations]
                screen.set_at((pixelw,pixelh),(min(col[0],255),min(col[1],255),min(col[2],255)))
        if self.num>=section:
            section=self.num+1
        pygame.display.flip()

while not done:
    finish=False
    if not stop_refresh:
        #Draw
        threads=[]
        count=0
        for i in range(NUM_THREADS):
            threads.append(Worker(i))
            threads[count].start()
            section=i+1
            count+=1
        section=0
        
        print("Iterations:",str(cur_iterations))
        if not cur_iterations>=MAX_ITERATIONS:
            cur_iterations+=8
        else:
            stop_refresh=True
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            done = True
            break;
        if event.type == pygame.KEYDOWN:
            if event.key == K_ESCAPE and event.mod&KMOD_SHIFT:
                done = True
                break;
            elif event.key == K_ESCAPE:
                pygame.display.iconify()
            elif event.key == K_EQUALS:
                disp_rect=[disp_rect[0]+(disp_rect[2]-disp_rect[0])/2*zoom,disp_rect[1]+(disp_rect[3]-disp_rect[1])/2*zoom,disp_rect[2]-(disp_rect[2]-disp_rect[0])/2*zoom,disp_rect[3]-(disp_rect[3]-disp_rect[1])/2*zoom]
                cur_iterations=8
                stop_refresh=False
            elif event.key == K_MINUS:
                disp_rect=[disp_rect[0]-(disp_rect[2]-disp_rect[0])/2*zoom,disp_rect[1]-(disp_rect[3]-disp_rect[1])/2*zoom,disp_rect[2]+(disp_rect[2]-disp_rect[0])/2*zoom,disp_rect[3]+(disp_rect[3]-disp_rect[1])/2*zoom]
                cur_iterations=8
                stop_refresh=False
            elif event.key == K_UP:
                disp_rect=[disp_rect[0],disp_rect[1]-(disp_rect[3]-disp_rect[1])/2,disp_rect[2],disp_rect[3]-(disp_rect[3]-disp_rect[1])/2]
                cur_iterations=8
                stop_refresh=False
            elif event.key == K_DOWN:
                disp_rect=[disp_rect[0],disp_rect[1]+(disp_rect[3]-disp_rect[1])/2,disp_rect[2],disp_rect[3]+(disp_rect[3]-disp_rect[1])/2]
                cur_iterations=8
                stop_refresh=False
            elif event.key == K_LEFT:
                disp_rect=[disp_rect[0]-(disp_rect[2]-disp_rect[0])/2,disp_rect[1],disp_rect[2]-(disp_rect[2]-disp_rect[0])/2,disp_rect[3]]
                cur_iterations=8
                stop_refresh=False
            elif event.key == K_RIGHT:
                disp_rect=[disp_rect[0]+(disp_rect[2]-disp_rect[0])/2,disp_rect[1],disp_rect[2]+(disp_rect[2]-disp_rect[0])/2,disp_rect[3]]
                cur_iterations=8
                stop_refresh=False