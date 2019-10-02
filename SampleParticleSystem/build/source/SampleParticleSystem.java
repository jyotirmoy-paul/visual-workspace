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

public class SampleParticleSystem extends PApplet {


private PVector gravity;

ArrayList<Particle> plist;

public void setup(){
  
  gravity = new PVector(0,0.001f);
  plist = new ArrayList<Particle>();
}

public void draw(){
  background(255);
  plist.add(new Particle(width/2));
  plist.add(new Particle(width/2));
  plist.add(new Particle(width/2));

  for(int i=plist.size()-1; i>=0;i--){
    Particle p = plist.get(i);
    p.addForce(gravity);
    p.run();
    if(p.isDead()){
      plist.remove(i);
    }
  }
}
public class Particle{

  PVector loc;
  PVector velocity;
  PVector acceleration;

  private final int RADIUS = 15;
  private int lifespan = 255;

  public Particle(float xPos){
    this.loc = new PVector(xPos, 50);
    this.velocity = new PVector(random(-0.6f, 0.6f),random(-1, 0));
    this.acceleration = new PVector(0,0);
  }

  public Particle addForce(PVector force){
    // considering mass = 1, we get force = acceleration
    // every force applied to the particle gets added
    this.acceleration.add(force);
    return this;
  }

  public boolean isDead(){
    return lifespan <= 0;
  }

  public void run(){
    update();
    if(!isDead()){
      draw();
    }
  }

  private void update(){
    velocity.add(acceleration);
    loc.add(velocity);
    lifespan -= 1;
  }

  private void draw(){
    // drawing a circular particle
    fill(207,207,207,lifespan);
    stroke(54,54,54, lifespan);
    strokeWeight(2);
    ellipse(loc.x, loc.y, RADIUS, RADIUS);
  }

}
public class ParticleSystem{
  
}
  public void settings() {  size(700,500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SampleParticleSystem" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
