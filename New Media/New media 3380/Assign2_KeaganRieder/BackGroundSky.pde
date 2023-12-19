/* 
###########################################################################################
  File Summary
  >> contains the functions which define difefrnt elements fo the sky for the back ground
###########################################################################################
*/

//sky varibles
int totalStars = 0;
IntList starSize = new IntList();
IntList starX = new IntList();
IntList starY = new IntList();
IntList starReflectedY = new IntList();

int starChance = 5;
int starBlinkChance = 5;
IntList starOff = new IntList();

//sun/moon varibles 
int moonSunSize = 40;
int craterSize = 2;
int craterChance = 5;
int moonX = 0; 
int moonY = 0;

//Colors
color skyColor = color(18,8,46);
color starColor = color(255);
//note sun,moon and craters are in there respective functions
//do to needing to be changed well function is being 
//called to create a gradient

//sky functions

void InitalizeSky(){
  background(skyColor);
  int spawnStarValue = 0;
  fill(starColor);
  
  //drawing stars
  for (int x = 0; x < width; ++x) {
    for (int y = 0; y < horizenLine; ++y) {
      spawnStarValue = (int) random(0,2000);
      if(starChance > spawnStarValue){
        int tempSize = (int)  random(1,5);

        ellipse(x,y,tempSize,tempSize);
        ellipse(x,horizenLine+y,tempSize,tempSize);
        //adding star values so they can be drawn again later
        starSize.append(tempSize);
        starX.append(x);
        starY.append(y);
        starReflectedY.append(horizenLine+y);
        starOff.append(0);
        totalStars++;
      }
    }
  }
}

void DrawSky(){
  background(skyColor);
  DrawStars();
}

//draws a star repeately
void DrawStars(){
  int xCord = 0;
  int yCord = 0;
  int reflectedYCord = 0;
  int starSizeValue = 0;
  
  for (int i = 0; i < totalStars; ++i) {
    BlinkStars(i);
    if(starOff.get(i) == 1){
      fill(skyColor);
    }
    else{
       fill(starColor);
    }
    xCord = starX.get(i);
    yCord = starY.get(i);
    reflectedYCord = starReflectedY.get(i);
    starSizeValue = starSize.get(i);
    ellipse(xCord,yCord,starSizeValue,starSizeValue);
    ellipse(xCord,reflectedYCord,starSizeValue,starSizeValue);
  }
}

//blinks star
void BlinkStars(int star){
  int blinkValue = (int)random(0, 5000);
  if(starBlinkChance > blinkValue){
    if(starOff.get(star) == 1){
      starOff.set(star,0);
    }
    else{
      starOff.set(star,1);
    }
  }
}

//functions to draw the moon
void DrawMoon(){
  int moonColor = 150;
  int reflectionY = 0;
  for (int s = moonSunSize; s > 0; s--) {
    moonX = mouseX;
    moonY = mouseY;
    reflectionY = horizenLine+moonY; //used to calculate reflection cord
   
    fill(moonColor);
    ellipse(moonX,moonY,s,s);

    //only draw relection if past horizen lane.
    //no above it
    ellipse(moonX,reflectionY,s,s);
    

    //add shadding
    if (moonColor > 100 ) {
      moonColor--;
    }
  }
}

//functions to draw the sun
void DrawSun(){
  int sunR = 214;
  int sunG = 204;
  int sunB = 13;
  for (int s = moonSunSize; s > 0; s--) {
    int reflectionY = horizenLine+mouseY; //used to calculate reflection cord
    fill(sunR,sunG,sunB);
    ellipse(mouseX,mouseY,s,s);

    //only draw relection if past horizen lane.
    //no above it
    if (reflectionY > horizenLine) {
      ellipse(mouseX,reflectionY,s,s);
    }

    if (sunR > 180 ) {
      sunR--;
      sunG--;
      sunB--;
    }
  }
}
