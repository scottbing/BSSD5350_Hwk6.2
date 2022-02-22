class SquareCell {
  float x, y;
  boolean state; 
  boolean nextState;
  SquareCell[] neighbours;
  int _cellSize = 10;

  SquareCell(float ex, float why, int cellSize) {
    _cellSize = cellSize;
    x = ex * _cellSize;
    y = why * _cellSize;
    if (random(2) > 1) {
      nextState = true;
    } else {
      nextState = false;
    }
    state = nextState;
    neighbours = new SquareCell[0];
  }

  void addNeighbour(SquareCell cell) {
    neighbours = (SquareCell[])append(neighbours, cell);
  }

  void calcNextState() {
    int liveCount = 0;
    for (int i=0; i < neighbours.length; i++) {
      if (neighbours[i].state == true) {
        liveCount++;
      }
    }
    if (state == true) {
      if ((liveCount == 2) || (liveCount == 3)) {
        nextState = true;
      } else {
        nextState = false;
      }
     } else {
     if (liveCount == 3) {
       nextState = true;
     } else {
       nextState = false;
     }
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
   //ellipse(x, y, _cellSize, _cellSize);
   rect(x, y, _cellSize, _cellSize);
   }

}
