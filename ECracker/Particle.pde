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
