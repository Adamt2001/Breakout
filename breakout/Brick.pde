class Brick{
  int myX;
  int myY;
  int r;
  int g;
  int b;
  
  Brick( int xpos, int ypos){
    myX = xpos;
    myY = ypos;
    r = (int) random(256);
    g = (int) random(256);
    b = (int) random(256);
  }
  
  void draw(){
    strokeWeight(3);
    fill(r,g,b);
    stroke(255,255,255);
    rect(myX,myY,BRICKW,BRICKH);
  }
  
  int touching(int bx, int by, int diam){
    // ball detains passed in: x, y, diameter
    // returns -1 if ball not touching this brick
    // returns 0 if touching top or bottom
    // returns 1 if touch either side
    
    // check bottom of brick
    if ((bx>=myX) && (bx<=myX+BRICKW) && (by==myY+BRICKH)){
      return 0;
    }
     
   // check top of brick
   if ((bx>=myX) && (bx<=myX+BRICKW) && (by==myY-diam)){
     return 0;
   }
   
   // check left side of brick
   if ((by>=myY) && (by<=myY+BRICKH) && (bx==myX-diam)){
     return 1;
   }
     
   // check right side of brick
   if ((by>=myY) && (by<=myY+BRICKH) && (bx==myX+BRICKW)){
     return 1;
   }
   
   // nothing detected, so return default setting
   return -1;
  }
}
