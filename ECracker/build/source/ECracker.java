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

public class ECracker extends PApplet {

ArrayList<ParticleSystem> pslist;
ArrayList<Triangle> tlist;

// forces for our particle system
PVector gravity;

public void setup(){
  
  pslist = new ArrayList<ParticleSystem>();
  tlist = new ArrayList<Triangle>();
  gravity = new PVector(0, 0.05f);
}

public void draw(){
  background(255);

  for(Triangle t: tlist){
    t.draw();
  }

  for(ParticleSystem ps: pslist){
    ps.addParticle();
    ps.applyForce(gravity);
    ps.run();
  }

}

public void mouseClicked(){
  pslist.add(new ParticleSystem(new PVector(mouseX, mouseY)));
  tlist.add(new Triangle(new PVector(mouseX, mouseY)));
}
public class Particle{
  private PVector location;
  private PVector velocity;
  private PVector acceleration;
  private final int SIZE = 10;
  private int lifespan;
  private int colorScheme;

  public Particle(PVector location, PVector velocity, int colorScheme){
    this.location = location;
    this.velocity = velocity;
    this.acceleration = new PVector(0,0);
    lifespan = 255;
    this.colorScheme = colorScheme;
  }

  public void run(){
    update();
    draw();
  }

  public boolean isDead(){
    return lifespan <= 0;
  }

  private void update(){
    lifespan -= 1;
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0); // clear the acceleration vector
  }

  public void addForce(PVector force){
    // assuming mass = 1
    acceleration.add(force);
  }

  private void draw(){
    strokeWeight(2);
    switch(colorScheme){
      case 0: cs4();
              break;
      case 1: cs1();
              break;
      case 2: cs2();
              break;
      case 3: cs3();
              break;
      default:  cs0();
              break;
    }
    ellipse(location.x, location.y, SIZE, SIZE);
  }

  private void cs0(){
    stroke(255,0,0, lifespan);
    fill(255,255,0,lifespan);
  }

  private void cs1(){
    stroke(0,0,255,lifespan);
    fill(0,255,0, lifespan);
  }

  private void cs2(){
    stroke(0,0,0, lifespan);
    fill(0,255,0,lifespan);
  }

  private void cs3(){
    stroke(0,0,0, lifespan);
    fill(255,255,0,lifespan);
  }

  private void cs4(){
    stroke(255,255,0, lifespan);
    fill(0,0,255,lifespan);
  }

}
public class ParticleSystem{

  private ArrayList<Particle> plist;
  private PVector origin;
  private int lifespan;
  private int colorScheme;

  public ParticleSystem(PVector origin){
    this.origin = origin;
    plist = new ArrayList<Particle>();
    lifespan = PApplet.parseInt(random(100,400));
    colorScheme = PApplet.parseInt(random(0, 6));
  }

  public void applyForce(PVector force){
    for(Particle p: plist){
      p.addForce(force);
    }
  }

  private boolean isDead(){
    return lifespan <= 0;
  }

  public void addParticle(){
    if(!isDead()){
      for(int i=0; i<3; i++){
        plist.add(new Particle(origin.get(),
          new PVector(random(-0.6f,0.6f),random(-10,-6)),colorScheme));
      }
    }
  }

  public void run(){
    lifespan -= 1;
    for(int i=plist.size()-1; i>=0; i--){
      Particle p = plist.get(i);
      if(p.isDead()){
        plist.remove(i);
      }
      p.run();
    }
  }


}
public class Triangle{

  private PVector location;

  private final int SIZE = 25;

  public Triangle(PVector location){
    this.location = location;
  }

  public void draw(){
    noStroke();
    fill(0,0,0);
    triangle(location.x, location.y, location.x-SIZE/2,
        location.y+SIZE, location.x+SIZE/2, location.y+SIZE);
  }

}
  public void settings() {  size(1300,700); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ECracker" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
