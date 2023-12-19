/* 
###########################################################################################
  File Summary
  >> Conatins classes that define differnt object that relate to space
  >> object define are:
      >> CelestialBody | base class for all planets
      >> Planets | extends CelestialBody to make it more specific for planets
      >> sun | extends CelestialBody to make it more specific for sun
      >> stars | extends CelestialBody to make it more specific for stars
###########################################################################################
*/

//base class of all planets in the sketch
class CelestialBody{
    protected float distance; //distance from sun
    protected float diameter; //planet size
    protected float orbitSpeed; //speed at which it orbits sun
    protected color bodyColor;

    protected float angle = 0;
   
    public CelestialBody(float distance, float diameter, float orbitSpeed, color bodyColor) {
        this.distance = distance;
        this.diameter = diameter;
        this.orbitSpeed = orbitSpeed;
        this.bodyColor = bodyColor;
    }

    public void Display(){
        float y = distance * sin(radians(angle));
        float x = distance * cos(radians(angle));
        noStroke();
        pushMatrix();
            translate(x,0,y);
            fill(bodyColor);
            sphere(diameter);
        popMatrix();
        angle += orbitSpeed;
    }
}

class Planet extends CelestialBody{
    public Planet(float distance, float diameter, float orbitSpeed, color bodyColor) {
        super(distance, diameter, orbitSpeed, bodyColor); //calling CelestialBody constructor
    }
}

class Sun extends CelestialBody{
    private float r;
    private float g; 
    private float b; 
    //suns consturctor
    public Sun(float diameter, float r, float g, float b) {
        super(0.0,diameter,0.0,color(r, g, b));  //calling CelestialBody constructor
        this.r = 255;
        this.g = 255;
        this.b = 255;        
    }

    public void Display(){   
        pointLight(r,g,b, 200, 0, 0); 
        pointLight(r,g,b, 0, 0,-250);
        pointLight(r,g,b, 0, 0,250);
        pointLight(r,g,b, -200, 0, 0); 
        pushMatrix();
            noStroke();           
            fill(bodyColor);
            sphere(diameter);
        popMatrix();
    }
}

class BlackHoleCenter extends CelestialBody{
    public BlackHoleCenter(float diameter, color bodyColor) {
        super(0.0,diameter,0.0,bodyColor);//calling CelestialBody constructor
    }

    public void Display(){    
        pushMatrix();
            noStroke();           
            fill(bodyColor);
            sphere(diameter);
        popMatrix();
    }
}


// defines what a star is, which is an extension of CelestialBody, 
// stars can be single ellipse or a collection of them forming a  4armed 
//sprial
class Star extends CelestialBody{
    private float x; 
    private float y;
    private float yOffset;
    private float xOffset;
    private float blinkChance;
    private boolean active = true;

    //star constructor
    public Star(float distance, float diameter, float orbitSpeed, color bodyColor) {
        super(distance, diameter, orbitSpeed, bodyColor);//calling CelestialBody constructor
        yOffset = random(-50,50);
        xOffset = random(-50,50);
        Rotate();
    }
    //overloaded constructor
    public Star(float diameter, float x, float y) {
        super(0, diameter, 0, color(200,random(60, 100)));//calling CelestialBody constructor
        this.x = x;
        this.y = y;    
        blinkChance = 2;
    }

    public Vector2 GetCords(){
        return new Vector2(x,y);
    }

    public void AddOrbitSpeed(int speedOffset){
        orbitSpeed += speedOffset;
    }
    public void AddDistance(int offset){
        distance += offset;
    }

    //applys a rotation to the star
    public void Rotate(){
        x =  distance * cos(angle*.01);
        y = distance  * sin(angle*.01);
        angle += orbitSpeed ;
        if (angle*.01 >= 3) {
            angle =.5;
        }
    }

    //draws a spiral with 4 arms in up,down,left and right
    public void DisplaySpiral(){
        noStroke();
        fill(bodyColor);
        ellipse(x+xOffset, y, diameter, diameter);
        ellipse(-x+xOffset, -y, diameter, diameter);
        ellipse(y,-x+xOffset, diameter, diameter);
        ellipse(-y,x+xOffset, diameter, diameter);
    }

    //draws stars as normal
    public void Display(){ 
        Blink();//checks if stars blinking
        
        ellipseMode(CENTER);
        if (active) {
            fill(bodyColor);
        }
        else {
            fill(0);
        }
        ellipse(x,y,diameter,diameter);
        
    }

    //blink star
    public void Blink(){
        float blink = random(0, 2000);
        if (blinkChance > blink) {
            active = !active;
        }
    }

}
