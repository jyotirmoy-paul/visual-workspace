public class Circle{

  public final static int HORIZONTAL_LINE = 0;
  public final static int VERTICAL_LINE = 1;

  private PVector position;
  private int diameter;
  private int radius;

  private PVector pointPosition;
  private float angle = -HALF_PI;
  private float angularVelocity;

  public Circle(PVector position, int diameter, float angularVelocity){
    this.position = position;
    this.diameter = diameter;
    this.angularVelocity = angularVelocity;
    this.radius = diameter/2;

    pointPosition = new PVector(position.x + radius*cos(angle), position.y + radius*sin(angle));
  }

  private void rotatePoint(){
    angle += angularVelocity;
    pointPosition.x = position.x + radius*cos(angle);
    pointPosition.y = position.y + radius*sin(angle);
  }

  public void draw(int lineType){
    noFill();
    stroke(0);
    strokeWeight(2);
    ellipse(position.x, position.y, diameter, diameter);

    strokeWeight(0.5);
    if(lineType == HORIZONTAL_LINE){
      line(pointPosition.x, pointPosition.y, width, pointPosition.y);
    } else{
      line(pointPosition.x, pointPosition.y, pointPosition.x, height);
    }

    rotatePoint();
    strokeWeight(10);
    point(pointPosition.x, pointPosition.y);

  }

  public PVector getPointPosition(){
    return pointPosition;
  }

  public float getAngle(){
    return angle;
  }

  public void setAngle(float angle){
    this.angle = angle;
  }

}
