public class Particle{

  PVector location;
  PVector velocity;
  PVector acceleration;

  private final int RADIUS = 15;
  private int lifespan = 255;

  public Particle(PVector location){
    this.location = location;
    this.velocity = new PVector(random(-0.6, 0.6), random(-2, 0));
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
    fill(207,207,207,lifespan);
    stroke(54,54,54, lifespan);
    strokeWeight(2);
    ellipse(location.x, location.y, RADIUS, RADIUS);
  }

}
