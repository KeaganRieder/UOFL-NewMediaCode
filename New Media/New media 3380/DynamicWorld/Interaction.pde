/* 
###########################################################################################
  File Summary
  >> Conatins a class that defines various asspects of interacting with the program
###########################################################################################
*/

class InteractionHandler{

  //varibles 
  private Keybindng spawnGalaxy; 
  private Keybindng zoomToSystem; 
  private Keybindng zoomOutSystem;
  private Keybindng endGalaxy;
  private Keybindng rotateL;
  private Keybindng rotateR;
  
  //make solar system roate with mouse

  public InteractionHandler(){
      spawnGalaxy = new Keybindng('n');
      zoomToSystem = new Keybindng('z');
      zoomOutSystem = new Keybindng('x');
      endGalaxy = new Keybindng('e');
      rotateL = new Keybindng('q');
      rotateR = new Keybindng('w');
    }


  //checks keyboard input based on 
  public void CheckKeyboardInput(){
    if(spawnGalaxy.Pressed() && state == START_STATE){
      state = GALAXY_STATE;
      jumping = true;
    }
    else if (zoomToSystem.Pressed()&& state == GALAXY_STATE){
      state = SYSTEM_STATE;
      jumping = true;
    }
    else if (zoomOutSystem.Pressed()) {
      state = GALAXY_STATE;
      jumping = true;
    }
    else if (endGalaxy.Pressed() && state == GALAXY_STATE) {
      state = GALAXY_END_STATE;
      jumping = false;
    }   
    else if (state == SYSTEM_STATE) {
      if (rotateL.Pressed()) {
        //make sure within bounds
        if (cameraX - 2 > width / 2 -200) {
          cameraX -= 2;
        }
      }
      else if (rotateR.Pressed()) {
        //make sure within bounds
        if (cameraX + 2 < width / 2 +200) {
          cameraX += 2;
        }
      }
    }
    
     
  
  }
}

//class that holds a keybindng
class Keybindng{
  private char boundKey;
  private boolean state = false;

  public Keybindng(char boundKey){
    this.boundKey = boundKey;
  }

  //chekcing if key is pressed
  public boolean Pressed(){
    if (keyPressed) {
      if (key == boundKey) {
        return true;
      }
    }
    return false;
  }

}
