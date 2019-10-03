public class Triangle{

  private PVector location;

  private final int SIZE = 25;

  public Triangle(PVector location){
    this.location = location;
  }

  public void draw(){
    noStroke();
    fill(0,0,0);
    triangle(location.x, location.y, location.x-SIZE/2,
        location.y+SIZE, location.x+SIZE/2, location.y+SIZE);
  }

}
