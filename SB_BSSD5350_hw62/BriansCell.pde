 class BriansCell {
  float x, y;
  int state;
  int nextState;
  BriansCell[] neighbours;
   int _cellSize = 10;

  BriansCell(float ex, float why, int _cellSize) {
  x = ex * _cellSize;
  y = why * _cellSize; 
  nextState = int(random(2));
  state = nextState;
  neighbours = new BriansCell[0];
 }

 void addNeighbour(BriansCell cell) {
   neighbours = (BriansCell[])append(neighbours, cell);
 }

 void calcNextState() {
   if (state == 0) {
 int firingCount = 0;
 for (int i=0; i < neighbours.length; i++) {
 if (neighbours[i].state == 1) {
 firingCount++;
 }
 }
 if (firingCount == 2) {
 nextState = 1;
 } else {
 nextState = state;
 }
 } else if (state == 1) {
 nextState = 2;
 } else if (state == 2) {
 nextState = 0;
 }
 }

 void drawMe() {
   state = nextState;
   stroke(0);
   if (state == 1) {
     fill(0);
   } else if (state == 2) {
     fill(150);
   } else {
     fill(255);
   }
   
   ellipse(x, y, _cellSize, _cellSize);

   }
 }
  
