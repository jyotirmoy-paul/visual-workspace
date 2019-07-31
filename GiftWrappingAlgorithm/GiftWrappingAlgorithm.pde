// implementing gift wrapping algorithm (convex hull/convex envelope) -- visualizing in 2D

import java.util.Random;

final int numberOfPoints = 10;
PVector[] points = new PVector[numberOfPoints];

void setup(){
  size(600,400);
  background(255);

  // initialize the program with N random points
  Random random = new Random();
  for(int i=0; i<numberOfPoints; i++){
    points[i] = new PVector(50 + random.nextInt(width-100), 50 + random.nextInt(height-100));
  }

  float minX = width; // a point's x coordinate can't be at width, that's y choosing this
  PVector leftmostPoint = null;
  // find the left most point
  for(PVector p: points){
    if(p.x < minX){
      minX = p.x;
      leftmostPoint = p;
    }
  }

  // draw an ellipse encircling the left most point
  stroke(0,255,0);
  strokeWeight(2);
  fill(0,255,0,70);
  ellipse(leftmostPoint.x, leftmostPoint.y, 20,20);

} // setup ends here

void drawAllPoints(){
  stroke(0);
  strokeWeight(7);
  for(PVector p: points){
    point(p.x, p.y);
  }
}

void draw(){
  drawAllPoints();



}
