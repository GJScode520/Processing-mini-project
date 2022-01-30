/*************
 **  PA2_GSUNDAY.pde
 **  Godsfavour Sunday
 **  10/11/2020
 **  Collaboration  
 **  gsunday1@umbc.edu
 **  zig zags pacman while bouncing off
 **  top and bottom and wrapping around
 */

//variables for pacman
float pacmanX = 80;
float pacmanY = 80;
float xDelta = 2;
float yDelta = 4;
final float PACMAN_SIZE = 70;
// variables for ghost
float ghostX = 200;
float ghostY = 200;
final float GHOST_SIZE = 70;
//variables for dots
float [] dotsX;
float [] dotsY;

/*
* setup - prepares envirnment size and color
 */
//creates environment with black background and a 1200 by 550 screen
void setup() {
  //set canvas size and color
  size(1200, 550);
  background(0);
  dotsX = new float[50];
  dotsY = new float[50];

  for (int i =0; i < 50; i++) { //creates the values dot's X and Y (since they must be assigned once I decided to put them in the Void setup)
    dotsX[i] = random(20, 1180);
    dotsY[i] = random(20, 530);
  }
}

/*
* DrawPacman - draws a packman a the given x, y
 */
void drawPacman() { //draws pacman in electric yellow
  fill(255, 255, 0);
  background(0);
  arc(pacmanX, pacmanY, PACMAN_SIZE, PACMAN_SIZE, radians(20), radians(330));
}

/*
* draw - move pacman on diagonals and bounce off top
 * and bottom while rapping around left to right
 */
void draw() { //calls all fuctions to be drawn and work 
  drawPacman();
  makepacmanBounce();
  makePacmanWrap();
  drawGhost();
  moveGhost();
  assignDotPositions();
  drawDots();
}
//move pacman if mouse is clicked

//check bounds and make pacman bounce off top/bottom
//and wrap right to left  

/*
* makePacmanBounce - redirects pacman to opposite direction
 * when hitting top/bottom
 */
void makepacmanBounce() { //makes pacman inverse to switch direction and also contimously moves pacman to 1201  
  if ((pacmanY > 510)||(pacmanY < 40)) {
    yDelta = -1 * yDelta;
  }
  if (pacmanY < 1201) {
    pacmanX = xDelta + pacmanX;
    pacmanY = pacmanY + yDelta;
  }
}
/*
* makePacmanWrap - puts pacman on left when it reaches right
 */
void makePacmanWrap() { //makes pacman reset position to 80 when pacman hits a value greater than 1200
  if (pacmanX > 1200) {
    pacmanX = .00096 * pacmanX;
  }
}

void assignDotPositions() { // makes pacman eat the dots by calculating the relative distance
  for (int i = 50 - 1; i >= 0; i= i - 1) {
    float dist = sqrt((dotsX[i] - pacmanX) * (dotsX[i] - pacmanX) * (dotsY[i] - pacmanY) * (dotsY[i] - pacmanY));
    if (dist <= 35) {
      dotsX[i] = -1200;
      dotsY[i] = -550;
      break;
    }
  }
}

void drawDots() { //creates the dots and using the dot's X and dot's Y which were already assigned
  for (int i = 0; i < 50; i++) {
    rect(dotsX[i], dotsY[i], 15, 15);
    fill(255);
    stroke(5);
  }
}

void drawGhost() { //draws a blue ghost with blue pupils
  fill(0, 0, 255);
  ellipse(ghostX + 35, ghostY, GHOST_SIZE, GHOST_SIZE);
  rect(ghostX, ghostY, GHOST_SIZE, 40);
  stroke(0, 0, 255);
  fill(255);
  ellipse(ghostX + 20, ghostY, 20, 20);
  ellipse(ghostX + 50, ghostY, 20, 20);
  fill(255);
  fill(0, 0, 255);
  ellipse(ghostX + 20, ghostY, 10, 10);
  ellipse(ghostX + 50, ghostY, 10, 10);
}

void moveGhost() { //makes ghost add values of 1 in the direction of the mouses X and Y coordinates while also stopping it from moving off the screen by pushing it back with a barrier based on the value 
  if (ghostX > mouseX) {
    ghostX = ghostX - 1;
  }

  if (ghostX < mouseX) {
    ghostX = ghostX + 1;
  }

  if (ghostY > mouseY) {
    ghostY = ghostY - 1;
  }

  if (ghostY < mouseY) {
    ghostY = ghostY + 1;
  }

  if (mouseX < 40) {
    mouseX = mouseX + 40;
  }

  if (mouseX > 1100) {
    mouseX = mouseX - 40;
  }

  if (mouseY < 40) {
    mouseY = mouseY + 40;
  }

  if (mouseY > 490) {
    mouseY = mouseY - 40;
  }
}
