/* Exercise Summary
  create op(optical illusion) art with animated elements
*/

/* File Sumary
###########################################################################################
  file conatins the project set up and draw function
  with set up setting up anything that needs to be done on program start
  and draw referenshing each frame with it's contents

###########################################################################################
*/

//global varible
ArrayList<OpticalIllsuion> illusionParts = new ArrayList<OpticalIllsuion>();
OpticalIllsuion test;
color backGroundColor = color (255);
//setup
void setup(){
  //frameRate(4);
  size(1000,1000);
  background(backGroundColor);
  
  //initalzing the optical illusion
  /*
   Vector2 cords = new Vector2(width/2,height/2);
    Vector2 Size = new Vector2(width,width);    
    Vector2 offset = new Vector2(-1,-1);
    color illusionColor = color(0);
    test = new OpticalIllsuion( cords,Size,offset,illusionColor);*/
 // rectMode(CENTER);
  
  for(int i = 0; i < width*2; i+= 20){
    //OpticalIllsuion constructor (Vector2 cords,Vector2 size, Vector2 offset, color illisonColor)
      Vector2 cords = new Vector2(0,0);
      Vector2 Size = new Vector2(i,i);    
      Vector2 offset = new Vector2(-1,-1);
      color illusionColor = color(0);
      
      illusionParts.add(new OpticalIllsuion( cords,Size,offset,illusionColor));
  
  
  }
}

//draw
void draw(){
  //test.Move();
  //rect(width/2-10,height/2-10, 10,10);
  
 for(int i = 0; i < illusionParts.size(); i++){
   illusionParts.get(i).Move();
  }
}
