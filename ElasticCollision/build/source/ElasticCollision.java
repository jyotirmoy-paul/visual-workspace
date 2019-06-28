import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ElasticCollision extends PApplet {

// visualise a perfectly elastic collision

int digitOfPiNeeded = 4;
int timeSteps = 10000;

// first box
Box boxOne = new Box(200, 150, 50, 1, 0);

// second box
Box boxTwo = new Box(500, 150, 50, (int) Math.pow(100, digitOfPiNeeded-1), (float)-3/timeSteps);

int collisionCount = 0;

public void setup(){
  
}

public void draw(){
  background(200); // clears everything

  for(int i=0; i<timeSteps; i++){
    if(boxOne.hasCollidedWith(boxTwo)){
      boxOne.collideWith(boxTwo);
      collisionCount += 1;
      System.out.println(collisionCount);
    }

    if(boxOne.hasCollidedWithLeftWall()){
      boxOne.reverseVelocity();
      collisionCount += 1;
      System.out.println(collisionCount);
    }
    boxOne.update();
    boxTwo.update();
  }

  boxOne.show(255);
  boxTwo.show(100);
}
public class Box{

  float xCorr;
  int yCorr;
  int mass;
  float velocity;
  int size;

  public Box(float xCorr, int yCorr, int size, int mass, float velocity){
    this.xCorr = xCorr;
    this.yCorr = yCorr;
    this.mass = mass;
    this.velocity = velocity;
    this.size = size;
  }

  public void update(){
    this.xCorr += velocity;
  }

  public void show(int grayscaledColor){
    fill(grayscaledColor);
    rect(xCorr, yCorr, size, size);
  }

  public void reverseVelocity(){
    this.velocity *= -1;
  }

  private boolean hasCollidedWithLeftWall(){
    return xCorr < 0;
  }

  public boolean hasCollidedWith(Box other){
    // as motion is only along x axis --- checking the x coordinate will give the idea
    return this.xCorr <= other.xCorr && this.xCorr + this.size >= other.xCorr;
  }

  public void collideWith(Box other){
    int m1 = this.mass;
    int m2 = other.mass;
    float u1 = this.velocity;
    float u2 = other.velocity;
    int massSum = m1 + m2;

    this.velocity = ((float)(m1-m2)/massSum)*u1 + ((float)2*m2/massSum)*u2;
    other.velocity = ((float)2*m1/massSum)*u1 + ((float)(m2-m1)/massSum)*u2;
  }

}
  public void settings() {  size(750,300); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ElasticCollision" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
