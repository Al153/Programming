#3DGames template
#Import PyGame and Py3D
import pygame
from Py3D import *

#Import other required modules


#Runs game normally
def main():
    #Sets up the game object
    game=Game(fov=75,ticks_per_second=40,max_fps=120,use_wait=True,
                         update_callback=None,frame_callback=None,time_source=None,
                         min_brightness=100,min_colour=white, debug=False,
                          caption="Py3D Game")

    #Create classes for Objects and Sub-Objects that extend ObjectBase and
    #SubObjectBase respectively
    class cube(ObjectBase):
        def update(self):
            if pygame.key.get_pressed()[K_q]:
                self.roll=-4
            if pygame.key.get_pressed()[K_w]:
                self.pitch=4
            if pygame.key.get_pressed()[K_e]:
                self.roll=4
            if pygame.key.get_pressed()[K_a]:
                self.yaw=4
            if pygame.key.get_pressed()[K_s]:
                self.pitch=-4
            if pygame.key.get_pressed()[K_d]:
                self.yaw=-4
            if pygame.key.get_pressed()[K_i]:
                self.y=-1
            if pygame.key.get_pressed()[K_k]:
                self.y=1
            if pygame.key.get_pressed()[K_j]:
                self.x=-1
            if pygame.key.get_pressed()[K_l]:
                self.x=1
            if pygame.key.get_pressed()[K_u]:
                self.z=-1
            if pygame.key.get_pressed()[K_m]:
                self.z=1

    #Create instances of the objects and add the models
    cube=cube()
    cube_frame=cube.add_subobject(SubObjectBase())
    cube_frame.add_nodes(((-18,-13,124),(-20,-9,122),(-20,-9,126),(-16,-9,126),(-16,-9,122),(-20,-5,122),(-20,-5,126),(-16,-5,126),(-16,-5,122),(-24,-7,124),(-18,-7,130),(-12,-7,124),
                          (-18,-7,118),(-18,-1,124)))
    cube_frame.add_faces((((0,1,2),white),((0,2,3),blue),((0,3,4),red),((0,4,1),green),((9,1,2),yellow),((9,2,6),cyan),((9,6,5),magenta),((9,5,1),light_blue),
                          ((10,2,3),pink),((10,3,7),purple),((10,7,6),grey),((10,6,2),dark_grey),((11,3,4),light_grey),((11,4,8),dark_blue),((11,8,7),dark_green),
                          ((11,7,3),lime_green),((12,1,4),orange),((12,4,8),white),((12,8,5),blue),((12,5,1),red),((13,5,6),green),((13,6,7),cyan),((13,7,8),magenta),
                          ((13,8,5),light_blue)))
    cube_frame.face_angles(((0,(27,0,90)),(1,(27,0,180)),(2,(27,0,270)),(3,(0,27,0)),(4,(117,0,90)),(5,(117,90,90)),(6,(117,180,90)),(7,(117,270,90)),
                            (8,(0,117,0)),(9,(90,117,0)),(10,(180,117,0)),(11,(270,117,0)),(12,(117,0,0)),(13,(117,0,90)),(14,(117,0,180)),
                            (15,(117,0,270)),(16,(0,117,180)),(17,(90,117,180)),(18,(180,117,180)),(19,(270,117,180)),(20,(153,0,90)),(21,(153,0,180)),
                            (22,(153,0,270)),(23,(153,0,0))))

    #Add your objects to the game
    objects={}
    objects["cube"]=cube
    game.objects=objects

    #Create lights(x,y,z,brightness(%),colour)
    game.add_light(x=0,y=0,z=0,brightness=100,colour=white)

    #Define what should happen each tick
    class TickHandler():

        #Defines what should happen before objects update
        def pre_update(self,game):
            pass

        #Defines what should happen after objects update
        def post_update(self,game):
            pass

    #Allows use of a custom GUI
    class GUI():

        #What should happen every update
        def update(self,game):
            pass

        #Draws the GUI
        def draw(self,game):
            pass

    #Do not change
    game.tick_handler=TickHandler()
    game.gui=GUI()

    #Start the game loop
    game.loop()

#Runs the game
main()

#Be IDLE friendly
pygame.quit()
