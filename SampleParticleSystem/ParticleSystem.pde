public class ParticleSystem{

  private ArrayList<Particle> plist;
  private PVector origin;

  public ParticleSystem(PVector origin){
    plist = new ArrayList<Particle>();
    this.origin = origin;
  }

  public void addForce(PVector force){
    for(Particle p: plist){
      p.addForce(force);
    }
  }

  public void addParticle(){
    plist.add(new Particle(origin.get()));
    plist.add(new Particle(origin.get()));
  }

  public void run(){
    for(int i=plist.size()-1; i>=0; i--){
      Particle p = plist.get(i);
      p.run();
      if(p.isDead()){
        plist.remove(i);
      }
    }
  }

}
