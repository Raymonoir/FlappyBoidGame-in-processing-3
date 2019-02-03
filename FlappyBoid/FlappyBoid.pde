
/**
*
*This file contains the game loop, the intial setup for the window as well as the keyPressed method
*which is called when the correct button is pressed
*
**@version 25/01/2019
*@author Raymond Ward
**/





Boid b;
int timer;
ArrayList<Pipe>pipes;
static int score;
PFont f;



void setup()
{
  f = createFont("Arial",16,true);
  pipes = new ArrayList<Pipe>();
  size(500,500);
  score = 0;
  b = new Boid();
  b.show();

}

void draw()
{  
  background(40,130,200);
  
 
  fill(0,130,0);
  rect(0,height-40, width, 40);
  fill(130,140,80);
  rect(0,height-30, width, 40);

  
  textFont(f,16);                  
  fill(0);                         
  text("SCORE: " + score,width/2,height-10);

  if (b.y > height-40 || b.y < 0)
  {
    died(); 
  }
  

  
  b.update();
  for (int i = 0; i < pipes.size(); i++)
  {
    pipes.get(i).update();
  }
  
  if (millis() - timer >= 2500) 
  {
    pipes.add(new Pipe());
    timer = millis();
    score++;
  }
  
  for (int i = 0; i < pipes.size(); i++)
  {
    if (b.x > pipes.get(i).xPos + 50)
    {
      pipes.get(i).remove();
    }
  }
  
    for (int i = 0; i < pipes.size(); i++)
  {
    if (pipes.get(i).checkCollision(b.x,b.y))
    {
      died();
    }
    
  }

    
}

//Method called when boid collides with floor, pipes or ceiling. 
void died()
{
  frameCount = -1;
}

//Method called when any button is pressed however move() is only called whne that button is space
void keyPressed()
{
  if (key == ' ')
  {
    b.move();
  }
}
