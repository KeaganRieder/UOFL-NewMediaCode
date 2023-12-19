/* 
###########################################################################################
  File Summary
  >> contains the functions that utilize functions defined in the 
  other background files to create an animated city scape background
  >> it also conatins function taht allow the user to interact with
  the background
###########################################################################################
*/

//Background varibles
/*
  time represnts the scenes time
  time = 0 is midnight
  time = 6 is noon
*/
int time = 0;
int timeChangeDelay = 0;
int updateDelay = 0;
int oceanR = 11;
int oceanG = 33;
int oceanB = 75;

//function to draw the inital background
void InitalizeBackGround(){
  noStroke();
  noCursor();
  InitalizeSky();
  InitalizeCitySilhouette();
  carYCords = horizenLine - 10;
}

//function draws background
void DrawBackGround(){
  DrawSky();
  //drawing sun and moon
  if(drawSun){
    DrawSun();
  }
  else{
    DrawMoon();
  }
  DrawClouds();
  DrawBiudlings();
  DrawLights();
  DrawRoad();
  ExecuteCarEvent();
 // DrawOcean(); 

  //things requiring slight delay
  if(updateDelay == 15){
    switchTimes();
    updateDelay = 0;
  }
  updateDelay++;
}

//Background functions

void DrawRoad(){
  fill(54,54,51);
  rect(0, horizenLine, width, 10);
}

void DrawOcean(){
  int depth = 75;
  int size = 20;
  
  for (int y = horizenLine; y < height; y+=size) {
    fill(oceanR,oceanG,oceanB,depth);
    rect(0, y , width, size);
    depth += 25;
  }
}

void switchTimes(){
  if(timeChangeDelay != 7){
    timeChangeDelay++;
  }

  //check time
  if(isDay){
    //swaping color pallats from night to day
    //morning pallate
    if(time == 2){
      biuldingColor = color(23,24,31);
      lightColor = color(214,204,13);
      skyColor = color(211,119,77);
      starColor = color(255);
      carColor = color(255);
      oceanR = 51;
      oceanG = 99;
      oceanB = 155;
      cloudColor = color(219,172,77);
    }
    //between pallate
    else if (time == 4) {
      biuldingColor = color(39,37,77);
      lightColor = biuldingColor;
      skyColor = color(211,173,77);
      starColor = skyColor;
      carColor = biuldingColor;
      oceanR = 71;
      oceanG = 121;
      oceanB = 180;
      drawSun = true;
      cloudColor = color(255);
    }
    //noon pallate
    else if (time == 6) {
      biuldingColor = color(20,50,64);
      lightColor = biuldingColor;
      skyColor = color(57,170,150);
      starColor = skyColor;
      carColor = biuldingColor;
      oceanR = 66;
      oceanG = 110;
      oceanB = 183;
    }
    if(time != 6 && timeChangeDelay >= 5){
      time ++;
      timeChangeDelay =0;
    }
    
  }
  else{    
    //swaping color pallats from  day to night
    //afternoon pallate
    if(time == 6){
      biuldingColor = color(83,56,103);
      lightColor = biuldingColor;
      skyColor = color(110,68,188);
      starColor = skyColor;
      carColor = biuldingColor;
      oceanR = 22;
      oceanG = 44;
      oceanB = 86;
      cloudColor = color(106,17,163);
    }
    //dusk pallate
    else if (time == 4) {
      biuldingColor = color(41,33,52);
      lightColor = color(214,204,13);
      skyColor = color(68,44,100);
      starColor = color(255);
      carColor = color(255);
      oceanR = 11;
      oceanG = 33;
      oceanB = 75;
      drawSun = false;
      cloudColor = color(54,27,80);
    }
    //midnight pallate
    else if (time == 2) {
      biuldingColor = color(35,37,59);
      lightColor = color(214,204,13);
      skyColor = color(18,8,46);
      starColor = color(255);
      carColor = color(255);
      oceanR = 6;
      oceanG = 23;
      oceanB = 55;
      cloudColor = color(53,16,75);
    }

    //moving time
    if(time != 0 && timeChangeDelay == 7){
      time --;
      timeChangeDelay = 0;
    }
  }
}
