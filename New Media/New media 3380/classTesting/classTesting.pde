/*
#######################################################################
 just testing classes in processing

#######################################################################
*/

//global varibles
float screenHalfWidth;
float screenHalfHeight;
color backGroundColor = color(0,0,0);

//shapes
CustomEllipse ellipse1 = new CustomEllipse();
CustomEllipse ellipse2 = new CustomEllipse();
CustomEllipse ellipse3 = new CustomEllipse();
CustomEllipse ellipse4 = new CustomEllipse();
CustomEllipse ellipse5 = new CustomEllipse();
CustomEllipse ellipse6 = new CustomEllipse();


//setup
void setup(){
  size(2000,1000);
  screenHalfWidth = width/2;
  screenHalfHeight = height/2;
  
  //setting shapes varibles
  ellipse1.size = new Varible2(10,10);
  ellipse1.sizeOffset = new Varible2(0,0);
  ellipse1.cords = new Varible2((int)random(10,width-10),(int)random(10,height-10));
  ellipse1.direction = new Varible2(1,1);
  ellipse1.offset = new Varible2((int)random(1,10),(int)random(1,10));
  ellipse1.maxBounds = new Varible2(width , height);
  ellipse1.minBounds = new Varible2(0,0);
  ellipse1.shapeColor = color(255);  
  
  ellipse2.size = new Varible2(10,10);
  ellipse2.sizeOffset = new Varible2(0,0);
  ellipse2.cords = new Varible2((int)random(10,width-10),(int)random(10,height-10));
  ellipse2.direction = new Varible2(1,1);
  ellipse2.offset = new Varible2((int)random(1,10),(int)random(1,10));
  ellipse2.maxBounds = new Varible2(width , height);
  ellipse2.minBounds = new Varible2(0,0); 
  
  ellipse3.size = new Varible2(10,10);
  ellipse3.sizeOffset = new Varible2(0,0);
  ellipse3.cords = new Varible2((int)random(10,width-10),(int)random(10,height-10));
  ellipse3.direction = new Varible2(1,1);
  ellipse3.offset = new Varible2((int)random(1,10),(int)random(1,10));
  ellipse3.maxBounds = new Varible2(width , height);
  ellipse3.minBounds = new Varible2(0,0); 
   ellipse1.shapeColor = color(100); 
  
  ellipse4.size = new Varible2(10,10);
  ellipse4.sizeOffset = new Varible2(0,0);
  ellipse4.cords = new Varible2((int)random(10,width-10),(int)random(10,height-10));
  ellipse4.direction = new Varible2(1,1);
  ellipse4.offset = new Varible2((int)random(1,10),(int)random(1,10));
  ellipse4.maxBounds = new Varible2(width , height);
  ellipse4.minBounds = new Varible2(0,0);
  
  ellipse5.size = new Varible2(10,10);
  ellipse5.sizeOffset = new Varible2(0,0);
  ellipse5.cords = new Varible2((int)random(10,width-10),(int)random(10,height-10));
  ellipse5.direction = new Varible2(1,1);
  ellipse5.offset = new Varible2((int)random(1,10),(int)random(1,10));
  ellipse5.maxBounds = new Varible2(width , height);
  ellipse5.minBounds = new Varible2(0,0);
  
  ellipse6.size = new Varible2(10,10);
  ellipse6.sizeOffset = new Varible2(0,0);
  ellipse6.cords = new Varible2((int)random(10,width-10),(int)random(10,height-10));
  ellipse6.direction = new Varible2(1,1);
  ellipse6.offset = new Varible2((int)random(1,10),(int)random(1,10));
  ellipse6.maxBounds = new Varible2(width , height);
  ellipse6.minBounds = new Varible2(0,0);
}

//draw loop
void draw(){
  fill(0,20);
  rect(0,0,width,height);

  ellipse1.DrawSplashingShape(true,50);
  ellipse1.Move(true);
  
  ellipse2.DrawSplashingShape(true,50);
  ellipse2.Move(true);
  
  ellipse3.DrawShape(true);
  ellipse3.Move(true);
  
  ellipse4.DrawShape(true);
  ellipse4.Move(true);
  
  ellipse5.DrawSplashingShape(true, 10);
  ellipse5.Move(true);
  
  ellipse6.DrawShape(true);
  ellipse6.Move(true);
  
}
