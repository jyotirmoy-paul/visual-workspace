// Lissajous Curve Table

Circle[] circles;
int numOfCircles = 1;
int diameter = 100;
float baseAngularVelocity = 0.015;

void setup(){
  size(700,700);
  circles = new Circle[numOfCircles*2];
  for(int i=0; i<numOfCircles; i++){
    circles[i] = new Circle(new PVector(width/2, height/2), diameter, baseAngularVelocity);
  }

}

void drawAllCircles(){
  for(int i=0; i<numOfCircles; i++){
    circles[i].draw(Circle.VERTICAL_LINE);
  }
}

void draw(){
  background(255);
  drawAllCircles();
}
