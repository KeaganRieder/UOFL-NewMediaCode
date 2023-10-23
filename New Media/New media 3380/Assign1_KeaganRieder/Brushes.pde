/*
#########################################################################################################################
 defintions of functions that relate to the brush this includes the following
 > functiosn to increase/decrease various values of the brush:
 >> color values,
 >> size
 >> scatter chance
 > functiosn that represnt difernt brushes
 >> DefaultBrush - id num : 0
 >> ScatterBrush - id num : 1
 >> RandScatterBrush - id num : 2
 >> Eraser
 
 
 #########################################################################################################################
 */

//global varibles related to brushes
int activeBrush = 0;
int brushSize = 10;
int brushRed = 255;
int brushGreen = 255;
int brushBlue = 255;
int brushAlpha = 255;
color brushColor = color(brushRed, brushGreen, brushBlue, brushAlpha);
int scaterPlaceChance = 1;
int scaterMax = 100;

/*
#########################################################################################################################
 functions to update colors, alpha and size of brush
 #########################################################################################################################
 */
void RandomColor() {
  brushRed = int(random(0, 255));
  brushGreen = int(random(0, 255));
  brushBlue = int(random(0, 255));
  brushColor = color(brushRed, brushGreen, brushBlue, brushAlpha);
  println("random Color");
}
void UpdateRedValue(int value) {
  if (brushRed + value > 255) {
    brushRed = 255;
  } else if (brushRed + value < 0) {
    brushRed = 0;
  } else {
    brushRed += value;
    println("red:" + brushRed);
  }

  brushColor = color (brushRed, brushGreen, brushBlue, brushAlpha);
}
//updating green
void UpdateGreenValue(int value) {
  if (brushGreen + value > 255) {
    brushGreen = 255;
  } else if (brushGreen + value < 0) {
    brushGreen = 0;
  } else {
    brushGreen += value;
  }
  println("green:" + brushGreen);
  brushColor = color (brushRed, brushGreen, brushBlue, brushAlpha);
}
//updating blue
void UpdateBlueValue(int value) {
  if (brushBlue + value > 255) {
    brushBlue = 255;
  } else if (brushBlue + value < 0) {
    brushBlue = 0;
  } else {
    brushBlue += value;
  }
  println("blue:" + brushBlue);
  brushColor = color (brushRed, brushGreen, brushBlue, brushAlpha);
}
//updating alpha
void UpdateAlphaValue(int value) {
  if (brushAlpha + value > 255) {
    brushAlpha = 255;
  } else if (brushAlpha + value < 0) {
    brushAlpha = 0;
  } else {
    brushAlpha += value;
  }
  println("alpha:" + brushAlpha);
  brushColor = color (brushRed, brushGreen, brushBlue, brushAlpha);
}
//update brush size
void UpdateSize(int value) {
  if (brushSize + value < 1) {
    brushSize = 1;
  } else {
    brushSize += value;
  }
  println("size:" + brushSize);
}
//update scatter chance for scatter brush
void UpdateScaterChance(int value) {
  if (scaterPlaceChance + value > scaterMax) {
    scaterPlaceChance = scaterMax;
  } else if (scaterPlaceChance + value < 1) {
    scaterPlaceChance = 1;
  } else {
    scaterPlaceChance += value;
  }
  println("scatterChance:" + scaterPlaceChance);
}
//sets brush color to be black
void SetbrushBlack() {
  brushRed = 0;
  brushGreen = 0;
  brushBlue = 0;
  brushColor = color (brushRed, brushGreen, brushBlue, brushAlpha);
  println("brush set to black");
}
//sets brush color to be grey
void SetbrushGrey() {
  brushRed = 100;
  brushGreen = 100;
  brushBlue = 100;
  brushColor = color (brushRed, brushGreen, brushBlue, brushAlpha);
  println("brush set to grey");
}
//sets brush color to be white
void SetbrushWhite() {
  brushRed = 255;
  brushGreen = 255;
  brushBlue = 255;
  brushColor = color (brushRed, brushGreen, brushBlue, brushAlpha);
  println("brush set to white");
}

/*
#########################################################################################################################
 functions defining brushes
#########################################################################################################################
 */

//default brush is ciculer
void DefaultBrush() {
  noStroke();
  fill(brushColor);
  ellipse(mouseX, mouseY, brushSize, brushSize);
}
//makes brush collor become a gradient slowly
void GradientBrush() {
  UpdateRedValue(-1);
  UpdateGreenValue(-1);
  UpdateBlueValue(-1);
  UpdateSize(-1);
}

//brsuh set to color of backgorund acts as an Eraser
void Eraser() {
  noStroke();
  fill(backGroundColor);
  ellipse(mouseX, mouseY, brushSize, brushSize);
}

//creates a scatter effect of circles sized between 1 and 10
//can act as a star effect
void ScatterBrush() {
  int scatterValue = int(random(0, scaterMax));
  float xOffset =random(brushSize*-1, brushSize);
  float yOffset = random(brushSize*-1, brushSize);
  float size = random(1, 10);
  if (scaterPlaceChance >= scatterValue) {
    noStroke();
    fill(brushColor);
    ellipse(mouseX+xOffset, mouseY +yOffset, size, size);
  }
}
//random color scatter
void RandScatterBrush() {
  int scatterValue = int(random(0, scaterMax));
  float xOffset = random(brushSize*-1, brushSize);
  float yOffset = random(brushSize*-1, brushSize);
  float size = random(1, 10);
  if (scaterPlaceChance >= scatterValue) {
    noStroke();
    fill(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
    ellipse(mouseX+xOffset, mouseY +yOffset, size, size);
  }
}

/*
#########################################################################################################################
 Other Functions
#########################################################################################################################
 */
 
//makes a stary background
void Space(){
    //setting it background to black
    background(#080607);
    for(int x = 0; x < width; x++ ){
        for(int y = 0; y < height; y++){
            int starSpawnNum = int( random(0, 5000));
            if(starSpawnNum <= scaterPlaceChance){
                noStroke();
                fill(brushColor);
                circle(x, y, int(random(1,7)));
            }
        }
    }
}
