// Lissajous Curve Table

Circle[] circlesRow;
Circle[] circlesCol;
int numCircles = 8;
int diameter = 90;
float baseAngularVelocity = 0.015;
Curve[][] curves;

void setup(){
  size(900,900);
  circlesRow = new Circle[numCircles];
  circlesCol = new Circle[numCircles];
  curves = new Curve[numCircles][numCircles];

  for(int i=0; i<numCircles; i++){
    // instantiate all circles -- in row
    circlesRow[i] = new Circle(new PVector(150+100*i, 50), diameter, baseAngularVelocity*(i+1));

    // instantiate all circles -- in column
    circlesCol[i] = new Circle(new PVector(50, 150+100*i), diameter, baseAngularVelocity*(i+1));
  }

  for(int i=0; i<numCircles; i++){
    for(int j=0; j<numCircles; j++){
      curves[i][j] = new Curve();
    }
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

  for(int i=0; i<numCircles; i++){
    for(int j=0; j<numCircles; j++){
      curves[i][j].addPoint(circlesRow[i].getPointPosition().x, circlesCol[j].getPointPosition().y);
      curves[i][j].draw();
    }
  }

  // if the slowest circle completes one rotation --> reset the curves
  if(circlesRow[0].getAngle() >= 3*PI/2){
    for(int i=0; i<numCircles; i++){
      for(int j=0; j<numCircles; j++){
        curves[i][j].reset();
        circlesRow[i].setAngle(-HALF_PI);
        circlesCol[i].setAngle(-HALF_PI);
      }
    }
  }

}
