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

}

void drawAllPoints(){
  stroke(0);
  strokeWeight(10);
  for(PVector p: points){
    point(p.x, p.y);
  }
}

void draw(){
  drawAllPoints();
}
