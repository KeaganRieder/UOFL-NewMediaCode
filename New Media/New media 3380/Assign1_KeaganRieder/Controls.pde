/*
#########################################################################################################################
    Handles/defines controls for stuff
#########################################################################################################################
*/
/*
#########################################################################################################################
    KeyBindings
    
    > Color keys
        >> red: r
            >>> decrease: r + [
            >>> increase: r + ]
        >> green: g
            >>> decrease: g + [
            >>> increase: g + ]
        >> blue: b
            >>> decrease: b + [
            >>> increase: b + ]
        >> alpha: a
            >>> decrease: a + [
            >>> increase: a + ]
        >> randomize: c
        >> set brush to white: t
        >> set brush to grey: h
        >> set brush to black: n

    > brush keys
        >> brush size:
            >>> increase: s + up
            >>> decrease: s + down
        >> scatter chance:
            >>> increase: w + up
            >>> decrease: w + down

        >> Default Brush: 0
        >> Scatter Brush: 1      
        >> Random color Scatter Brush: 2
        >> Gradient brush: 3

        >> draw: left button
        >> Erase: right button

    > save/loading
        >> save drawing: x

    > other controls
        >reset drawing: l + 0
        >reset drawing to stary space: l + 1
        
#########################################################################################################################
*/

/*
#########################################################################################################################
    keyboard controls
#########################################################################################################################
*/
/*
  boolean varibles to allowing tracking of what keys are being help
 in the current moment
 - this is used to allow for key combintaion for example  
 - if r (rkey) is pressed and the ] (openBracketKey) are pressed 
 and held together they will result in the brushes red value increasing
 every 5 frames
*/
boolean rKey = false;
boolean gKey = false;
boolean bKey = false;
boolean aKey = false;
boolean sKey = false;
boolean tKey = false;
boolean hKey = false;
boolean nKey = false;
boolean wKey = false;
boolean xKey = false;
boolean openBracketKey = false;
boolean closedBracketKey = false;
boolean cKey = false;
boolean lKey = false;
boolean key0 = false;
boolean key1 = false;
boolean key2 = false;
boolean key3 = false;


//function called onee after every key press
void keyPressed(){
    //checking which key was/is being pressed and setting the 
    //respective value to true
    if(key == 'r'){
        rKey = true;
    }
    if(key == 'g'){
        gKey = true;
    }
    if(key == 'b'){
        bKey = true;
    }
    if(key == 'a'){
        aKey = true;
    }
    if(key == 's'){
        sKey = true;
    }
    if(key == 't'){
        tKey = true;
    }
    if(key == 'w'){
        wKey = true;
    }
    if(key == 'h'){
        hKey = true;
    }
    if(key == 'n'){
        nKey = true;
    }
    if(key == ']'){
        openBracketKey = true;
    }
    if(key == '['){
        closedBracketKey = true;
    }
    if(key == 'c'){
        cKey = true;
        //println("c");
    }
    if(key == 'x')
    {
      xKey = true;
    }
    if(key == 'l')
    {
      lKey = true;
    }
    if(key == '1')
    {
      key1 = true;
    }
    if(key == '2')
    {
      key2 = true;
    }
    if(key == '0')
    {
      key0 = true;
    }
    if(key == '3')
    {
      key3 = true;
    }
}

//function called once after every key release
void keyReleased() {
    //checking which key was lifted and setting there respective
    //boolean value to false
    if(key == 'r'){
        rKey = false;
    }
    if(key == 'g'){
        gKey = false;
    }
    if(key == 'b'){
        bKey = false;
    }
    if(key == 'a'){
        aKey = false;
    }
    if(key == 's'){
        sKey = false;
    }
    if(key == 't'){
        tKey = false;
    }
    if(key == 'w'){
        wKey = false;
    }
    if(key == 'h'){
        hKey = false;
    }
    if(key == 'n'){
        nKey = false;
    }
    if(key == ']'){
        openBracketKey = false;
    }
    if(key == '['){
        closedBracketKey = false;
    }
    if(key == 'c'){
        cKey = false;
    }
    if(key == 'x')
    {
      xKey = false;
    }
    if(key == 'l')
    {
      lKey = false;
    }
    if(key == '1')
    {
      key1 = false;
    }
    if(key == '2')
    {
      key2 = false;
    }
    if(key == '0')
    {
      key0 = false;
    }
    if(key == '3')
    {
      key3 = false;
    }
}
//keyboard controls which are done through key combos
void ComboControls(){
    
    //increasing red
    if(rKey && openBracketKey){
        UpdateRedValue(1);
    }
    //decreasing red
    if(rKey && closedBracketKey){
        UpdateRedValue(-1);
    }

    //increasing green
    if(gKey && openBracketKey){
        UpdateGreenValue(1);
    }
    //decreasing green
    if(gKey && closedBracketKey){
        UpdateGreenValue(-1);
    }

    //increasing blue
    if(bKey && openBracketKey){
        UpdateBlueValue(1);
    }
    //decreasing blue
    if(bKey && closedBracketKey){
        UpdateBlueValue(-1);
    }

    //increasing alpha
    if(aKey && openBracketKey){
        UpdateAlphaValue(1);
    }
    //decreasing alpha
    if(aKey && closedBracketKey){
        UpdateAlphaValue(-1);
    }
   
    //increasing bursh size
    if(sKey && openBracketKey){
        UpdateSize(1);
    }
    //decreasing brush size
    if(sKey && closedBracketKey){
        UpdateSize(-1);
    }
    //increasing bursh size
    if(wKey && openBracketKey){
        UpdateScaterChance(1);
    }
    //decreasing brush size
    if(wKey && closedBracketKey){
        UpdateScaterChance(-1);
    }
    if(lKey && key0){
        background(backGroundColor);
    }
    if(lKey && key1){
        Space();
    }
}

// general keyboard controls, which are only done by one key not combos
void GeneralControls(){
     if(tKey){
        SetbrushWhite();
    }
    if(hKey){
        SetbrushGrey();
    }
    if(nKey){
        SetbrushBlack();
    }
    if(cKey){
        RandomColor();
    }
    //changing brush key binds
    if(key0){
        activeBrush =0;
        println("default brush");
    }
     if(key1){
        activeBrush = 1;
        println("scatter brush");
    }
    if(key2){
        activeBrush = 2;
        println("random color scatter");
    }
    if(key3){
      
      activeBrush = 3;
      println("gradient brush");
    }

    if(xKey){
        SaveDrawing();       
    }    

}

/*
#########################################################################################################################
    mouse controls
#########################################################################################################################
*/

//handles mouse controls
void MouseControls(){
     //mouse conrtols
    if(mousePressed){
        if(mouseButton == LEFT){
           // println("active brush:" + activeBrush);
            //current bursh is selected based on brush key last pressed
            if(activeBrush == 0){
                DefaultBrush();
            }
            else if(activeBrush == 1){
                ScatterBrush();
                
            }
            else if(activeBrush == 2){
                RandScatterBrush();
                
            }
            else if (activeBrush == 3){              
              GradientBrush();
              DefaultBrush();
            }
            
        }
        if(mouseButton == RIGHT){
            Eraser();
        }
    }
}





   
