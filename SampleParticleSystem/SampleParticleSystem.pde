
private Particle particle;
private PVector tempForce;

void setup(){
  size(600,400);
  particle = new Particle(new PVector(width/2, height/2));
  tempForce = new PVector(0.02,0.01);
}

void draw(){
  background(255);
  particle.run();

}

void mouseClicked(){
  if(mouseX > width/2){
    particle.addForce(tempForce);
  } else{
    particle.addForce(new PVector(-tempForce.x, -tempForce.y));
  }
}
