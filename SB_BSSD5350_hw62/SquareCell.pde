class SquareCell {
  float x, y;
  boolean state; 
  boolean nextState;
  SquareCell[] neighbours;
  int _cellSize = 10;
  int age = 0;

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
    for(SquareCell sq: neighbours) {
      if (sq.state == state){
        nbCount++;
      }
    }
    int ac = int(map(age, 0, 100, 0, 255));
    int nc = int(map(nbCount, 0, 8, 0, 255));
    if (state == true) {
      fill(0, ac, nc);
    } else {
    fill(255, ac, nc);
   }
   //ellipse(x, y, _cellSize, _cellSize);
   rect(x, y, _cellSize, _cellSize);
   }

}
