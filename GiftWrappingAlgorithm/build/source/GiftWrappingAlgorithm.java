import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.Random; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class GiftWrappingAlgorithm extends PApplet {

// implementing gift wrapping algorithm (convex hull/convex envelope) -- visualizing in 2D



final int numberOfPoints = 10;
PVector[] points = new PVector[numberOfPoints];

public void setup(){
  
  background(255);

  // initialize the program with N random points
  Random random = new Random();
  for(int i=0; i<numberOfPoints; i++){
    points[i] = new PVector(50 + random.nextInt(width-100), 50 + random.nextInt(height-100));
  }

}

public void drawAllPoints(){
  stroke(0);
  strokeWeight(10);
  for(PVector p: points){
    point(p.x, p.y);
  }
}

public void draw(){
  drawAllPoints();
}
  public void settings() {  size(600,400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "GiftWrappingAlgorithm" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
