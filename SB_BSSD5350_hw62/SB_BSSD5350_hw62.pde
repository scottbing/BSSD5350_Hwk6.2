
import controlP5.*;

ControlP5 cp5;
Textarea myTextarea;
GOL currGOL;

void setup() {
  size(700,400);
  cp5 = new ControlP5(this);
  
  myTextarea = cp5.addTextarea("txt")
                  .setPosition(width/16, height/16)
                  .setSize(width*7/8, height*7/8)
                  .setFont(createFont("arial",12))
                  .setLineHeight(14)
                  .setColor(color(128))
                  .setColorBackground(color(255,100))
                  .setColorForeground(color(255,100));
                  ;
  myTextarea.setText("\n"
                    +" Press the number of the desired GOL Rule."
                    +"\n"
                    +"  1. Traditional GOL\n"
                    +"  2. Vichniac Vote\n"
                    +"  3. Brian's Brain\n"
                    +"  4. Custom Wave\n"
                    +"  5. Growing Squares\n"
                    +"  6. Scotts Wave\n"
                    );
                    noLoop();  
}

void keyPressed() {
    switch(key) {
      case '1':
        currGOL = new Game_Of_Life();
        myTextarea.hide();
        loop();
        break; 
      case '2':
        currGOL = new Vichniac_Vote();
        myTextarea.hide();
        loop();
        break; 
      case '3':
        currGOL = new Brians_Brain();
        myTextarea.hide();
        loop();
        break;   
      case '4':
        currGOL = new Custom_Wave();
        myTextarea.hide();
        loop();
        break;     
      case '5':
        currGOL = new GrowingSquares();
        myTextarea.hide();
        loop();
        break; 
      case '6':
        currGOL = new Scotts_Chaos();
        myTextarea.hide();
        loop();
        break;   
      case 'r':
        currGOL = null;
        background(120);
        myTextarea.show();
        noLoop();
        break; 
      default: 
        break;
  }
}

void draw() {
  if (currGOL != null){
    currGOL.draw();
  }
}
