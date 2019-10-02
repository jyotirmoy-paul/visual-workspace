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
