/* 
###########################################################################################
  File Summary
  >> conatains functions which define how various interaction event should work/act
###########################################################################################
*/

//varibles

//spawn car Event varible
int activeCars = 0;
int carSize = 5;
IntList carXCords = new IntList();
IntList carSpeed = new IntList();
int carYCords = horizenLine;
color carColor = color(255);
IntList carsParked = new IntList();

//cloud varibles 
int totalClouds = 0;
color cloudColor = color(53,16,75);
float cloudPieceSize = 30;
IntList cloudXCords = new IntList();
IntList cloudYCords = new IntList();
IntList cloudSpeed = new IntList();
//IntList 

//event Functions

void SpawnCar(){
    carXCords.append((int)random(10-0, width+10));
    int carDirection = (int) random(-10,10);
    if(carDirection < 0){
        carSpeed.append(-1);
    }
    else{
        carSpeed.append(1);
    }

    activeCars++;
}

void ExecuteCarEvent(){

    fill(carColor);
    for (int i = 0; i < activeCars; ++i) {
        ellipse(carXCords.get(i), carYCords+7, carSize, carSize);
        //checking if cars within bounds
        if(carXCords.get(i) <= 0-carSize || carXCords.get(i) >= width+carSize){
            carSpeed.set(i, carSpeed.get(i) * -1);
        }
        carXCords.set(i,(carXCords.get(i) +  carSpeed.get(i)));
    }
    

}

//function to park the least recent car
void ParkCar(){
    if(activeCars == 1){
          carXCords.clear();
          carSpeed.clear();
          activeCars = 0;
    }   
    else if(activeCars > 1){
        carXCords.remove(1);
        carSpeed.remove(1);
        activeCars--;
    }
}

//functions to draw and cretae Clouds 
void SpawnCloud(){
    int x = (int) random(0, width);
    int y = (int) random(0, horizenLine-200);
    int cloudDirection = (int) random(-10,10);
  

    fill(cloudColor);

    ellipse(x, y, cloudPieceSize, cloudPieceSize);
    ellipse(x - (cloudPieceSize*.5), y, cloudPieceSize, cloudPieceSize);
    ellipse(x - (cloudPieceSize*.5), y- (cloudPieceSize*.5), cloudPieceSize, cloudPieceSize);
    ellipse(x + cloudPieceSize, y, cloudPieceSize, cloudPieceSize);
    ellipse(x + (cloudPieceSize*.5), y + (cloudPieceSize*.5), cloudPieceSize, cloudPieceSize);

    cloudXCords.append(x);
    cloudYCords.append(y);
     if(cloudDirection < 0){
        cloudSpeed.append(-1);
    }
    else{
        cloudSpeed.append(1);
    }
    totalClouds++;
 
}

//function to repeatly draw clouds
void DrawClouds(){
    
    fill(cloudColor);
    for (int i = 0; i < totalClouds; ++i) {
        int reflectedY = height- cloudYCords.get(i);
        ellipse(cloudXCords.get(i), cloudYCords.get(i), cloudPieceSize, cloudPieceSize);
        ellipse(cloudXCords.get(i) - (cloudPieceSize*.5), cloudYCords.get(i), cloudPieceSize, cloudPieceSize);
        ellipse(cloudXCords.get(i) - (cloudPieceSize*.5), cloudYCords.get(i) - (cloudPieceSize*.5), cloudPieceSize, cloudPieceSize);
        ellipse(cloudXCords.get(i) + cloudPieceSize, cloudYCords.get(i), cloudPieceSize, cloudPieceSize);
        ellipse(cloudXCords.get(i) + (cloudPieceSize*.5), cloudYCords.get(i) + (cloudPieceSize*.5), cloudPieceSize, cloudPieceSize);

        //for reflection
        ellipse(cloudXCords.get(i), reflectedY, cloudPieceSize, cloudPieceSize);
        ellipse(cloudXCords.get(i) - (cloudPieceSize*.5), reflectedY, cloudPieceSize, cloudPieceSize);
        ellipse(cloudXCords.get(i) - (cloudPieceSize*.5), reflectedY - (cloudPieceSize*.5), cloudPieceSize, cloudPieceSize);
        ellipse(cloudXCords.get(i) + cloudPieceSize, reflectedY, cloudPieceSize, cloudPieceSize);
        ellipse(cloudXCords.get(i) + (cloudPieceSize*.5), reflectedY + (cloudPieceSize*.5), cloudPieceSize, cloudPieceSize);
        
        //checking if cars within bounds
        if(cloudXCords.get(i) <= 0-cloudPieceSize || cloudXCords.get(i) >= width+cloudPieceSize){
            cloudSpeed.set(i, cloudSpeed.get(i) * -1);
        }
        cloudXCords.set(i,(cloudXCords.get(i) +  cloudSpeed.get(i)));
    }
}

//function to remove least recent spawned cloud
void RemoveCloud(){
  if(totalClouds == 1){
     cloudXCords.clear();
     cloudYCords.clear();
     cloudSpeed.clear();
     totalClouds = 0;
  }
  else if(totalClouds > 1){
        cloudXCords.remove(1);
        cloudYCords.remove(1);
        cloudSpeed.remove(1);
        totalClouds--;
    }
}
