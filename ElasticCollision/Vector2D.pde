public class Vector2D{

  public double x;
  public double y;

  // vector2D constructor
  public Vector2D(double x, double y){
    this.x = x;
    this.y = y;
  }

  // add method for vector object
  public void add(Vector2D other){
    this.x += other.x;
    this.y += other.y;
  }

}
