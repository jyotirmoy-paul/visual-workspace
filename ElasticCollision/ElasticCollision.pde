// visualise a perfectly elastic collision

// PI = 3.1415926535

int digitOfPiNeeded = 8;
double timeSteps = Math.pow(10,digitOfPiNeeded-1);

double mass1 = 1;
double mass2 = Math.pow(100, digitOfPiNeeded-1);
int initialVelocity = -3; // initial velocity second block

// first box
Box boxOne = new Box(new Vector2D(200, 150), new Vector2D(0, 0), 50, mass1);
// second box
Box boxTwo = new Box(new Vector2D(500, 150), new Vector2D(initialVelocity/timeSteps, 0), 50, mass2);

int collisionCount = 0;

void setup(){
  size(1200,300);
}

void draw(){
  background(200); // clears everything

  for(long i=0; i<timeSteps; i++){
    if(boxOne.hasCollidedWith(boxTwo)){
      boxOne.collideWith(boxTwo);
      collisionCount += 1;
    }

    if(boxOne.hasCollidedWithLeftWall()){
      boxOne.reverseVelocity();
      collisionCount += 1;
    }
    boxOne.update();
    boxTwo.update();
  }

  // actually render the boxes and the text [collision count]
  boxOne.render(255);
  boxTwo.render(100);
  showCollisionCount(0);
}

void showCollisionCount(int c){
  textSize(32);
  fill(c);
  text("No. of Collision: " + collisionCount, 50,50);
}
