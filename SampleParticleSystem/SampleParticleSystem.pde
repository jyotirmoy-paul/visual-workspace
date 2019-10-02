private ParticleSystem ps;

private ArrayList<ParticleSystem> pslist;

// forces for our particle system
private PVector gravity;
private PVector windForce;

void setup(){
  size(700,500);
  pslist = new ArrayList<ParticleSystem>();

  // instantiating our forces
  gravity = new PVector(0,0.05);
  windForce = new PVector(0.1, 0);
}

void draw(){
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

void mousePressed(){
  if(mouseButton == LEFT){
    // create a new particle system at the mouse position
    pslist.add(new ParticleSystem(new PVector(mouseX, mouseY)));
  }
}
