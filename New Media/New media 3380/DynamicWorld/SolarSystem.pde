/* 
###########################################################################################
  File Summary
  >> contains a class that defines what a solar system is
###########################################################################################
*/

//global varibles 
float starRotation;

//defiens what a solar system is
class SolarSystem{
    private ArrayList<Planet> planets = new ArrayList<Planet>();
    private ArrayList<Star> stars = new ArrayList<Star>();
    private Sun sun;
    private float planetDistance; //planets ditance from sun
    private float starChance;
    //private Space space; todo
    
    public SolarSystem(int planetAmount, float sunSize){
        sun = new Sun(sunSize, 211,185,49);
        planetDistance = sunSize; // initalizing distnace so planet can't be right at sun
        starChance = 3;
        Initalize(planetAmount);
        starRotation = 0;
    }

    //create stars and planet arrays
    public void Initalize(int planetAmount){
        for (int i = 0; i < planetAmount; ++i) {
            planets.add(GeneratePlanet(planetAmount,i));
        }
        GenerateStars();
    }

    //display solar system
    public void Display(boolean exitingJump){
        pushMatrix();
        
        translate(centerPoint.X(), centerPoint.Y(), 0);
        sun.Display();
        //run through each planet inside of list planets
        for (Planet planet : planets) {
            planet.Display();
        }
        popMatrix();
        
        //generate starts in the back
        pushMatrix();   
        translate(width/2,height/2, -400);
        //run through each star inside of list stars
        for (Star star : stars) {
            star.Display();
        }
        popMatrix();
       
    }

    //generateing planets
    private Planet GeneratePlanet(int planetAmount,int planet){
        float diameter = 10 + planet * 3;
        planetDistance += diameter +20 + planet * 25;
        float orbitSpeed = .01+ (planetAmount - planet) * .05; 
       
        color planetColor = color(random(0,255), random(0,255), random(0,255));
        return new Planet(planetDistance, diameter, orbitSpeed, planetColor);
    }  

    //creating stars
    private void GenerateStars(){
        
        for (int x = -width-250; x < width+250; ++x) {
            for (int y = -height-250; y < height+250; ++y) {
                if(SpawnStar()){
                    stars.add(new Star(5, x, y));
                }
            }
        }        
    }

    //checks to spawn a star
    private boolean SpawnStar(){
        float spawnVal = random(0, 2000);
        return starChance > spawnVal;
    }
}
