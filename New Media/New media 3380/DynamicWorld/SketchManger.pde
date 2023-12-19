/* 
###########################################################################################
  File Summary
  >> Conatins classes that differnt  effects that can be applyed/used on the sketch
###########################################################################################
*/
//constant varibles
final String tempDataFile = "/tempData.png";

final int START_STATE = 0;
final int GALAXY_STATE = 1;
final int SYSTEM_STATE = 2;
final int GALAXY_END_STATE = 3;

//gloabl values
int state = START_STATE;
boolean galaxyCreated = false;
boolean jumping = false;

//SketchManger class
class SketchManger{
  private boolean spawnNewSystem;
  private int lastState;

  private SolarSystem solarSystem;
  private Galaxy galaxy;
  private InteractionHandler interactionHandler;
  private JumpEffect jumpEffect;
  private UniverseDeath universeDeath;

  /*
  ###########################################################################################
      utility functions and constructors
  ###########################################################################################
  */
  //constructor for sketch manger used to initalze the program
  public SketchManger(){
    lastState = START_STATE;
    spawnNewSystem = true; 
    interactionHandler = new InteractionHandler();
   
  }
  //used to check input
  public void CheckInput(){
    interactionHandler.CheckKeyboardInput();
  }

  /*
  ###########################################################################################
      drawing functions
      and updating statefo drawing
  ###########################################################################################
  */
  //used by InteractionHandler to update the programs state
  public void CheckState(){
    //check if last state is same as current one and a state swap which needs a
    //jump then start jump effect
    if (lastState != state && lastState == START_STATE && jumping) {
      galaxy = new Galaxy(600, 10); 
      jumpEffect = new JumpEffect(1,50); 
    }
    else if (lastState != state && jumping) {
       jumpEffect = new JumpEffect(5,40); 
    }
    //otherwise check if last sate was galaxy and next is system
    else if (lastState == GALAXY_STATE && state == SYSTEM_STATE) {
      spawnNewSystem = true;
    }

    //check if at the galaxy and if user wishs to start a new one
    else if (lastState == GALAXY_STATE && state == GALAXY_END_STATE) {
      universeDeath = new UniverseDeath();
    }
    
    //recording last state
    lastState = state;
  }

  //displays states which can be found as global var
  public void DisplayState(){
    CheckState(); //cehcking state of drawing
    //jump effect makes scence move slower
    if(jumping){
      noStroke();
      jumpEffect.Jump();      
    }
    else {
      background(backGroundColor);
    
      if(state == START_STATE || jumping){
        //do nothing beside whats been already done
      }
      //draw galaxy
      else if (state == GALAXY_STATE) { 
       DipslayGalaxy();
      }
      //draw random system
      else if (state == SYSTEM_STATE) {
        DisplaySystem();
      }
      else if (state == GALAXY_END_STATE) {
        frameRate(20);
        universeDeath.DisplayEffect();
      }

      //exit jump
      if(jumpEffect != null){
          if (jumpEffect.ExitingJump()) {
          pushMatrix();
          translate(centerPoint.X(), centerPoint.Y(), 0);
          jumpEffect.ExitJump();
          popMatrix();
        } 
      }
      
     
    }
  }

  //handles displaying the galaxy
  public void DipslayGalaxy(){
    solarSystem = null;
    galaxy.Display();
  }

  //handles displaying a randomly gnenerated system
  public void DisplaySystem(){
      //checking if system has been created yet
      camera.RotateCamera(jumpEffect.ExitingJump());
      if(spawnNewSystem == true || solarSystem == null){
        int planetAmount = (int)random(2,5);
        float sunSize = random(50,200);
        solarSystem = new SolarSystem(planetAmount, sunSize);
        spawnNewSystem = false;
      }
      solarSystem.Display(jumpEffect.ExitingJump());
  } 
}
