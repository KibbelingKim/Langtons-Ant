//Make ant [blue?]/magenta/orange/white and border magenta/orange/[white?] //<>// //<>//
//Fix exceptions, fix x/y mixed up
//Slowly start and speed up pace or speed up by clicking
//Clean up code
//Add author credits (@?) (with github?)
//Clean up hue 69 trick
//Remove unnecessary shit like variables (like antStroke?)
//Start with clean board, then make origin spot
//Starts going west(4), change to north(1) (setup/gen1/gen0 problem)
//Dynamicly change window size from small to big (x) when runs out of space (repetition just started) (to learn but zooming is prob. ni
//Ant
//Presets!
//termites
//improve performance
//LRRRRRLLR stuff. Universal. colors automatic
//Hexagonal grid (makes the pretty ones)
//multiple ants
//coding train kijken
//only draw after x amount of steps for performance

// Ed Pegg, Jr. considered ants that can turn for example both left and right, splitting in two and annihilating each other when they meet.[8]

//ZOOM OUT when it reaches the end of window size!!

//Is mijne wel precies hetzelfde als de officiele? verschil misschien te maken met starting position

//Eentje maken waarbij de ant gewoon steeds een random kant op loopt om te vergelijken

//Kan je zien op windows miniview met taskbarhoover dat pixels kleiner zijn dan positie stappen in processing? how about pixel density(retina shit)?

int cellSizeX = 15;
int cellSizeY = 15;
int deadHue = 240;
int liveHue = 120;
int antHue = 69;
int antStroke = 240;
int startHue = 69;
int startStrokeHue = 69;
int antDir = 1;
int newAntDir = 1;
//76 by 47 for big
//51 by 47 for small
int xCells = 60;
int yCells = 47;
Cell[][] cells = new Cell[xCells][yCells];
int[][] oldHue = new int[xCells][yCells];

//below x/y mixed up?
int antX = 30;
int antY = 23;
int newAntX = 30;
int newAntY = 24;
//above x/y mixed up?

boolean antLive = false;

void settings() {
  size(xCells * cellSizeX, yCells * cellSizeY);
}



void setup() {
  colorMode(HSB, 360);
  background(0);
  strokeWeight(2);
  stroke(255);
  frameRate(100);

  for (int i = 0; i < cells.length; i++) {
    for (int j = 0; j < cells[i].length; j++) {
      cells[i][j] = new Cell(i * cellSizeX, j * cellSizeY, cellSizeX, cellSizeY, startHue, startStrokeHue);
      oldHue[i][j] = cells[i][j].getFillHue();
    }
  }
}

void draw() {

  //for (int iii = 0; iii < 100; iii++) {

    antDir = newAntDir;
    antX = newAntX;
    antY = newAntY;


    if (antDir == 1 && antY > 0) {
      if (oldHue[antX][antY-1] == deadHue || oldHue[antX][antY-1] == startHue) {
        newAntDir--;
        cells[antX][antY-1].setFillHue(liveHue);
      } 
      if (oldHue[antX][antY-1] == liveHue) {
        cells[antX][antY-1].setFillHue(deadHue);
        newAntDir++;
      }
      newAntY--;
    }

    if (antDir == 2 && antX < cells.length) {
      if (oldHue[antX+1][antY] == deadHue || oldHue[antX+1][antY] == startHue) {
        newAntDir--;
        cells[antX+1][antY].setFillHue(liveHue);
      }
      if (oldHue[antX+1][antY] == liveHue) {
        newAntDir++;
        cells[antX+1][antY].setFillHue(deadHue);
      }
      newAntX++;
    }

    if (antDir == 3 && antY < cells[antX].length) {
      if (oldHue[antX][antY+1] == deadHue || oldHue[antX][antY+1] == startHue) {
        newAntDir--;
        cells[antX][antY+1].setFillHue(liveHue);
      }
      if (oldHue[antX][antY+1] == liveHue) {
        newAntDir++;
        cells[antX][antY+1].setFillHue(deadHue);
      }
      newAntY++;
    }

    if (antDir == 4 && antX > 0) {
      if (oldHue[antX-1][antY] == deadHue || oldHue[antX-1][antY] == startHue) {
        newAntDir--;
        cells[antX-1][antY].setFillHue(liveHue);
      }
      if (oldHue[antX-1][antY] == liveHue) {
        newAntDir++;
        cells[antX-1][antY].setFillHue(deadHue);
      }
      newAntX--;
    }



    if (newAntDir == 0) {
      newAntDir = 4;
    }
    if (newAntDir == 5) {
      newAntDir = 1;
    }


    for (int i = 0; i < cells.length; i++) {
      for (int j = 0; j < cells[i].length; j++) {
        cells[i][j].show();
      }
    }

    //cells[antX][antY].setFillHue(antHue);
    //cells[antX][antY].show();
    //cells[antX][antY].setFillHue(oldHue[antX][antY]);

    for (int i = 0; i < cells.length; i++) {
      for (int j = 0; j < cells[i].length; j++) {
        oldHue[i][j] = cells[i][j].getFillHue();
      }
    }
  


  cells[newAntX][newAntY].show();


  // If i comment out "if (frameCount%1 == 0) {...}". The reported G/s is actually LOWER. WTF is that about???

  if (frameCount%100 == 0) {
    println("\r\n\r\n\r\n");
    println("Generation #:   " + frameCount);
    println("Generations/s:  " + frameRate);
  }
}
