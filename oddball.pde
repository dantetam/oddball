interface Ball
{
  void move();
  void changeDir();
  void show(); //we will combine processing functions
  //better practice is to not mix data and processing functions
}

class RegularBall implements Ball
{
  float posX, posY;
  float speed, dir;
  
  RegularBall()
  {
    posX = random(0,1)*width;
    posY = random(0,1)*width;
    speed = random(2,4);
    dir = random(0,1)*PI*2;
  }
  
  void move() {posX += speed*cos(dir); posY += speed*sin(dir);}
  void show() 
  {
    fill(255);
    ellipse(posX-5,posY-5,10,10);
  }
  void changeDir()
  {
    if (posX < 0 || posY < 0 || posX > width || posY > height)
    {
      dir -= PI/2;
    }
  }
}

class OddBall implements Ball
{
  float posX, posY;
  float speed, dir;
  boolean left;
  
  OddBall()
  {
    posX = random(0,1)*width;
    posY = random(0,1)*width;
    speed = 4;
    dir = random(0,1)*PI*2;
    left = true;
  }
  
  void move() {posX += speed*cos(dir); posY += speed*sin(dir);}
  void show() 
  {
    fill(255,0,0);
    ellipse(posX-10,posY-10,20,20);
  }
  void changeDir()
  {
    if (posX < 0 || posY < 0 || posX > width || posY > height)
    {
      dir -= PI/2;
      left = random(0,1) < 0.5;
    }
    if (left)
    {
      dir += random(0,0.05);
    }
    else
    {
      dir -= random(0,0.05);
    }
    if (random(0,1) < 0.1)
    {
      left = !left;
    }
  }
}

Ball[] balls; //float width = 500; float height = 500;
public void setup()
{
  size(750,750);
  balls = new Ball[30];
  balls[0] = new OddBall();
  for (int i = 1; i < balls.length; i++)
  {
    balls[i] = new RegularBall();
  }
}

public void draw()
{
  background(0);
  for (int i = 0; i < balls.length; i++)
  {
    balls[i].changeDir();
    balls[i].move();
    balls[i].show();
  }
}
