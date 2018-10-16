class Cell {
  // Position x,y 
  // Size xx, yy
  int x;
  int y;
  int xx;
  int yy;
  int fillHue;
  int strokeHue;



  Cell(int xPosition, int yPosition, int xxWidth, int yyHeight, int fillHueI, int strokeHueI) {
    x = xPosition;
    y = yPosition;
    xx = xxWidth;
    yy = yyHeight;
    fillHue = fillHueI;
    strokeHue = strokeHueI;
  }

  void setFillHue(int hue){
    this.fillHue = hue;
  }
  
  int getFillHue(){
    return this.fillHue;
  }


  void show() {
    strokeWeight(3);
    fill(fillHue, 360, 270);
    stroke(strokeHue, 0, 0);
    if (fillHue == startHue){
      fill(0, 0, 45);
    }
    if (x == newAntX * xx && y == newAntY * yy){
     // fill(300, 0, 360);
      stroke(315, 360, 360);
      strokeWeight(6);
    }
    rect(x, y, xx, yy);
  }
}
