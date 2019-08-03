public class Circle{

  private PVector position;
  private int diameter;

  public Circle(PVector position, int diameter){
    this.position = position;
    this.diameter = diameter;
  }

  public void draw(int strokeVal, int strokeWeightVal){
    noFill();
    stroke(strokeVal);
    strokeWeight(strokeWeightVal);
    ellipse(position.x, position.y, diameter, diameter);
  }

}
