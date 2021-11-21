class Ball{
  int X;
  int Y;
  int diam;
  int offsetX;
  int offsetY;
  int r;
  int g;
  int b;
  
  Ball(int xloc, int yloc, int d, int red, int green, int blue){
    X = xloc;
    Y = yloc;
    diam = d;
    offsetX = 1;
    offsetY = 1;
    r = red;
    g = green;
    b = blue;
  }
  
  void draw(){
    strokeWeight(3);
    fill(r,g,b);
    stroke(255,255,255);
    ellipse(X,Y,diam,diam);
  }
  
  boolean move(int batY, int batW){ // returns true, unless ball is "lost"
    X = X + offsetX;
    Y = Y + offsetY;
    
    // detect if loss
    if(Y > batY){ // ball has gone beyond the bat
      return (false);
    }
    
    // detect edges
    // right/left
    if(X > WIDTH-diam || X == 0){
      offsetX =- offsetX;
    } else if(Y == 0){ // top
      offsetY =- offsetY;
    }
    
    // check if in contact with bat
    if((X >= mouseX) && (X <= mouseX + batW) && (Y > batY-diam)){
      offsetY =- offsetY;
    }
    
   // check all bricks
   for (int i=0; i<Bricks.size(); i++){
     int touch=Bricks.get(i).touching(X,Y,diam);
     
     if (touch==0){ // top or bottom
       // remove brick and reverse Y direction
       Bricks.remove(i);
       offsetY=-offsetY;
     } else if(touch==1){ // side
       // remove brick and reverse X direction
       Bricks.remove(i);
       offsetX=-offsetX;
     }
   }
    return (true);
  }
  
  // replaces the balls position if its "died"
  void replace(){
    X=BALLINITX;
    Y=BALLINITY;
    offsetX=1;
    offsetY=1;
  }
}
