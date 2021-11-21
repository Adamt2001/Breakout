class Bat{
  int y;
  int w;
  int h;
  int r;
  int g;
  int b;
  
  Bat(int yloc, int width, int height, int red, int green, int blue){

    y=yloc;
    w=width;
    h=height;
    r=red;
    g=green;
    b=blue;
  }
  
  void draw(){
    fill(r,g,b);
    stroke(r,g,b);
    rect(mouseX,y,w,h);
  }
}
