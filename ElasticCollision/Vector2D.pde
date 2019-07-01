public Vector2D{

  public double x;
  public double y;

  public Vector2D(double x, double y){
    this.x = x;
    this.y = y;
  }

  public Vector2D add(Vector2D other){
    this.x += other.x;
    this.y += other.y;
  }

}
