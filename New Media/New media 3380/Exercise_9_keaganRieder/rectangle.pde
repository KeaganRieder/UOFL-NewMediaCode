/*
  draws rectangles with increasing sizes 
*/


class MovingCirc{
  public color rectColor;
  public int rectWidth;
  public int rectHeight;
  public int rectWidthChange = 0;   
  public int rectHeightChange = 0;
  
  public int rectX;
  public int rectY;
  public int rectXSpeed;
  public int rectYSpeed;
  public int rectXDirection = 1;
  public int rectYDirection = 1;
  
  
  public void DrawRect(){
    fill(rectColor);
    ellipse(rectX,rectY,rectWidth,rectHeight);
  }
  
  public void MoveRect(){
    CheckBounds();
    rectX += rectXDirection*rectXSpeed;
    rectY += rectYDirection*rectYSpeed;
  }
  
  public void CheckBounds(){
    if(rectY + rectXDirection * rectXSpeed > width - rectWidth/2){
    rectXDirection *= -1;
    rectXSpeed = (int)random(1,10);
    rectYSpeed = (int)random(1,10);
  }
  if(rectY + rectXDirection * rectXSpeed < 0 + rectWidth/2 ){
    rectXDirection *= -1;
    rectXSpeed = (int)random(1,10);
    rectYSpeed = (int)random(1,10);
  }
  
  if(rectY + rectYDirection * rectYSpeed > height - rectHeight/2){
    rectYDirection *= -1;
    rectXSpeed = (int)random(1,10);
    rectYSpeed = (int)random(1,10);
  }
  if(rectY + rectYDirection * rectYSpeed < 0 +rectHeight/2 ){
    rectYDirection *= -1;
    rectXSpeed = (int)random(1,10);
    rectYSpeed = (int)random(1,10);
  }
    
  }
  
  


}
