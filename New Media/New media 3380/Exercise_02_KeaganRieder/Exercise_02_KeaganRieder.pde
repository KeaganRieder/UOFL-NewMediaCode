/*
About
Create a 2D abstract composition using points, lines, shapes, and color. 
Create variations around the main composition so that you create a serial design 
that has unity and variety throughout the series.
*/


//Global Varibles
int draw = 1;
int screenWidth = 1000;
int screenHeight = 800;
int skyHeight = 500;
int Stars= 2000;
int Biuldings =10;


//Main Body
void setup(){
  size(1000,800);
  fill(0,0,50);
  rect(0,0,1000,screenHeight);
}

void draw(){
  if(draw == 1){
    DrawNightSky();
    draw = 0;
  }
  
}

void CheckRBounds(){
  
}

void DrawNightSky(){
  int circleSize = 5;
  int x = 0;
  int y = 0;
  int r = 255;
  int g = 255;
  int b = 255;
  for(int i = 0; i < Stars; i++){
   // r = int(random(255));
    //g = int(random(255));
   // b = int(random(255));
    x = int(random(screenWidth));
    y =  int(random(skyHeight-20));
    fill(r,g,b,60);
    circle(x, y, circleSize);
   }  
}

void DrawBiulding(){
   int biuldingWidth = 10;
   int biuldingheight = 0;
   int x = 0;
   for(int i = 0; i < Biuldings ;i++){
      biuldingheight =  int(random(50));
      fill(0,0,50);
      rect(x,screenHeight,biuldingWidth,biuldingheight);
      x +=biuldingWidth;
   }
  
}
