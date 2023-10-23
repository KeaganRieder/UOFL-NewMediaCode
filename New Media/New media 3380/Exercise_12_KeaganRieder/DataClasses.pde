/*
##########################################################################
  File Summary
  >> this file contains classes which hold data meant to be used by other 
  >> classes.
  >> the reason for these classes is to allow for cleenaer and
  >> more orginzied code where for example rather then passing two 
  >> varibles you just pass a class that conatins two varibles
##########################################################################
*/

/*
  about
  >> Vector2 is a data class which holds two floats
  >> it defines ways to allow for the float values 
  >> to be modifed and interacted with
*/
class Vector2 {
  private float x = 0;
  private float y = 0;
  
  //consturcutor
  public Vector2(float X, float Y){
    x = X;
    y = Y; 
  }
  
  //functions to get varibles x and y
  public float GetX(){
    return x;
  }
  public float GetY(){
    return y;
  }
  
  //functions to allow for modifcation of varibles
  //for x varible
  public void InvertX(){
     x *= -1;
  } 
  public void AddToX(float val){
    x += val;
  }  
  public void MultiplyToX(float val){
    x *= val;
  }
  public void DivideX(float val){
    if(val != 0){
      x /= val;
    }
    else{
      println("Error: attempted to divide X by 0");
    }
  }
  
  //For Y varible
  public void InvertY(){
     y *= -1;
  }
  public void AddToY(float val){
    y += val;
  }  
  public void MultiplyToY(float val){
    y *= val;
  }
  public void DivideY(float val){
    if(val != 0){
      y /= val;
    }
    else{
      println("Error: attempted to divide X by 0");
    }
  } 
}
