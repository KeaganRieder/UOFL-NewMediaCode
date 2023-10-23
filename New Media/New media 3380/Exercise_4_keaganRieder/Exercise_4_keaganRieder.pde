/*
exercise 4
*/

//global varibles
int backGroundR = 0;
int backGroundG = 0;
int backGroundB = 0;
int r = 255, g = 255, b = 255;
int penSize = 50;
//CircPen circPen = new CircPen(circSize,circPenColor);

//Setup
void setup(){
  size(1000,800);
  background(backGroundR,backGroundG,backGroundB);
}

//draw
void draw(){
  if(keyPressed){
    if(key == 'q'){
      penSize += 1;
    }
    else if(key == 'e'){
      if(penSize> 1){
        penSize -= 1;
      }
    }
    else if(key == 'w'){
      MakeRandomColor();
    }
    else if(key == 'r'){
       background(backGroundR,backGroundG,backGroundB);
    }
  }
  
  if(mousePressed && (mouseButton == LEFT)){   
   CircPen(mouseX, mouseY,penSize, r,g,b);
  }
  else if (mousePressed && (mouseButton == RIGHT)) {
    CircPen(mouseX, mouseY,penSize, backGroundR,backGroundG,backGroundB);
  }
}

//function decleration

void KeyPressed(){
  if (key == CODED) {
    if (keyCode == UP) {
      
    } else if (keyCode == DOWN) {
      penSize -= 10;
     
    } 
  }
  
}


void MakeRandomColor(){
  r = int(random(0,255));
   g = int(random(0,255));
    b = int(random(0,255));
}

//circle pen
void CircPen(int x, int y, int size, int r, int g, int b){
  noStroke();
    fill(r,g,b);
    circle(x,y,size);
}




//class decleration

class XY{
   public int x = 0,y = 0;
   public XY(int x, int y){
     this.x = x;
     this.y = y;
   }
}
