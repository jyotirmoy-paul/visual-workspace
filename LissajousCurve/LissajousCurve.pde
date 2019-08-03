// Lissajous Curve Table

Circle[] circlesRow;
Circle[] circlesCol;
int numCircles = 7;
int diameter = 90;
float baseAngularVelocity = 0.015;

void setup(){
  size(800,800);
  circlesRow = new Circle[numCircles];
  circlesCol = new Circle[numCircles];

  for(int i=0; i<numCircles; i++){
    // instantiate all circles -- in row
    circlesRow[i] = new Circle(new PVector(150+100*i, 50), diameter, baseAngularVelocity*(i+1));

    // instantiate all circles -- in column
    circlesCol[i] = new Circle(new PVector(50, 150+100*i), diameter, baseAngularVelocity*(i+1));
  }

}

void drawAllCircles(){
  for(int i=0; i<numCircles; i++){
    circlesRow[i].draw(Circle.VERTICAL_LINE);
    circlesCol[i].draw(Circle.HORIZONTAL_LINE);
  }
}

void draw(){
  background(255);
  drawAllCircles();
}
