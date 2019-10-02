
private PVector gravity;

ArrayList<Particle> plist;

void setup(){
  size(700,500);
  gravity = new PVector(0,0.001);
  plist = new ArrayList<Particle>();
}

void draw(){
  background(255);
  plist.add(new Particle(width/2));
  plist.add(new Particle(width/2));
  plist.add(new Particle(width/2));

  for(int i=plist.size()-1; i>=0;i--){
    Particle p = plist.get(i);
    p.addForce(gravity);
    p.run();
    if(p.isDead()){
      plist.remove(i);
    }
  }
}
