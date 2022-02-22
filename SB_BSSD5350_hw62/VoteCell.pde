class VoteCell {
  float x, y;
  boolean state; 
  boolean nextState;
  VoteCell[] neighbours;
  int _cellSize = 10;

  VoteCell(float ex, float why, int cellSize) {
  x = ex * _cellSize;
  y = why * _cellSize;
  if (random(2) > 1) {
    nextState = true;
  } else {
    nextState = false;
  }
  state = nextState;
  neighbours = new VoteCell[0];
}

void addNeighbour(VoteCell cell) {
  neighbours = (VoteCell[])append(neighbours, cell);
}

void calcNextState() {
  int liveCount = 0;
  if (state) { liveCount++; }
    for (int i=0; i < neighbours.length; i++) {
      if (neighbours[i].state == true) {
        liveCount++;
      }
    }

    if (liveCount <= 4) {
      nextState = false;
    } else if (liveCount > 4) {
      nextState = true;
    } 
    if ((liveCount == 4) || (liveCount == 5)) {
      nextState = !nextState;
    }
}
    
    
void drawMe() {
  state = nextState;
  stroke(0);
  if (state == true) {
    fill(0);
  } else {
  fill(255);
 }
 ellipse(x, y, _cellSize, _cellSize);
 }

}
