/* 
###########################################################################################
  File Summary
  >> contains the functions which draw parts of the background that relate 
  to biulding forming the city scape
###########################################################################################
*/

//biulding varibles
int totalBiuldings = 0;
int biuldingWidth = 50;
IntList biuldingHeight = new IntList();
int biudlingY = horizenLine;
IntList biudlingX = new IntList();

//light varibles 
int totalLights = 0;
int lightSize = 5;
IntList lightY = new IntList();
IntList lightReflectedY = new IntList();
IntList lightX = new IntList();
int lightChance = 10;
int blinkChance = 5;
IntList lightOff = new IntList();
boolean powerOutage = false;

//color varibles
color biuldingColor = color(30,33,49);
color lightColor = color(214,204,13);

/*
###########################################################################################
  functions to draw the city scape
###########################################################################################
*/
//his.size = new Vector2(biuldingWidth,-biuldingHeight);
//functions to initalize drawing
void InitalizeCitySilhouette(){
  //initally drawing the city

  int silhouetteSize = width;
  for (int x = 0; x < silhouetteSize; x += biuldingWidth) {
    fill(biuldingColor);
    int tempHeight = (int)random(100, 200);
    
    rect(x,horizenLine, biuldingWidth, -tempHeight);
    rect(x,horizenLine, biuldingWidth, tempHeight);//reflection of biuldings
    biuldingHeight.append(tempHeight);
    biudlingX.append(x);
    totalBiuldings++;
  }
  
  InitalizeLights();
}

//initally drawing lights
void InitalizeLights(){
  int tempHeight = 0;
  int biudlingXCord = 0;
  int lightXValue = 0;
  int lightYValue = 0;
  int lightSpawnValue = 0;
  fill(lightColor);
 // stroke(0);

  //drawing lights
  for (int i = 0; i < totalBiuldings; ++i) {
    tempHeight = biuldingHeight.get(i);
    biudlingXCord = biudlingX.get(i);
    for (int x = 5; x < biuldingWidth-5; x+= lightSize) {
      for (int y = 20; y < (tempHeight - 5); y+= lightSize) {
        //draw light or no?
        lightSpawnValue = (int)random(0,75);
        if(lightChance > lightSpawnValue){
          lightXValue = biudlingXCord + x;
          lightYValue = horizenLine - y;
          
          rect(lightXValue, lightYValue, lightSize, lightSize);

          lightY.append(lightYValue);
          lightX.append(lightXValue);

          //drawing reflection
          
          lightYValue = horizenLine + y;
          rect(lightXValue, lightYValue, lightSize, lightSize);

          lightReflectedY.append(lightYValue);
          lightOff.append(0);
          totalLights++;
        }
      }
    }
  }
}

//functions for continuly drawing
void DrawBiudlings(){
  //noStroke();
  fill(biuldingColor);
  for (int i = 0; i < totalBiuldings; ++i) {
    int tempHeight = biuldingHeight.get(i);
    int x = biudlingX.get(i);
    rect(x,horizenLine, biuldingWidth, -tempHeight);
    rect(x,horizenLine, biuldingWidth, tempHeight);//reflection of biuldings
  }
  
}

void DrawLights(){
  int lightXCord = 0;
  int lightYCord = 0;
  fill(lightColor);
  //stroke(0);

  for (int i = 0; i < totalLights; ++i) {
    BlinkLight(i);
    if(lightOff.get(i) == 1 || powerOutage){
      fill(biuldingColor);
    }
    else{
      fill(lightColor);
    }
    lightYCord  = lightY.get(i);
    lightXCord  = lightX.get(i); 
 
    rect(lightXCord, lightYCord, lightSize, lightSize);

    //Drawing Refelection
    lightYCord = lightReflectedY.get(i); 
    rect(lightXCord, lightYCord, lightSize, lightSize);
  }
}

void BlinkLight(int i){
   float blinkValue = (int)random(4, 5000);
   if(blinkChance > blinkValue){
        //checking to see the state of the light

        if(lightOff.get(i) == 1){
          lightOff.set(i,0);
        }
        else{
          lightOff.set(i,1);
        }
    }
}
