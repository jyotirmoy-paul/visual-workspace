public class Box{

  float xCorr;
  int yCorr;
  int mass;
  float velocity;
  int size;

  public Box(float xCorr, int yCorr, int size, int mass, float velocity){
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
    rect(xCorr, yCorr, size, size);
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
    int m1 = this.mass;
    int m2 = other.mass;
    float u1 = this.velocity;
    float u2 = other.velocity;
    int massSum = m1 + m2;

    this.velocity = ((float)(m1-m2)/massSum)*u1 + ((float)2*m2/massSum)*u2;
    other.velocity = ((float)2*m1/massSum)*u1 + ((float)(m2-m1)/massSum)*u2;
  }

}
