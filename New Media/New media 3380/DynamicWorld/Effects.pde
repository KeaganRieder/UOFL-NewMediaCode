/* 
###########################################################################################
  File Summary
  >> Conatins classes that differnt  effects that can be applyed/used on the sketch
###########################################################################################
*/

// class that defines what a jump effect is
// it toccurs in the galaxy, and involves taking a screen shot, then
// loading that and bluring in towards a ceratain point
class JumpEffect{
  private float thinkness;
  private float ringShade = 155;
  private float ringAlpha;
  private float radius;
  private float vertexAngle;

  private float jumpTime;
  private float jumpLength;
  private boolean exitingJump;

  private FadeEffect fadeEffect;

  //constructor
  public JumpEffect(float radius, float length){
    vertexAngle = 0.0;
    ringAlpha = 5;
    this.radius = radius;
    thinkness = radius*.5;
    jumpTime = 0;
    jumpLength = length;
    jumping = true;
    exitingJump = false;
    Jump();
  }

  //check if jumping is done
  public boolean Jumping(){
    return jumping;
  }

  //check if exiting jumps done
  public boolean ExitingJump(){
    return exitingJump;
  }

  //moving imange closer to camera
  public void Jump(){
    pushMatrix();
    translate(centerPoint.X(), centerPoint.Y(), 400);
    DisplayRing();
    IncreaseRing();
    popMatrix();
   
    jumpTime++;
    //check state of jump and if it's over
    if(jumpTime >= jumpLength){
      jumping = false;

      //making sure to exit jump
      pushMatrix();
        translate(centerPoint.X(), centerPoint.Y(), 0);
        fadeEffect = new FadeEffect(200.0);
      popMatrix();
      exitingJump = true;
    }
  }
  //handles exiting jump effect
  public void ExitJump(){
    lights();
    fadeEffect.Display();
  
    if(fadeEffect.GetFadeAlpha() == 0){
      exitingJump = false;
    }
  }

  //draws ring shape that gets closer towards camera
  public void DisplayRing(){
    fill(ringShade, ringAlpha);
    for (int i = 0; i < radius; ++i) {
      ellipse(radius * cos(vertexAngle), radius * sin(vertexAngle), thinkness, thinkness);
       vertexAngle += TWO_PI / radius;
    }
  }

  //increase values related to drawing the ring
  public void IncreaseRing(){
    radius += 10;
    thinkness = radius;
  }

}

//fade effect used for fading between scene
class FadeEffect{
  private float fadeAlpha;

  public FadeEffect(float fadeAlpha){
    this.fadeAlpha = fadeAlpha;
  }

  public float GetFadeAlpha(){
    return fadeAlpha;
  }

  public void Display(){
    pushMatrix();
    translate(0, 0, 400); //moving so so it's blocking scene
    rectMode(CENTER);
    if (fadeAlpha != 0) {
      fadeAlpha -= 2;
    }
    fill(155, fadeAlpha);
    rect(0,0,width,height);
    popMatrix();
  }
}

// class which defines a how a universie dies and the sorta effect
// that goes along with it
class UniverseDeath{
  private PImage universe;
  private int timer;
  private float thinkness;
  private float ringShade;
  private float radius;
  private float vertexAngle;


  public UniverseDeath(){
    vertexAngle = 0;
    DrawInitalRing(); 
    universe = get();
  }

  public void DrawInitalRing(){
    radius = 430;
    thinkness = 120;
    fill(0);
    pushMatrix();
    translate(width/2, height/2, 0);
    rotateY(-45);
    rotateX(45);
    for (int i = 0; i < radius; ++i) {
      ellipse(radius * cos(vertexAngle), radius * sin(vertexAngle), thinkness, thinkness);
       vertexAngle += TWO_PI / radius;
    }
    popMatrix();
    
  }

  public void DisplayEffect(){
 
    pushMatrix();
    tint(255, 180);
    image(universe, 0,0);
    popMatrix();
    universe = get();
    if (timer >= 10) {
      state = START_STATE;
    }
    timer++;
  }
}
