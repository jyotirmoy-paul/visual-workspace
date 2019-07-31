import java.util.Random;
import java.lang.Math;

// DIGITS OF PI: 3.1415926535

final int radius = 150;
int side = radius*2;

long numPointsInsideCircle;
long numPointsTotal;

Random random;

void setup(){
  background(0);
  size(400, 400);

  translate(width/2, height/2);

  // draw the square -- side-length = side
  rectMode(CENTER);
  strokeWeight(1);
  stroke(255);
  noFill();
  rect(0, 0, side, side);

  // draw the circle -- radius = side/2
  ellipse(0, 0, side, side);

  random = new Random();
}

boolean isInsideCircle(int x, int y){
  return Math.sqrt(x*x + y*y) <= radius;
}

void draw(){
  translate(width/2, height/2);

  int x;
  int y;
  double pi = 0;

  for(int i=0; i<100000; i++){
    x = random.nextInt(side) - radius;
    y = random.nextInt(side) - radius;
    numPointsTotal++;

    if(isInsideCircle(x, y)){
      stroke(255,0,0);
      numPointsInsideCircle++;
    } else{
      stroke(0,255,0);
    }

    point(x, y);

    pi = 4*((double)numPointsInsideCircle/numPointsTotal);
  }

  System.out.println("PI: " + pi);

}
