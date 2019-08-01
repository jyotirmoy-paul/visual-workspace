// implementing gift wrapping algorithm (convex hull/convex envelope) -- visualizing in 2D

import java.util.Random;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

final int numberOfPoints = 50;
int index = 0;

ArrayList<PVector> points = new ArrayList();
ArrayList<PVector> hull = new ArrayList();

PVector currentVertex; // points in convex hull
PVector nextVertex;
PVector currentPoint;

boolean visitedStartingVertexOnce = false;

void setup(){
  size(800,600);
  background(255);
  frameRate(10);

  // initialize the program with N random points
  Random random = new Random();
  for(int i=0; i<numberOfPoints; i++){
    points.add(new PVector(50 + random.nextInt(width-100), 50 + random.nextInt(height-100)));
  }

  Collections.sort(points, new Comparator<PVector>() {
    @Override
    public int compare(PVector o1, PVector o2) {
        return Float.compare(o1.x, o2.x);
    }
});

  // this chooses the left most point
  currentVertex = points.get(0);

  // let's suppose the next vertex is the point in index 1 position
  nextVertex = points.get(1);
  index = 2; // start checking from this vertex

  highlightCurrentVertex();

  hull.add(currentVertex);

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

void highlightStartVertex(){
  // draw an ellipse encircling the start vertex / leftmost vertex
  stroke(0,255,0);
  fill(0,0,0,0);
  strokeWeight(2);
  ellipse(points.get(0).x, points.get(0).y, 20, 20);
}

void drawHull(){
  // drawing the hull
  stroke(0,0,255);
  fill(0,0,255,50);
  beginShape();
  for(PVector p: hull){
    vertex(p.x, p.y);
  }
  endShape();
}

void draw(){
  background(255);
  drawAllPoints();
  highlightStartVertex(); // the leftmost vertex
  highlightCurrentVertex();
  drawHull();

  if(currentVertex != points.get(0)){
    visitedStartingVertexOnce = true;
  }

  if(visitedStartingVertexOnce && currentVertex == points.get(0)){
    noLoop();
  }

  strokeWeight(1);

  stroke(0,255,0);
  line(currentVertex.x, currentVertex.y, nextVertex.x, nextVertex.y);

  stroke(255,0,0);
  PVector checking = points.get(index);
  line(currentVertex.x, currentVertex.y, checking.x, checking.y);

  PVector a = PVector.sub(nextVertex, currentVertex);
  PVector b = PVector.sub(checking, currentVertex);
  PVector cross = a.cross(b);

  if(cross.z < 0){
    nextVertex = checking;
  }

  index += 1;

  if(index == points.size()){
    currentVertex = nextVertex;
    hull.add(currentVertex);
    index = 0;
    nextVertex = points.get(0);
  }

}
