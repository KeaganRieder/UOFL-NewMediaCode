/* 
###########################################################################################
  File Summary
  >> conatains functions which handle checking and executing interaction 
###########################################################################################
*/

/*
###########################################################################################
  controls 
  begin saving frames : s
  screenshot          : a

  switching times
  switch to day       : d
  switch to day       : n

  spawning things
  spawn car           : v
  unspawn car         : b
  spawn cloud         : c
  unspawn car         : x

  other controls
  turn power on       : p
  turn power off      : o

###########################################################################################
*/

//interaction varibles
private boolean saving = false;

//keyBindings
private char spawnCarKeybinding = 'v';
private char parkCarKeybinding = 'b';
private char spawnCloudKeybinding = 'c';
private char clearCloudsKeybinding = 'x';
private char turnPowerOff = 'o';
private char turnPowerOn = 'p';
private char save = 's';
private char screenShot = 'a';
private char switchToDay = 'd';
private char switchToNight = 'n';

//interaction functions
//checks for user key board input
void CheckForInteraction(){
 if(keyPressed){
      if(key == spawnCarKeybinding){
        if(!isDay){
          SpawnCar();
        } 
      }
      else if (key == parkCarKeybinding){
        ParkCar(); 
            
      }
      else if(key == spawnCloudKeybinding){
        SpawnCloud();
      }
      else if(key == clearCloudsKeybinding){
        RemoveCloud();
      }
      else if(key == save){
        saving = !saving;
      }
      else if(key == screenShot){
        TakeScreenShot();
      }
      else if(key == turnPowerOn){
        powerOutage = false;
      }
      else if(key == turnPowerOff){
        powerOutage = true;
      }
      else if(key == switchToDay){
        isDay = true;
      }
      else if (key == switchToNight) {
        isDay = false;
      }
    }
}
