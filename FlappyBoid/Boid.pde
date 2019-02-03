/**
* This class is the entinty that is controlled by the user by pressing space
*@version 25/01/2019
*@author Raymond Ward
*
**/


class Boid
{ 
  float x = width/2;
  float y = height/2;
  float gravity = 0.3;
  float velocity = 0;
  PImage bird = loadImage("flap.png");
  float sizeBird = bird.height * bird.width;
  
  
//This method displays the image of the bird at the desired and and y co-ordinate
  void show()
  {
    image(bird, x,y);
  }
  
//The update method is called every frame, this implements gravity
  void update()
  {
    y += velocity;
    velocity += gravity;
    show();
     
  }

//This is the method called when the user clicks the correct button
  void move()
  {
     velocity -=8;
  }
  


}
