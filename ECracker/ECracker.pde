ArrayList<ParticleSystem> pslist;
ArrayList<Triangle> tlist;

// forces for our particle system
PVector gravity;

void setup(){
  size(1300,700);
  pslist = new ArrayList<ParticleSystem>();
  tlist = new ArrayList<Triangle>();
  gravity = new PVector(0, 0.05);
}

void draw(){
  background(255);

  for(Triangle t: tlist){
    t.draw();
  }

  for(ParticleSystem ps: pslist){
    ps.addParticle();
    ps.applyForce(gravity);
    ps.run();
  }

}

void mouseClicked(){
  pslist.add(new ParticleSystem(new PVector(mouseX, mouseY)));
  tlist.add(new Triangle(new PVector(mouseX, mouseY)));
}
