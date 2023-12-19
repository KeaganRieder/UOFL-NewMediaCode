/* 
###########################################################################################
  File Summary
  >> conatins the programs setup functions
  >> conatins the programs draw functions (main program loop)
  >> varibles which are used throughout the porgram 
  and aren't just spefcic to this file
###########################################################################################
*/

//global Varibles
int inputDelay = 0;
int scene = 0;
int horizenLine;
int saveDelay = 0;
boolean isDay = false;
boolean drawSun = false;

//Program Setup
void setup(){
  //frameRate(30);
  size(1920,1080);
  horizenLine = height-300;
  //initalizing background
  InitalizeBackGround();
}

//program draw function
void draw(){
  //repeatly red drawing background
  DrawBackGround();
  //checking for interaction
  CheckForInteraction();
  //svaing after delay
  if(saveDelay >= 15){
    SaveCurrentFrame();
    saveDelay =0;
  }
  saveDelay++;
}
