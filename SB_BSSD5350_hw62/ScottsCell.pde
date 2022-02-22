 class ScottsCell {
  float x, y;
  float state;
  float nextState;
  float lastState = 0;
  ScottsCell[] neighbors;
  int _cellSize = 10;
  int age = 0;

  ScottsCell(float ex, float why, int cellSize) {
  x = ex * _cellSize;
  y = why * _cellSize; 
  nextState = ((x/500) + (y/300)) * 14;
  state = nextState;
  neighbors = new ScottsCell[0];
 }

void addNeighbor(ScottsCell cell) {
  neighbors = (ScottsCell[])append(neighbors, cell);
}

void calcNextState() { 
  float total = 0;
  for (int i=0; i < neighbors.length; i++) {
    total += neighbors[i].state;
  }
  float average = int(total/8);

  if (average == 255) {
    nextState = 0;
  } else if (average == 0) {
    nextState = 255;
  } else {
    nextState = state + average;
  if (lastState > 0) { nextState -= lastState; }
  if (nextState > 255) { nextState = 255; }
  else if (nextState < 0) { nextState = 0; }
  }
  lastState = state;
  if(state == nextState) {
     age++;
   } else {
     age =0;
   }
}

void drawMe() {
  state = nextState;
  stroke(0);
 int nbCount = 0;
    for(ScottsCell sq: neighbors) {
      if (sq.state == state){
        nbCount++;
      }
    }
    int ac = int(map(age, 0, 100, 0, 255));
    int nc = int(map(nbCount, 0, 8, 0, 255));
    println(nbCount);
    if (nbCount % 2 == 0) {
    //if (state == 1) { 
      fill(0, ac, nc);
    } else {
    fill(255, ac, nc);
   }
  ellipse(x, y, _cellSize, _cellSize);
  }
}
  
