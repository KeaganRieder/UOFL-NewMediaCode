/*
#########################################################################################################################
   defines functions that handle saving
#########################################################################################################################
*/

int currentSave = 0;

/*
saves drawing and increments save number
*/
void SaveDrawing(){
   saveFrame("Desigh-Series/Design_" + currentSave +".jpg");
   println("Saved Design_" + currentSave +".jpg in Desigh-Series/");
   currentSave++;
}
