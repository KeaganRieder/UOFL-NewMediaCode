/* 
About 
Using the following Functions to draw a tree:
point(), line(), ellipse(), rect(), triangle(), quad()
*/

//setting Screen Size
size(500,500);

//varibles
int screenWidth = 500;
int screenHeight = 500; 

//ground varibles
int groundPoint1 = 0;
int groundPoint2 = screenHeight-40;
int groundPoint3 = screenWidth;
int groundPoint4 = screenHeight;
int groundColor = 0;

//stump varibles
int stumpPoint1 = 150;
int stumpPoint2 = screenHeight-40;

int stumpPoint3 = stumpPoint1+150;
int stumpPoint4 = screenHeight-40;

int stumpPoint5 = stumpPoint1+20;
int stumpPoint6 = screenHeight-200;

int stumpPoint7 = stumpPoint5+30;
int stumpPoint8 = screenHeight-200;
int stumpColor = 20;

//Trunk varibles
int trunkPoint1 = 220;
int trunkPoint2 = 250;
int trunkPoint3 = 40;
int trunkPoint4 = 250;
int TrunkColor = 150;

//leaf varibles
int leafWidth = 60;
int leafHeight = 60;
int leafCenterX = 250;
int leafCenterY = 250;
int leafColor = 0;
int leafOutlineColor = 0;
int leafOutlineWidth = 0;


//drawing Ground
fill(groundColor);
rect(groundPoint1, groundPoint2, groundPoint3, groundPoint4);

//drawing stump
//fill(stumpColor);
//quad(stumpPoint1, stumpPoint2, stumpPoint3, stumpPoint4, stumpPoint5, stumpPoint6, stumpPoint7, stumpPoint8);

//drawing Trunk
fill(TrunkColor);
rect(trunkPoint1, trunkPoint2, trunkPoint3, trunkPoint4);

//drawing Leafs
fill(leafColor);
//stroke(leafOutlineColor);
//strokeWeight(leafOutlineWidth);
ellipse(leafCenterX, leafCenterY, leafWidth, leafHeight);
