/*
exercise 5
*/

//global varibles
int r = 0;
int b = 0;
int g = 0;

//Setup
void setup(){
  size(1200,900);
    sky();
  ground();
  Moon();
}

//draw
void draw(){
  if(mousePressed == true){
    if(keyPressed == true){
      if(key == 'b'){
        whiteBrush();
      }
    }
  }
  if(keyPressed == true){
    if(key == 'w'){
      whiteThinLine();}
    
  }
}

//function decleration
  
//this function creates the sky in out landscape
void sky(){
   noStroke();
   fill(0,0,255);
   rect(0,0, width, 2*(height/3));
}

//function creates ground plane
void ground(){
   noStroke();
   fill(0,0,255);
   rect(0, 2*(width/2), width,height/3);
}

//fucntion creates moon
void Moon(){
  for(int i = 255; i >= 0; i--){
    noStroke();
    fill(i,i,255);
    ellipse(width/6, height/5,i,i);
  }
}

void whiteBrush(){
  noStroke();
  fill(255,40);
  ellipse(mouseX, mouseY, 25,25);
}
void whiteThinLine(){
   noStroke();
  fill(255,40);
  ellipse(mouseX, mouseY, 10,5);
}
