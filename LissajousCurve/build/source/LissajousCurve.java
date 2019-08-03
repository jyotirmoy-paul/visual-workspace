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

public class LissajousCurve extends PApplet {

// Lissajous Curve Table

Circle[] circles;
int numOfCircles = 1;
int diameter = 100;

public void setup(){
  
  circles = new Circle[numOfCircles*2];
  for(int i=0; i<numOfCircles; i++){
    circles[i] = new Circle(new PVector(width/2, height/2), diameter);
  }

}

public void drawAllCircles(){
  for(int i=0; i<numOfCircles; i++){
    circles[i].draw(0, 2);
  }
}

public void draw(){
  background(255);
  drawAllCircles();
}
public class Circle{

  private PVector position;
  private int diameter;

  public Circle(PVector position, int diameter){
    this.position = position;
    this.diameter = diameter;
  }

  public void draw(int strokeVal, int strokeWeightVal){
    noFill();
    stroke(strokeVal);
    strokeWeight(strokeWeightVal);
    ellipse(position.x, position.y, diameter, diameter);
  }

}
  public void settings() {  size(700,700); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "LissajousCurve" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
