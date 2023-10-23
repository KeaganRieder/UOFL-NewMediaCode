/*
About 
intercative drawing program where colors can change dynamically
*/

//global varibles
color backgroundPenColor = color(150,150,150);
color circPenColor = color(0,0,0);
int circSize = 50;
CircPen circPen = new CircPen(circSize,circPenColor);

//Setup
void setup(){
  size(1000,800);
  background(backgroundPenColor);
}

//draw
void draw(){
  if(keyPressed){
    if(key == 'q'){
      circSize += 1;
      circPen.UpdateSize(circSize);
    }
    else if(key == 'e'){
      if(circSize> 1){
        circSize -= 1;
      }
      circPen.UpdateSize(circSize);
    }
    else if(key == 'w'){
      MakeRandomColor();
    }
    else if(key == 'r'){
      background(backgroundPenColor);
    }
  }
  
  if(mousePressed && (mouseButton == LEFT)){   
    circPen.UpdateColor(circPenColor);
    circPen.run(mouseX, mouseY);
  }
  else if (mousePressed && (mouseButton == RIGHT)) {
    circPen.UpdateColor(backgroundPenColor);
    circPen.run(mouseX, mouseY);
  }
}

//function decleration

void KeyPressed(){
  if (key == CODED) {
    if (keyCode == UP) {
      
    } else if (keyCode == DOWN) {
      circSize -= 10;
      circPen.UpdateSize(circSize);
    } 
  }
  
}

public void MakeRandomColor(){
  int r = int(random(0, 255));
  int g = int(random(0, 255));
  int b = int(random(0, 255));
  circPenColor = color(r,g,b);
}

//class decleration

class XY{
   public int x = 0,y = 0;
   public XY(int x, int y){
     this.x = x;
     this.y = y;
   }
}


class CircPen{
  private int size;
 // private XY cords;
  private color penColor;
  
  public CircPen(int size, color penColor){
    this.size = size;
    //this.cords = cords;
    this.penColor = penColor;
  } 
  
  public void UpdateColor(color penColor){
    this.penColor = penColor;
  }
  public void UpdateSize(int size){
    this.size = size;
  }
  
  public void run(int x, int y){
    noStroke();
    fill(penColor);
    circle(x,y,size);
  }
}
