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


private Particle particle;
private PVector tempForce;

public void setup(){
  
  particle = new Particle(new PVector(width/2, height/2));
  tempForce = new PVector(0.02f,0.01f);
}

public void draw(){
  background(255);
  particle.run();

}

public void mouseClicked(){
  if(mouseX > width/2){
    particle.addForce(tempForce);
  } else{
    particle.addForce(new PVector(-tempForce.x, -tempForce.y));
  }
}
public class Particle{

  PVector loc;
  PVector velocity;
  PVector acceleration;

  private final int RADIUS = 15;

  public Particle(PVector loc){
    this.loc = loc;
    this.velocity = new PVector(0,0);
    this.acceleration = new PVector(0,0);
  }

  public void addForce(PVector force){
    // considering mass = 1, we get force = acceleration
    // every force applied to the particle gets added
    this.acceleration.add(force);
  }

  public void run(){

    velocity.add(acceleration);
    loc.add(velocity);
    
    // drawing a circular particle
    fill(207,207,207,100);
    stroke(54,54,54);
    strokeWeight(2);
    ellipse(loc.x, loc.y, RADIUS, RADIUS);
  }

}
public class ParticleSystem{
  
}
  public void settings() {  size(600,400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SampleParticleSystem" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
