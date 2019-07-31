// implementing gift wrapping algorithm (convex hull/convex envelope) -- visualizing in 2D

import java.util.Random;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

final int numberOfPoints = 10;

// points are kept const as they are used for drawing
final PVector[] points = new PVector[numberOfPoints];

// contains all the points, but included in convex hull
ArrayList<PVector> remainingPoints = new ArrayList();

PVector currentPoint;

void setup(){
  size(600,400);
  background(255);

  // initialize the program with N random points
  Random random = new Random();
  for(int i=0; i<numberOfPoints; i++){
    points[i] = new PVector(50 + random.nextInt(width-100), 50 + random.nextInt(height-100));
    remainingPoints.add(points[i]);
  }

  Collections.sort(remainingPoints, new Comparator<PVector>() {
    @Override
    public int compare(PVector o1, PVector o2) {
        return Float.compare(o1.x, o2.x);
    }
});

  // this chooses the left most point
  currentPoint = remainingPoints.get(0);


/*
  float minX = width; // a point's x coordinate can't be at width, that's y choosing this
  PVector leftmostPoint = null;
  // find the left most point
  for(PVector p: points){
    if(p.x < minX){
      minX = p.x;
      leftmostPoint = p;
    }
  }
  */

  // draw an ellipse encircling the left most point
  stroke(0,255,0);
  strokeWeight(2);
  fill(0,255,0,70);
  ellipse(currentPoint.x, currentPoint.y, 20,20);

} // setup ends here

// function that draws all the points
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
