public class Particle{

  PVector loc;
  PVector velocity;
  PVector acceleration;

  private final int RADIUS = 15;
  private int lifespan = 255;

  public Particle(float xPos){
    this.loc = new PVector(xPos, 50);
    this.velocity = new PVector(random(-0.6, 0.6),random(-1, 0));
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
