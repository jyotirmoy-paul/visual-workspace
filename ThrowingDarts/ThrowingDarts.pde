import java.util.Random;

final int radius = 150;
int side = radius*2;

long point_count_inside_circle;
long total_point_count;

Random random;

void setup(){
  background(255);
  size(400, 400);

  translate(width/2, height/2);

  // draw the square -- side-length = side
  rectMode(CENTER);
  strokeWeight(1);
  stroke(0);
  noFill();
  rect(0, 0, side, side);

  // draw the circle -- radius = side/2
  ellipse(0, 0, side, side);

  random = new Random();
}

void draw(){

}
