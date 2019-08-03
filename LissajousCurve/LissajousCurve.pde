// Lissajous Curve Table

Circle[] circlesRow;
Circle[] circlesCol;
int numCircles = 7;
int diameter = 90;
float baseAngularVelocity = 0.015;

void setup(){
  size(800,800);
  circlesRow = new Circle[numCircles];

  // instantiate all the circles -- in row
  for(int i=0; i<numCircles; i++){
    circlesRow[i] = new Circle(new PVector(150+100*i, 100), diameter, baseAngularVelocity*(i+1));
  }

}

void drawAllCircles(){
  for(int i=0; i<numCircles; i++){
    circlesRow[i].draw(Circle.VERTICAL_LINE);
  }
}

void draw(){
  background(255);
  drawAllCircles();
}
