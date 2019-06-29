// visualise a perfectly elastic collision

// PI = 3.1415926535

int digitOfPiNeeded = 3;
long timeSteps = (long)Math.pow(10,digitOfPiNeeded-1);

// first box
Box boxOne = new Box(200, 150, 50, 1, 0);

// second box
Box boxTwo = new Box(350, 150, 50, (long) Math.pow(100, digitOfPiNeeded-1), (double)-3/timeSteps);

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
  boxOne.show(255);
  boxTwo.show(100);
  showCollisionCount(0);
}

void showCollisionCount(int colorFill){
  textSize(32);
  fill(colorFill);
  text("No. of Collision: " + collisionCount, 50,50);
}
