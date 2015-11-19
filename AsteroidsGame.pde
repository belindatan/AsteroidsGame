//your variable declarations here
SpaceShip T1=new SpaceShip();
Star[]B1;

Asteroid[]U1;


public void setup() 
{
  B1=new Star [500];
  for(int i=0;i<B1.length;i++)
  {
  B1[i]=new Star();
  }
  
 
  U1=new Asteroid[10];
  for(int i=0;i<U1.length;i++)
  {
  U1[i]=new Asteroid();
  }
  
  size(500,500);//your code here
}
public void draw() 
{
 background(255);
T1.show();
T1.move();


for (int i=0; i<B1.length; i++)
  {
    //B1[i].move();
    B1[i].show();
    }

for (int i=0; i<U1.length; i++)
  {
  
    U1[i].show();
    U1[i].move();
    }
  //your code here
}

class Star
{
  private double direction, distance;
  private double myX, myY;
  public Star()
  {
    myX=Math.random()*500;
    myY=Math.random()*500;
   /* distance=Math.random()*500;
    direction=Math.random()*2*Math.PI;
    myX=(Math.cos(direction)*distance)+200;
    myY=(Math.sin(direction)*distance)+200; */
  }
  public void show()
  {
    ellipse((int)myX,(int)myY,3,3);
  }
}

public void keyPressed()
{
  if (key=='w')
    {
      T1.accelerate(0.2); 
    }
       //up
  if (key=='s')
    {
      T1.accelerate(-0.2); 
    }
       //down
  if (key=='d')
    {
      T1.rotate(20); 
    }
       //right
  if (key=='a')
    {
      T1.rotate(-20); 
    }

  //left
  if (key=='h')
    {
      T1.setX((int)(Math.random()*500));
      T1.setY((int)(Math.random()*500));
      T1.setDirectionX(0);
      T1.setDirectionY(0);
      T1.setPointDirection((int)(Math.random()*360));
    }}
class SpaceShip extends Floater  
{  public SpaceShip()
  {
    myCenterX=250;
    myCenterY=250;
    corners=3;
    xCorners=new int [corners];
    yCorners=new int [corners];
    xCorners[0]=-8;
    yCorners[0]=-8;
    xCorners[1]=16;
    yCorners[1]=0;
    xCorners[2]=-8;
    yCorners[2]=8;
  }
   public void setX(int x) {myCenterX=x;}
   public int getX(){return myCenterX;}   
   public void setY(int y) {myCenterY=y;}   
   public int getY(){return myCenterY;}   
   public void setDirectionX(double x){myDirectionX=x;}   
   public double getDirectionX(){return myDirectionX;}   
   public void setDirectionY(double y){myDirectionY=y;}   
   public double getDirectionY(){return myDirectionY;}   
   public void setPointDirection(int degrees){myPointDirection=degrees;}   
   public double getPointDirection(){return myPointDirection;} 

    //your code here
}

class Asteroid extends Floater
{ private int a;
  public Asteroid()
  {
    if (Math.random()>.5)
      a=1;
    else 
      a=-1;

    myCenterX=300;
    myCenterY=300;
    corners=8;
    xCorners=new int [corners];
    yCorners=new int [corners];
    xCorners[0]=30;
    yCorners[0]=0;
    xCorners[1]=10;
    yCorners[1]=-10;
    xCorners[2]=0;
    yCorners[2]=-30;
    xCorners[3]=-10;
    yCorners[3]=-10;
    xCorners[4]=-30;
    yCorners[4]=0;
    xCorners[5]=-10;
    yCorners[5]=10;
    xCorners[6]=0;
    yCorners[6]=30;
    xCorners[7]=10;
    yCorners[7]=10;
    //make a equal + or - equal probability for rotate
  }  
  public void speed ()
  {
    T1.rotate(a);
  }
  public void move()
  {
    rotate(a);
    super.move();
    myCenterX += myDirectionX+3;    
    myCenterY += myDirectionY+3;
  }

   public void setX(int x) {myCenterX=x;}
   public int getX(){return myCenterX;}   
   public void setY(int y) {myCenterY=y;}   
   public int getY(){return myCenterY;}   
   public void setDirectionX(double x){myDirectionX=x;}   
   public double getDirectionX(){return myDirectionX;}   
   public void setDirectionY(double y){myDirectionY=y;}   
   public double getDirectionY(){return myDirectionY;}   
   public void setPointDirection(int degrees){myPointDirection=degrees;}   
   public double getPointDirection(){return myPointDirection;} 

}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected int myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  

  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

