import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.Random; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ThrowingDarts extends PApplet {



final int radius = 150;
int side = radius*2;

long point_count_inside_circle;
long total_point_count;

Random random;

public void setup(){
  background(255);
  

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

public void draw(){

  translate(width/2, height/2);

  int x = random.nextInt(side);
  int y = random.nextInt(side);

  point(x, y);

}
  public void settings() {  size(400, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ThrowingDarts" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
