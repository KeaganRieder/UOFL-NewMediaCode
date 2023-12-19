/*
###########################################################################################
  Assignement 3 for newmeida 3380
  title: A galaxy's life cycle
  by Keagan rieder

  the sketch is meant to illistrate roughly the life of a gaxley. 
  the sketch starts of in abalck screen, which is meant to illistrate  how there 
  was nothing, and then by hitting n theres a flash of light and  now a galaxy.
  the user then can jump to and from differnt systems through pressing the
  respective keys, or they can end the current galaxy showing how evetaully
  galaxys will dissapear  

  note - controls can be found in the readme
###########################################################################################
*/

/* 
###########################################################################################
  File Summary
  >> conatins the programs setup functions
  >> conatins the programs draw functions (main program loop)
  >> varibles which are used throughout the porgram 
  and aren't just spefcic to this file
###########################################################################################
*/

//varibles
color backGroundColor = color(0);

//class varibles
Vector3 centerPoint;
SketchManger maneger;

CustomCamera camera;

//Program Setup
void setup(){
  
  frameRate(30);
  size(1920, 1080, P3D);
  background(backGroundColor);
   
  //creating classes
  centerPoint = new Vector3(width/2, height/2,0);
  maneger = new SketchManger();
  camera = new CustomCamera();
  
}

//program loop
void draw() {
  
  camera.PlaceCamera(); //placing camera
  maneger.DisplayState();
  maneger.CheckInput();
}
