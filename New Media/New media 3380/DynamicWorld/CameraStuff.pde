/* 
###########################################################################################
  File Summary
  >> contains code for a class that defiens a custom camera 
  >> allows fo rsetting a point of rotation for the camera to roatate around

###########################################################################################
*/

//global varibles
float cameraX; 

//custom camera class
class CustomCamera{
  //constructor
  public CustomCamera(){
    cameraX = width / 2;
  }

  // camera rotate
  public void RotateCamera(boolean exitingJump) { //todo make it beused with mouse 
    if (exitingJump) {
      cameraX = width / 2;
    }
    camera(cameraX,  height / 2, 500, width / 2, height / 2, 0, 0, 1, 0);
        
  }
    
  public void PlaceCamera(){
    camera(width / 2, height / 2, 500, width / 2, height / 2, 0, 0, 1, 0);
  }
      

}
