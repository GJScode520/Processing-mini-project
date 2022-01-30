// PA4_GSUNDAY1.pde *
// Godsfavour Sunday
// 10/30/2020
// COMP 101Y Collaboration ** 
// gsunday1@umbc.edu*
// Pacman 4: Win or Lose ***
// Use the arrow keys to eat the baby pacmen. 
// If you eay all 50 you win. 
// If you are caught by the ghost you lose.
// [WARNING]->I keep having this issue where sometimes the code will run perfectly but other times the arrow key) just won't work. <-[WARNING]


//variables for pacman
float pacmanX = 80;
float pacmanY = 80;
float xDelta = 2;
float yDelta = 4;
final float PACMAN_SIZE = 70;
// variables for ghost
float ghostX = 800;
float ghostY = 500;
final float GHOST_SIZE = 70;
//variables for dots
int numOfDots = 50;
int numOfDotsRemaining = numOfDots;
float [] dotsX;
float [] dotsY;
//points
int points = 0;



/*
* setup - prepares envirnment size and color
 */
//creates environment with black background and a 1200 by 550 screen
void setup() {
  //set canvas size and color
  size(1200, 550);
  background(0);
  dotsX = new float[numOfDots];
  dotsY = new float[numOfDots];

  for (int i = 0; i < numOfDots; i++) { //creates the values dot's X and Y (since they must be assigned once I decided to put them in the Void setup)
    dotsX[i] = random(20, 1160);
    dotsY[i] = random(20, 510);
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

void keyPressed() { //arrow keys for Pacman movement
  if (key == CODED) {
    if (keyCode == LEFT) {
      pacmanX = pacmanX - 12;
    } else if (keyCode == RIGHT) {
      pacmanX = pacmanX + 12;
    } else if (keyCode == DOWN) {
      pacmanY = pacmanY + 12;
    } else if (keyCode == UP) {
      pacmanY = pacmanY - 12;
    }
  }
}

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
  if (pacmanY > 510) {
    pacmanY = pacmanY - 40;
  }
  if (pacmanY < 40) {
    pacmanY = pacmanY + 40;
  }
}


void makePacmanWrap() { //makes pacman move to the other side from 1200 to 0
  if (pacmanX > 1200) {
    pacmanX = .00096 * pacmanX;
  }
  if (pacmanX <= 0) {
    pacmanX = 1160;
  }
}


void assignDotPositions() { // makes pacman eat the dots by calculating the relative distance
  for (int i = numOfDots - 1; i >= 0; i= i - 1) {
    float dist = sqrt(((dotsX[i] - pacmanX) * (dotsX[i] - pacmanX) / 2) + ((dotsY[i] - pacmanY) * (dotsY[i] - pacmanY)/2));
    if (dist <= 20) {
      dotsX[i] = -1000;
      dotsY[i] = -1000;
      points = points + 10;
      numOfDotsRemaining--; //shows how many dots remain
      break;
    }
  }
}


void drawDots() { //creates the dots and using the dot's X and dot's Y which were already assigned
  for (int i = 0; i < numOfDots; i++) {
    arc(dotsX[i], dotsY[i], 15, 15, radians(20), radians(330));
    fill(255);
    stroke(5);
  }

  textSize(22);
  fill(226, 58, 0);
  text("points:" + points, 1000, 50); //shows the pacman points

  if (numOfDotsRemaining == 0) {
    textSize(72);
    fill(0);
    strokeWeight(50);
    rect(0, 0, 1200, 550);
    fill(226, 58, 0);
    text("YOUR A CANNIBAL", 250, 250); //shows the win screen
  }

  if ((ghostX == pacmanX)&&(ghostY == pacmanY)) {
    textSize(72);
    fill(226, 58, 0);
    fill(0);
    strokeWeight(50);
    rect(0, 0, 1200, 550);
    fill(226, 58, 0);
    text("GAMEOVER", 350, 250);  //shows the losing screen
    ghostX = 500;
    ghostY = 500;
    pacmanX = 500;
    pacmanY = 500;
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

void moveGhost() { //makes ghost add values of 1 in the direction of the pacman X and Y coordinates while also stopping it from moving off the screen by pushing it back with a barrier based on the value 
  if (ghostX > pacmanX) {
    ghostX = ghostX - 1;
  }

  if (ghostX < pacmanX) {
    ghostX = ghostX + 1;
  }

  if (ghostY > pacmanY) {
    ghostY = ghostY - 1;
  }

  if (ghostY < pacmanY) {
    ghostY = ghostY + 1;
  }
}
