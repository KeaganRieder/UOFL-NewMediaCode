/*
#########################################################################################################################
  New Media 3380 Assignment 1
  Author: Keagan Rieder
#########################################################################################################################
  for Conrtols check control file
#########################################################################################################################
*/

//global varibles
int halfWidth;
int halfHeight;
color backGroundColor = color(0,0,0);
int changeCheck = 0;

//setup
/*
setting up key things in the program
*/
void setup(){
  size(1900,1000);
  background(backGroundColor);
  halfWidth = width/2;
  halfHeight = height/2;
}

/*draw/main program loop
   calls functions to run/check controls which then perform ceratin tasks
*/
void draw(){
    MouseControls();
    GeneralControls();
    if(changeCheck >= 5){
        changeCheck =0;
        ComboControls();        
    }
    changeCheck++;
    
}
