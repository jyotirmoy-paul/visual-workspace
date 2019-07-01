import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.*; 
import java.text.*; 

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

// PI = 3.1415926535

int digitOfPiNeeded = 8;
double timeSteps = Math.pow(10,digitOfPiNeeded-1);

double mass1 = 1;
double mass2 = Math.pow(100, digitOfPiNeeded-1);
int initialVelocity = -3; // initial velocity second block

// first box
Box boxOne = new Box(new Vector2D(200, 150), new Vector2D(0, 0), 50, mass1);
// second box
Box boxTwo = new Box(new Vector2D(500, 150), new Vector2D(initialVelocity/timeSteps, 0), 50, mass2);

int collisionCount = 0;

public void setup(){
  
}

public void draw(){
  background(200); // clears everything

  for(long i=0; i<timeSteps; i++){
    if(boxOne.hasCollidedWith(boxTwo)){
      boxOne.collideWith(boxTwo);
      collisionCount += 1;
    }

    if(boxOne.hasCollidedWithLeftWall()){
      boxOne.reverseVelocity();
      collisionCount += 1;
    }
    boxOne.update();
    boxTwo.update();
  }

  // actually render the boxes and the text [collision count]
  boxOne.render(255);
  boxTwo.render(100);
  showCollisionCount(0);
}

public void showCollisionCount(int c){
  textSize(32);
  fill(c);
  text("No. of Collision: " + collisionCount, 50,50);
}



public class Box{

  Vector2D location;
  Vector2D velocity;
  int size;
  double mass;

  // default constructor
  public Box(Vector2D location, Vector2D velocity, int size, double mass){
    this.location = location;
    this.velocity = velocity;
    this.size = size;
    this.mass = mass;
  }

  public void update(){
    // vector addition of velocity vector to the location vector
    location.add(velocity);
  }

  public void render(int c){

    fill(c);
    rect((float) location.x, (float) location.y, size, size);

    // show the mass
    textSize(16);
    fill(0);
    text("M = " + NumberFormat.getInstance().format(this.mass), (float) location.x, ((float) location.y) - 10);
  }

  public void reverseVelocity(){
    // reverse the velocity in x direction
    velocity.x *= -1;
  }

  private boolean hasCollidedWithLeftWall(){
    return location.x < 0;
  }

  public boolean hasCollidedWith(Box other){
    // as motion is only along x axis --- checking the x coordinate will give the idea
    return this.location.x <= other.location.x && this.location.x + this.size >= other.location.x;
  }

  public void collideWith(Box other){

    // masses
    double m1 = this.mass;
    double m2 = other.mass;

    // sum of the masses
    double massSum = m1 + m2;

    // initial velocities
    double u1 = this.velocity.x;
    double u2 = other.velocity.x;

    // update the velocity in x direction only
    this.velocity.x = ((m1-m2)/massSum)*u1 + (2*m2/massSum)*u2;
    other.velocity.x = (2*m1/massSum)*u1 + ((m2-m1)/massSum)*u2;
  }

}
public class Vector2D{

  public double x;
  public double y;

  // vector2D constructor
  public Vector2D(double x, double y){
    this.x = x;
    this.y = y;
  }

  // add method for vector object
  public void add(Vector2D other){
    this.x += other.x;
    this.y += other.y;
  }

}
  public void settings() {  size(1200,300); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ElasticCollision" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
