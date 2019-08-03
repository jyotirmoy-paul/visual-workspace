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

Circle[] circlesRow;
Circle[] circlesCol;
int numCircles = 7;
int diameter = 90;
float baseAngularVelocity = 0.015f;

public void setup(){
  
  circlesRow = new Circle[numCircles];

  // instantiate all the circles -- in row
  for(int i=0; i<numCircles; i++){
    circlesRow[i] = new Circle(new PVector(150+100*i, 100), diameter, baseAngularVelocity*(i+1));
  }

}

public void drawAllCircles(){
  for(int i=0; i<numCircles; i++){
    circlesRow[i].draw(Circle.VERTICAL_LINE);
  }
}

public void draw(){
  background(255);
  drawAllCircles();
}
public class Circle{

  public final static int HORIZONTAL_LINE = 0;
  public final static int VERTICAL_LINE = 1;

  private PVector position;
  private int diameter;
  private int radius;

  private PVector pointPosition;
  private float angle = -HALF_PI;
  private float angularVelocity;

  public Circle(PVector position, int diameter, float angularVelocity){
    this.position = position;
    this.diameter = diameter;
    this.angularVelocity = angularVelocity;
    this.radius = diameter/2;

    pointPosition = new PVector(position.x + radius*cos(angle), position.y + radius*sin(angle));
  }

  private void rotatePoint(){
    angle += angularVelocity;
    if(angle >= TWO_PI)
      angle = 0;

    pointPosition.x = position.x + radius*cos(angle);
    pointPosition.y = position.y + radius*sin(angle);
  }

  public void draw(int lineType){
    noFill();
    stroke(0);
    strokeWeight(2);
    ellipse(position.x, position.y, diameter, diameter);

    strokeWeight(1.5f);
    stroke(0,0,0,255);
    if(lineType == HORIZONTAL_LINE){
      line(pointPosition.x, pointPosition.y, width, pointPosition.y);
    } else{
      line(pointPosition.x, pointPosition.y, pointPosition.x, height);
    }

    rotatePoint();
    strokeWeight(10);
    stroke(0);
    point(pointPosition.x, pointPosition.y);

  }

}
  public void settings() {  size(800,800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "LissajousCurve" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
