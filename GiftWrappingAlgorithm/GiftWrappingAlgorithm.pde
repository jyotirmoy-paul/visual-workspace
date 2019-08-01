// implementing gift wrapping algorithm (convex hull/convex envelope) -- visualizing in 2D

import java.util.Random;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

final int numberOfPoints = 30;
int index = 0;

// points are kept const as they are used for drawing
final PVector[] points = new PVector[numberOfPoints];

// contains all the points, but included in convex hull
ArrayList<PVector> allPoints = new ArrayList();

PVector currentVertex; // point in convex hull
PVector nextVertex;
PVector currentPoint;

void setup(){
  size(600,400);
  background(255);
  frameRate(10);

  // initialize the program with N random points
  Random random = new Random();
  for(int i=0; i<numberOfPoints; i++){
    points[i] = new PVector(50 + random.nextInt(width-100), 50 + random.nextInt(height-100));
    allPoints.add(points[i]);
  }

  Collections.sort(allPoints, new Comparator<PVector>() {
    @Override
    public int compare(PVector o1, PVector o2) {
        return Float.compare(o1.x, o2.x);
    }
});

  // this chooses the left most point
  currentVertex = allPoints.get(0);

  // let's suppose the next vertex is the point in index 1 position
  nextVertex = allPoints.get(1);
  index = 2; // start checking from this vertex

  highlightCurrentVertex();

} // setup ends here

// function that draws all the points
void drawAllPoints(){
  noStroke();
  fill(0);
  for(PVector p: points){
    ellipse(p.x, p.y, 7,7);
  }
}

void highlightCurrentVertex(){
  // draw an ellipse encircling the current point
  stroke(0,255,0);
  strokeWeight(2);
  fill(0,255,0,50);
  ellipse(currentVertex.x, currentVertex.y, 20,20);
}

void draw(){
  background(255);
  drawAllPoints();
  highlightCurrentVertex();


  strokeWeight(1);
  stroke(0,255,0);
  line(currentVertex.x, currentVertex.y, nextVertex.x, nextVertex.y);

  stroke(255,0,0);
  PVector checking = allPoints.get(index);
  line(currentVertex.x, currentVertex.y, checking.x, checking.y);

  PVector a = PVector.sub(nextVertex, currentVertex);
  PVector b = PVector.sub(checking, currentVertex);
  PVector cross = a.cross(b);

  if(cross.z < 0){
    nextVertex = checking;
  }

  index += 1;

  if(index == allPoints.size()){
    noLoop();
  }




}
