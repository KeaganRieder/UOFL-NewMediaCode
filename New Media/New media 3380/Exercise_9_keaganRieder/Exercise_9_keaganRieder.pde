/*
####################################################################################################
  about
  this is exercise 4. the goal of which is to
  - cretae several moving object with there motion confined to the canvas
  - eventually creating effects around these objects
  This is th emain file holding the setup and drawing functions  
####################################################################################################
*/


//global varibles
int halfScreenHeight;
int halfScreenWidth;
color backgroundColor = color(0,0,0);

//shape 1 values
int shape1Width = 100;
int shape1Height = 100;
int Shape1X = 0+shape1Height;
int Shape1Y = 0+shape1Width;
//movement values
int shape1XDirection = 1;
int shape1YDirection =1;
int Shape1XSpeed = 5;
int Shape1YSpeed = 10;

//shape 2 values
int shape2Width = 100;
int shape2Height = 100;
int Shape2X = 0+shape2Height;
int Shape2Y = 0+shape2Width;
//movement values
int shape2XDirection = 1;
int shape2YDirection =1;
int Shape2XSpeed = 5;
int Shape2YSpeed = 10;

MovingCirc test;

//setup
void setup(){
  size(1000, 1000);
  background(backgroundColor);
  halfScreenHeight = height / 2;
  halfScreenWidth = width / 2;
  noStroke();
  ellipseMode(RADIUS);
  
  test.rectColor = color(255);
  test.rectWidth = 10;
  test.rectHeight = 10;
}


//draw 
void draw(){
//  background(backgroundColor);

  fill(0,50);
  rect(0,0,width,height);

  drawshapes();

}


void drawshapes(){
  //shape 1
  fill((int)random(0,255),(int)random(0,255),(int)random(0,255));
  ellipse(Shape1X,Shape1Y,3,3);
  fill((int)random(0,255),(int)random(0,255),(int)random(0,255));
  ellipse(Shape1X+(int)random(-30,30),Shape1Y+(int)random(-30,30),5,5);
  //shape 2
  fill((int)random(0,255),(int)random(0,255),(int)random(0,255));
  ellipse(Shape2X,Shape2Y,5,5); 
  fill((int)random(0,255),(int)random(0,255),(int)random(0,255));
  ellipse(Shape2X+(int)random(-30,30),Shape2Y+(int)random(-30,30),5,5);
  fill((int)random(0,255),(int)random(0,255),(int)random(0,255));
  ellipse(Shape2X+(int)random(-30,30),Shape2Y+(int)random(-30,30),5,5);
  
    MoveShape1();
  MoveShape2();

}
void MoveShape1(){
 
  if(Shape1X + shape1XDirection * Shape1XSpeed > width - shape1Width/2){
    shape1XDirection *= -1;
    Shape1XSpeed = (int)random(1,10);
    Shape1YSpeed = (int)random(1,10);
  }
  if(Shape1X + shape1XDirection * Shape1XSpeed < 0 + shape1Width/2 ){
    shape1XDirection *= -1;
    Shape1XSpeed = (int)random(1,10);
    Shape1YSpeed = (int)random(1,10);
  }
  
  if(Shape1Y + shape1YDirection * Shape1YSpeed > height - shape1Height/2){
    shape1YDirection *= -1;
    Shape1YSpeed = (int)random(1,10);
    Shape1XSpeed = (int)random(1,10);
  }
  if(Shape1Y + shape1YDirection * Shape1YSpeed < 0 +shape1Height/2 ){
    shape1YDirection *= -1;
    Shape1YSpeed = (int)random(1,10);
    Shape1XSpeed = (int)random(1,10);
  }
  
  Shape1X += shape1XDirection * Shape1XSpeed;
  Shape1Y += shape1YDirection * Shape1YSpeed;
}

void MoveShape2(){
 
  if(Shape2X + shape2XDirection * Shape2XSpeed > width - shape2Width/2){
    shape2XDirection *= -1;
    Shape2XSpeed = (int)random(1,10);
    Shape2YSpeed = (int)random(1,10);
  }
  if(Shape2X + shape2XDirection * Shape2XSpeed < 0 + shape2Width/2 ){
    shape2XDirection *= -1;
    Shape2XSpeed = (int)random(1,10);
    Shape2YSpeed = (int)random(1,10);
  }
  
  if(Shape2Y + shape2YDirection * Shape2YSpeed > height - shape2Height/2){
    shape2YDirection *= -1;
    Shape2YSpeed = (int)random(1,10);
    Shape2XSpeed = (int)random(1,10);
  }
  if(Shape2Y + shape2YDirection * Shape2YSpeed < 0 +shape2Height/2 ){
    shape2YDirection *= -1;
    Shape2YSpeed = (int)random(1,10);
    Shape2XSpeed = (int)random(1,10);
  }
   
  Shape2X += shape2XDirection * Shape2XSpeed;
  Shape2Y += shape2YDirection * Shape2YSpeed;
}
