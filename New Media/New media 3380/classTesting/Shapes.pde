/*
#######################################################################
  file used to store class decleration for shapes
  - circ
  - more tbd
#######################################################################
*/

class Varible2{
  public float x = 0, y = 0;
  
  public Varible2(int xVal, int yVal){
    x = xVal;
    y = yVal;
  }
  
  public void SetX(float val){
      x = val;
  }
    public void SetY(float val){
      y = val;
  }
  
  public void UpdateX(float val){
      x += val;
  }
  public void UpdateY(float val){
      y += val;
  }
  
  public float X(){
      return x;
  }
    public float Y(){
      return y;
  }
  
}  


class CustomEllipse{
  public Varible2 size;
  public Varible2 sizeOffset;
  public Varible2 cords;
  public Varible2 direction;
  public Varible2 offset;
  public Varible2 maxBounds;
  public Varible2 minBounds;
  public color shapeColor;

  public void DrawShape(boolean randomColor){
    noStroke();
    if(randomColor){
      shapeColor = color(random(0,255),random(0,255),random(0,255));
    }
    fill(shapeColor);
    ellipse(cords.X(), cords.Y(), size.X(),size.Y());  
  }
  
  public void DrawSplashingShape(boolean randomColor,float offset){
     noStroke();
    if(randomColor){
      shapeColor = color(random(0,255),random(0,255),random(0,255));
    }
    fill(shapeColor);
    ellipse(cords.X(), cords.Y(), size.X(),size.Y());  
    ellipse(cords.X()+random(-size.X()+ -offset,size.X() +offset), cords.Y() +random(-size.Y() + -offset,size.Y() + offset), size.X(),size.Y());
    ellipse(cords.X()+random(-size.X()+ -offset,size.X() +offset), cords.Y() +random(-size.Y() + -offset,size.Y() + offset), size.X(),size.Y()); 
    ellipse(cords.X()+random(-size.X()+ -offset,size.X() +offset), cords.Y() +random(-size.Y() + -offset,size.Y() + offset), size.X(),size.Y()); 
    
  }
  
  
  
  public void Move(boolean randomOffset){
    CheckCanvasBounds(randomOffset);
    cords.UpdateX(direction.X()*offset.X());
    cords.UpdateY(direction.Y()*offset.Y());
    
  }
  
 
  public void CheckCanvasBounds(boolean randomOffset){
    boolean xOutMaxBounds = cords.X() + direction.X()* offset.X() > maxBounds.X() - size.X();
    boolean xOutMinBounds = cords.X() + direction.X()* offset.X() < minBounds.X() + size.X();
    boolean yOutMaxBounds = cords.Y() + direction.Y()* offset.Y() > maxBounds.Y() - size.Y();
    boolean yOutMinBounds = cords.Y() + direction.Y()* offset.Y() < minBounds.Y() + size.Y();
    
    if(xOutMaxBounds || xOutMinBounds){
       direction.SetX(direction.X() * -1);
       if(randomOffset){
         offset = new Varible2((int)random(1,10),(int)random(1,10));
       }
    }
    
    if(yOutMaxBounds || yOutMinBounds){
       direction.SetY(direction.Y() * -1);
       if(randomOffset){
         offset = new Varible2((int)random(1,10),(int)random(1,10));
       }
    }
  }
  

}
