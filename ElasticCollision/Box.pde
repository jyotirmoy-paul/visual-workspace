public class Box{

  double xCorr;
  int yCorr;
  long mass;
  double velocity;
  int size;

  public Box(double xCorr, int yCorr, int size, long mass, double velocity){
    this.xCorr = xCorr;
    this.yCorr = yCorr;
    this.mass = mass;
    this.velocity = velocity;
    this.size = size;
  }

  public void update(){
    this.xCorr += velocity;
  }

  public void show(int grayscaledColor){
    fill(grayscaledColor);
    rect((float)xCorr,(float)yCorr, size, size);
  }

  public void reverseVelocity(){
    this.velocity *= -1;
  }

  private boolean hasCollidedWithLeftWall(){
    return xCorr < 0;
  }

  public boolean hasCollidedWith(Box other){
    // as motion is only along x axis --- checking the x coordinate will give the idea
    return this.xCorr <= other.xCorr && this.xCorr + this.size >= other.xCorr;
  }

  public void collideWith(Box other){
    long m1 = this.mass;
    long m2 = other.mass;
    double u1 = this.velocity;
    double u2 = other.velocity;
    long massSum = m1 + m2;

    this.velocity = ((double)(m1-m2)/massSum)*u1 + ((double)2*m2/massSum)*u2;
    other.velocity = ((double)2*m1/massSum)*u1 + ((double)(m2-m1)/massSum)*u2;
  }

}
