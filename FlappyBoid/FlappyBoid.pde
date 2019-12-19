
/**
*
*This file contains the game loop, the intial setup for the window as well as the keyPressed method
*which is called when the correct button is pressed
*
**@version 25/01/2019
*@author Raymond Ward
**/




//Initialisation of needed variables
Boid b;
int timer;
ArrayList<Pipe>pipes;
static int score;
PFont f;


//Built in method setup is called when the program is first run, setting required variables
void setup()
{
  f = createFont("Arial",16,true);
  pipes = new ArrayList<Pipe>();
  size(500,500);
  score = 0;
  b = new Boid();
  b.show();

}

//built in method repeats as many times as possible (this is the game loop) however i have limited it to 60 for consistency
void draw()
{  
  frameRate(60);
  background(40,130,200);
  
 //Sets the floor
  fill(0,130,0);
  rect(0,height-40, width, 40);
  fill(130,140,80);
  rect(0,height-30, width, 40);

  //font, background and score tag
  textFont(f,16);                  
  fill(0);                         
  text("SCORE: " + score,width/2,height-10);

  //Checking if boid is too high or too low with regards to window
  if (b.y > height-40 || b.y < 0)
  {
    died(); 
  }
  
  //Calls the method that implements velocity and gravity
  b.update();
  
  //Updates the position of pipes (make them look like they are moving)
  for (int i = 0; i < pipes.size(); i++)
  {
    pipes.get(i).update();
  }
  
  //Adds a new pipe every amount of time
  if (millis() - timer >= 2500) 
  {
    pipes.add(new Pipe());
    timer = millis();
    score++;
  }
  
  //removes the pipes if the boid has already passed them
  for (int i = 0; i < pipes.size(); i++)
  {
    if (b.x > pipes.get(i).xPos + 50)
    {
      pipes.get(i).remove();
    }
  }
  
  //checks the collision of the boid and the pipe.
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

//Method called when any button is pressed however move() is only called when that button is space
void keyPressed()
{
  if (key == ' ')
  {
    b.move();
  }
}
