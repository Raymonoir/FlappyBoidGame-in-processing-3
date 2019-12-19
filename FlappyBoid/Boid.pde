/**
* This class is the entinty that is controlled by the user by pressing space
*@version 25/01/2019
*@author Raymond Ward
*
**/


class Boid
{ 
  //Sets all properties of a given boid
  float x = width/2;
  float y = height/2;
  float gravity = 0.3;
  float velocity = 0;
  PImage bird = loadImage("flap.png");
 // float sizeBird = bird.height * bird.width;
  
  
//This method displays the image of the bird at the desired x and y co-ordinate
  void show()
  {
    image(bird, x,y);
  }
  
//The update method implements gravity
  void update()
  {
    y += velocity;
    velocity += gravity;
    show();
     
  }

//This is the method called when the user clicks the correct button to move the boid
  void move()
  {
     velocity -=8;
  }
  


}
