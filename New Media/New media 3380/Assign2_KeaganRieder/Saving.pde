/*
##########################################################################
  File Summary
  >> this files handles definitions for saving of sketches
##########################################################################
*/

//varibles for saving/loading
int currentFrame = 0;
int currentScreenShot = 0;
String saveFolder = "savedFrames";
String screenShotFolder = "screenShots";
String frameName = "frame_";
String fileExtension = ".jpg";

/* about
  handles the saving of frames in the programs
  saves frames if the user wants to save
*/
void SaveCurrentFrame(){
  if(saving){
    String savePath = saveFolder + "/" + frameName + currentFrame + fileExtension;
    saveFrame(savePath);
    currentFrame++;
  }
}

/* about
  saves current frame and places it into screen shot folder
*/
void TakeScreenShot(){
  String savePath = screenShotFolder + "/" + frameName + currentScreenShot + fileExtension;
  saveFrame(savePath);
  currentScreenShot++;
}
