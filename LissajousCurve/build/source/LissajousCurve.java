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
int numCircles = 8;
int diameter = 90;
float baseAngularVelocity = 0.015f;
Curve[][] curves;

public void setup(){
  
  circlesRow = new Circle[numCircles];
  circlesCol = new Circle[numCircles];
  curves = new Curve[numCircles][numCircles];

  for(int i=0; i<numCircles; i++){
    // instantiate all circles -- in row
    circlesRow[i] = new Circle(new PVector(150+100*i, 50), diameter, baseAngularVelocity*(i+1));

    // instantiate all circles -- in column
    circlesCol[i] = new Circle(new PVector(50, 150+100*i), diameter, baseAngularVelocity*(i+1));
  }

  for(int i=0; i<numCircles; i++){
    for(int j=0; j<numCircles; j++){
      curves[i][j] = new Curve();
    }
  }

}

public void drawAllCircles(){
  for(int i=0; i<numCircles; i++){
    circlesRow[i].draw(Circle.VERTICAL_LINE);
    circlesCol[i].draw(Circle.HORIZONTAL_LINE);
  }
}

public void draw(){
  background(255);
  drawAllCircles();

  for(int i=0; i<numCircles; i++){
    for(int j=0; j<numCircles; j++){
      curves[i][j].addPoint(circlesRow[i].getPointPosition().x, circlesCol[j].getPointPosition().y);
      curves[i][j].draw();
    }
  }

  // if the slowest circle completes one rotation --> reset the curves
  if(circlesRow[0].getAngle() >= 3*PI/2){
    for(int i=0; i<numCircles; i++){
      for(int j=0; j<numCircles; j++){
        curves[i][j].reset();
        circlesRow[i].setAngle(-HALF_PI);
        circlesCol[i].setAngle(-HALF_PI);
      }
    }
  }

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
    pointPosition.x = position.x + radius*cos(angle);
    pointPosition.y = position.y + radius*sin(angle);
  }

  public void draw(int lineType){
    noFill();
    stroke(0);
    strokeWeight(2);
    ellipse(position.x, position.y, diameter, diameter);

    strokeWeight(0.5f);
    if(lineType == HORIZONTAL_LINE){
      line(pointPosition.x, pointPosition.y, width, pointPosition.y);
    } else{
      line(pointPosition.x, pointPosition.y, pointPosition.x, height);
    }

    rotatePoint();
    strokeWeight(10);
    point(pointPosition.x, pointPosition.y);

  }

  public PVector getPointPosition(){
    return pointPosition;
  }

  public float getAngle(){
    return angle;
  }

  public void setAngle(float angle){
    this.angle = angle;
  }

}
class Curve{

  private ArrayList<PVector> path;
  private PVector currentPoint;

  public Curve(){
    path = new ArrayList();
    currentPoint = new PVector(0,0);
  }

  public void addPoint(float x, float y){
    path.add(new PVector(x, y));
    currentPoint.x = x;
    currentPoint.y = y;
  }

  public void reset(){
    path.clear();
  }

  public void draw(){
    noFill();
    stroke(0);
    strokeWeight(2);

    beginShape();
    for(PVector p: path){
      vertex(p.x, p.y);
    }
    endShape();

    strokeWeight(10);
    point(currentPoint.x, currentPoint.y);

  }

}
  public void settings() {  size(900,900); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "LissajousCurve" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
