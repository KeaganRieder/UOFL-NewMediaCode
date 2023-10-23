/*
##########################################################################
  File Summary
  >> this file contains definitions for classes that are used to create the 
  optical illusion
##########################################################################
*/


class OpticalIllsuion{

  private Vector2 cords;
  private Vector2 size;
  private Vector2 minBound;
  private Vector2 maxBounds;
  private Vector2 offset;
  private Vector2 direction = new Vector2(1,1);
  private color illisonColor;
  
  public OpticalIllsuion(Vector2 cords,Vector2 size, Vector2 offset, color illisonColor){
    this.cords = cords; 
    this.size = size;
    minBound = new Vector2(size.GetX()-200,size.GetY()-200);
    maxBounds = new Vector2(size.GetX(),size.GetY());
    this.offset = offset;
    this.illisonColor = illisonColor;
    //DrawIllsuion();
  }
  
  
  public void Move(){
    EraseIllsuion();
    float xTrajectory = size.GetX() + offset.GetX() * direction.GetX();
    float yTrajectory = size.GetY() + offset.GetY() * direction.GetY();
    
    if(xTrajectory < minBound.GetX() || xTrajectory > maxBounds.GetX()){
       direction.InvertX();
    }
    if(yTrajectory < minBound.GetY() || yTrajectory > maxBounds.GetY()){
       direction.InvertY();
    }
    
    float xVecloity = offset.GetX() * direction.GetX();
    float yVecloity = offset.GetY() * direction.GetY();
    size.AddToX(xVecloity);
    size.AddToY(yVecloity);
    
    DrawIllsuion();
  }
  
  public void DrawIllsuion(){
    noFill();
    strokeWeight(4);
    stroke(illisonColor);
    rect(cords.GetX(),cords.GetY(),size.GetX(),size.GetY());
  }
  public void EraseIllsuion(){
    noFill();
    strokeWeight(5);
    stroke(backGroundColor);
    rect(cords.GetX(),cords.GetY(),size.GetX(),size.GetY());
  }
  

}
