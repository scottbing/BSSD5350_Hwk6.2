 class CustomCell {
  float x, y;
  float state;
  float nextState;
  float lastState = 0;
  Cell[] neighbors;
  int _cellSize = 10;

  CustomCell(float ex, float why, int cellSize) {
  x = ex * _cellSize;
  y = why * _cellSize; 
  nextState = ((x/500) + (y/300)) * 14;
  state = nextState;
  neighbors = new Cell[0];
 }

void addNeighbor(Cell cell) {
  neighbors = (Cell[])append(neighbors, cell);
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
}

void drawMe() {
  state = nextState;
  stroke(0);
  fill(state);
  ellipse(x, y, _cellSize, _cellSize);
  }
}
  
