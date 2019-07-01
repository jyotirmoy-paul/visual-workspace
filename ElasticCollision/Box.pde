import java.util.*;
import java.text.*;

public class Box{

  Vector2D location;
  Vector2D velocity;
  int size;
  double mass;

  // default constructor
  public Box(Vector2D location, Vector2D velocity, int size, double mass){
    this.location = location;
    this.velocity = velocity;
    this.size = size;
    this.mass = mass;
  }

  public void update(){
    // vector addition of velocity vector to the location vector
    location.add(velocity);
  }

  public void render(int c){

    fill(c);
    rect((float) location.x, (float) location.y, size, size);

    // show the mass
    textSize(16);
    fill(0);
    text("M = " + NumberFormat.getInstance().format(this.mass), (float) location.x, ((float) location.y) - 10);
  }

  public void reverseVelocity(){
    // reverse the velocity in x direction
    velocity.x *= -1;
  }

  private boolean hasCollidedWithLeftWall(){
    return location.x < 0;
  }

  public boolean hasCollidedWith(Box other){
    // as motion is only along x axis --- checking the x coordinate will give the idea
    return this.location.x <= other.location.x && this.location.x + this.size >= other.location.x;
  }

  public void collideWith(Box other){

    // masses
    double m1 = this.mass;
    double m2 = other.mass;

    // sum of the masses
    double massSum = m1 + m2;

    // initial velocities
    double u1 = this.velocity.x;
    double u2 = other.velocity.x;

    // update the velocity in x direction only
    this.velocity.x = ((m1-m2)/massSum)*u1 + (2*m2/massSum)*u2;
    other.velocity.x = (2*m1/massSum)*u1 + ((m2-m1)/massSum)*u2;
  }

}
