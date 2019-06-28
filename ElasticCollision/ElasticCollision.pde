// visualise a perfectly elastic collision

int digitOfPiNeeded = 4;
int timeSteps = 10000;

// first box
Box boxOne = new Box(200, 150, 50, 1, 0);

// second box
Box boxTwo = new Box(500, 150, 50, (int) Math.pow(100, digitOfPiNeeded-1), (float)-3/timeSteps);

int collisionCount = 0;

void setup(){
  size(750,300);
}

void draw(){
  background(200); // clears everything

  for(int i=0; i<timeSteps; i++){
    if(boxOne.hasCollidedWith(boxTwo)){
      boxOne.collideWith(boxTwo);
      collisionCount += 1;
      System.out.println(collisionCount);
    }

    if(boxOne.hasCollidedWithLeftWall()){
      boxOne.reverseVelocity();
      collisionCount += 1;
      System.out.println(collisionCount);
    }
    boxOne.update();
    boxTwo.update();
  }

  boxOne.show(255);
  boxTwo.show(100);
}
