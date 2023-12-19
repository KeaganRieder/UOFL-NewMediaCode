/* 
###########################################################################################
  File Summary
  >> Conatins class that defines what a galaxy is
###########################################################################################
*/
class Galaxy{
    private BlackHoleCenter blackHole;
    private ArrayList<Star> stars = new ArrayList<Star>();
    private ArrayList<Star> accentStars = new ArrayList<Star>();
    private ArrayList<Star> accentStars2 = new ArrayList<Star>();
    private float starDistance; //stars ditance from sun
    private color blackHoleColor;
    private float starAmount;

    public Galaxy(int starAmount, float blackHoleSize){
        starDistance = blackHoleSize+10; // initalizing distnace so planet can't be right at sun
        blackHoleColor = color(120);
        blackHole = new BlackHoleCenter(blackHoleSize,blackHoleColor);
        blackHoleColor = color(140); 
        this.starAmount = starAmount;
        GenerateStar();
    }

    public void Display(){
        //run through each planet inside of list planets
        pushMatrix();
        translate(centerPoint.X(), centerPoint.Y(), -200);
        blackHole.Display();
        rotateY(-45);
        rotateX(45);
        
        for (int i = 0; i < starAmount; ++i) {
            stars.get(i).Rotate();
            stars.get(i).DisplaySpiral();
            pushMatrix();
            rotateZ(45);
            accentStars.get(i).Rotate();
            accentStars.get(i).DisplaySpiral();
            rotateZ(45);
            accentStars2.get(i).Rotate();
            accentStars2.get(i).DisplaySpiral();
            popMatrix();
        }
        popMatrix();        
    }
    private void GenerateStar(){
        for (int i = 0; i < starAmount; ++i) {
            float diameter = 5;
            starDistance += 1; 
            float orbitSpeed = .01 + (starAmount - i) * .001; //stars get slower th efuther they are from center

            //making it decide color based on star position
            color starColor =  lerpColor(blackHoleColor, color(53, 42, 203), i/(starAmount * .5)); //making it decide color based on star position
            color accentStarColor =  lerpColor(blackHoleColor, color(96,39, 178), i/(starAmount * .5)); 
            color accentStarColor2 =  lerpColor(blackHoleColor, color(100,30, 136), i/(starAmount * .5)); 
            
            //adding stars
            stars.add(new Star(starDistance, diameter, orbitSpeed, starColor)); //make stars that arn't rotated by 45
            accentStars.add(new Star(starDistance, diameter, orbitSpeed, accentStarColor)); 
            accentStars2.add(new Star(starDistance, diameter, orbitSpeed, accentStarColor2)); 
        }

    } 
}
