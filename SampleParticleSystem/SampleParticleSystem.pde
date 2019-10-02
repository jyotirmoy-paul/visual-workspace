private ParticleSystem ps;
private boolean isMousePressed;

// forces for our particle system
private PVector gravity;
private PVector windForce;

void setup(){
  size(700,500);
  ps = new ParticleSystem(new PVector(width/2, 50));

  // instantiating our forces
  gravity = new PVector(0,0.05);
  windForce = new PVector(0.1, 0);
}

void draw(){
  background(255);
  ps.addParticle();
  ps.addForce(gravity);
  ps.run();

  if(isMousePressed){
    ps.addForce(windForce);
  }

}

void mousePressed(){
  isMousePressed = true;
}

void mouseReleased(){
  isMousePressed = false;
}
