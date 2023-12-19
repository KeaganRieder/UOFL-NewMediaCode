/* 
###########################################################################################
  File Summary
  >> contatins definitions for custom data types which hold more then one varible
  >> allows accessing and modifcation fo conents

###########################################################################################
*/

//a class that conatins 2 floats, x and y
class Vector2{
    private float x;
    private float y;

    public Vector2(float x, float y){
        this.x = x;
        this.y = y;
    }

    public float X(){
        return x;
    }

    public float Y(){
        return y;
    }

    public void SetX(float x){
        this.x = x;
    }
    public void SetY(float y){
        this.y = y;
    }

    public void AddX(float val){
        x += val;
    }
    public void AddY(float val){
        y += val;
    }
}

//a class that conatins 3 floats, x, y and z
class Vector3{
    private float x;
    private float y;
    private float z;

     //constructor
    public Vector3(){
        this.x = 0;
        this.y = 0;
        this.z = 0;
    }
    //constructor
    public Vector3(float x, float y, float z){
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public float X(){
        return x;
    }
    public float Y(){
        return y;
    }
    public float Z(){
        return z;
    }

    public void SetX(float x){
        this.x = x;
    }
    public void SetY(float y){
        this.y = y;
    }
    public void SetZ(float z){
        this.z = z;
    }

    public void AddX(float val){
        x += val;
    }
    public void AddY(float val){
        y += val;
    }
    public void AddZ(float val){
        z += val;
    }
}