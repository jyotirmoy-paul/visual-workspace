class Curve{

  private ArrayList<PVector> path;
  private PVector currentPoint;

  public Curve(){
    path = new ArrayList();
    currentPoint = new PVector(0,0);
  }

  void addPoint(float x, float y){
    path.add(new PVector(x, y));
    currentPoint.x = x;
    currentPoint.y = y;
  }

  void draw(){
    noFill();
    stroke(0);
    strokeWeight(1);

    beginShape();
    for(PVector p: path){
      vertex(p.x, p.y);
    }
    endShape();

    strokeWeight(10);
    point(currentPoint.x, currentPoint.y);

  }

}
