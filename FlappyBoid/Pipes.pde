/**
*This class is the blueprint for the pipes in which generate on the right side of the screen
*and act as the players' obstacles
*
*Each pipe is made up of two rectangles, one starting from the bottom going up and another starting at the top going down
*
*@version 25/01/2019
*@author Raymond Ward
**/




class Pipe
{
  //Sets required properties for any given pipe
  int WIDTH = 50;
  float heightTop = floor(random(height - 400, height /2 - 50)); //high from top
  float heightBottom = floor(random(height -400 ,(height - 50)/2) -20); //hight from bottom
  float xPos = width-WIDTH;
  
  
  //This method displays each pipe to the screen
  void show()
  { 
    
    fill(0,255,100);                 // x y width height
    rect(xPos  ,0, WIDTH ,heightTop);
    rect(xPos,height -heightBottom - 40  ,WIDTH,heightBottom);
    
 
    
  }
  
  //This method is called every frame and makes the pipes move across the screen
  void update()
  {
    xPos =xPos - 1.5;
    show();
    
  }
  
//This method is called when a pipe is passed
  void remove()
  {
      fill(0,255,100); // x y width height
      rect(xPos  ,0,WIDTH ,heightTop);
      rect(xPos,height -heightBottom - 40  ,WIDTH,heightBottom);   
   }
   
   
// This method checks if the boid has collided with a pipe by checking if the boid is in the bounds of each pipe
  boolean checkCollision(float x, float y)
  {
    if (x > this.xPos && x < this.xPos + WIDTH || x + 20 > this.xPos && x + 20 < this.xPos + WIDTH )
    {
      if (y > 0 && y < heightTop || y < height && y> height - heightBottom - 40 || y + 10 < height && y + 10> height - heightBottom - 40)
      {
        return true;
      }    
    } 
    
    return false ;
   
    
  }
  
}
