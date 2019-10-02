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

private ParticleSystem ps;

private ArrayList<ParticleSystem> pslist;

// forces for our particle system
private PVector gravity;
private PVector windForce;

public void setup(){
  
  frameRate(9000);
  pslist = new ArrayList<ParticleSystem>();

  // instantiating our forces
  gravity = new PVector(0,0.05f);
  windForce = new PVector(0.1f, 0);
}

public void draw(){
  background(255);

  for(ParticleSystem ps: pslist){

    ps.addParticle();
    ps.addForce(gravity);
    ps.run();

    if(mousePressed && mouseButton == RIGHT){
      stroke(255,255,0);
      fill(255,255,0,10);
      ellipse(mouseX, mouseY, 25, 25);
      if(mouseX > width/2){
        ps.addForce(new PVector(-windForce.x, windForce.y));
      } else{
        ps.addForce(windForce);
      }
    }

  }
}

public void mousePressed(){
  if(mouseButton == LEFT){
    // create a new particle system at the mouse position
    pslist.add(new ParticleSystem(new PVector(mouseX, mouseY)));
  }
}
public class Particle{

  PVector location;
  PVector velocity;
  PVector acceleration;

  private final int RADIUS = 15;
  private int lifespan = 255;

  public Particle(PVector location){
    this.location = location;
    this.velocity = new PVector(random(-0.6f, 0.6f), random(-2, 0));
    this.acceleration = new PVector(0,0); // the acceleration can only be affected by force
  }

  public void addForce(PVector force){
    // considering mass = 1, we get force = acceleration
    // every force applied to the particle gets added
    acceleration.add(force);
  }

  public boolean isDead(){
    return lifespan <= 0;
  }

  public void run(){
    update();
    draw();
  }

  private void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 1;
  }

  private void draw(){
    // drawing a circular particle
    fill(200,200,200,lifespan);
    stroke(50,50,50, lifespan);
    strokeWeight(2);
    ellipse(location.x, location.y, RADIUS, RADIUS);
  }

}
public class ParticleSystem{

  private ArrayList<Particle> plist;
  private PVector origin;

  public ParticleSystem(PVector origin){
    plist = new ArrayList<Particle>();
    this.origin = origin;
  }

  public void addForce(PVector force){
    for(Particle p: plist){
      p.addForce(force);
    }
  }

  public void addParticle(){
    plist.add(new Particle(origin.get()));
    plist.add(new Particle(origin.get()));
  }

  public void run(){
    for(int i=plist.size()-1; i>=0; i--){
      Particle p = plist.get(i);
      p.run();
      if(p.isDead()){
        plist.remove(i);
      }
    }
  }

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
