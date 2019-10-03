public class ParticleSystem{

  private ArrayList<Particle> plist;
  private PVector origin;
  private int lifespan;
  private int colorScheme;

  public ParticleSystem(PVector origin){
    this.origin = origin;
    plist = new ArrayList<Particle>();
    lifespan = int(random(100,400));
    colorScheme = int(random(0, 6));
  }

  public void applyForce(PVector force){
    for(Particle p: plist){
      p.addForce(force);
    }
  }

  private boolean isDead(){
    return lifespan <= 0;
  }

  public void addParticle(){
    if(!isDead()){
      for(int i=0; i<3; i++){
        plist.add(new Particle(origin.get(),
          new PVector(random(-0.6,0.6),random(-10,-6)),colorScheme));
      }
    }
  }

  public void run(){
    lifespan -= 1;
    for(int i=plist.size()-1; i>=0; i--){
      Particle p = plist.get(i);
      if(p.isDead()){
        plist.remove(i);
      }
      p.run();
    }
  }


}
