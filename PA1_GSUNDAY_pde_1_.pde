/*************
 **  PA1_GSUNDAY.pde
 **  Godsfavour Sunday
 **  9/22/2020
 **  Section: Collaboration  
 **  Email GSUNDAY@umbc.edu
 **  zig zags pacman while bouncing off 
 **  top and bottom and wrapping around
 */
 
//variables
float pacmanX = 80;
float pacmanY = 80;
float xDelta = 2;
float yDelta = 4;
final float PACMAN_SIZE = 70;

/*
* setup - prepares envirnment size and color
*/
void setup() {
  //set canvas size and color
  size(1200, 500);
  background(0);
}

/*
,l* draw - move pacman on diagonals and bounce off top 
* and bottom while rapping around left to right
*/
void draw() {
  fill(255, 255, 0); //set pacman's color to electric yellow
  background(0); //hides the lines pacman would normally create every 4 pixels using a black background
  arc(pacmanX, pacmanY, PACMAN_SIZE, PACMAN_SIZE, radians(20), radians(330)); // creates an arc (pacman) that starts at a radian of 20, stops at a radian of 330, has points that are the variable pacmanX and pacman Y, and lastly sets the size equal to the variable PACMAN_SETUP 
  //move pacman if mouse is clicked 
 if (mousePressed){ //if the mouse is pressed the code below will function
  pacmanX = xDelta + pacmanX; // pacman will change direction horizontally by xDelta every frame
  pacmanY = pacmanY + yDelta; // pacman will change direction Vertically by yDelta every frame
  }
  
  if((pacmanY > 510)||(pacmanY < 40)){ //if pacmanY is greater than 510 (the floor) or pacmanY is less than 40(the roof)  (these numbers were chosen as they create an affect as though pacman bounces off the roof and floor of the view box)
    yDelta = -1 * yDelta; //then yDelta will be multiplied by negative 1 (creating an affect as though the pacman is moving in the opposite direction)
  } 
  
  if (pacmanX > 1200){ //if pacmanX is greater than 1200px (the width of the box)
    pacmanX = .00096 * pacmanX; //then the pacmanX is multiplied by .00096 reseting the point at something similar to 80(.00096 x 1200) (this creates an illusion of the pacman starting at the same position as the opposite side and repeating the cycle)
  }
  //check bounds and make pacman bounce off top/bottom 
  //and wrap right to left
  
}

/*
* DrawPacman - draws a packman a the given x, y
*/
void drawPacman() {
    fill(255, 255, 0); //set pacman's color to electric yellow
  background(0); //hides the lines pacman would normally create every 4 pixels using a black background
  arc(pacmanX, pacmanY, PACMAN_SIZE, PACMAN_SIZE, radians(20), radians(330)); // creates an arc (pacman) that starts at a radian of 20, stops at a radian of 330, has points that are the variable pacmanX and pacman Y, and lastly sets the size equal to the variable PACMAN_SETUP 
}

/*
* makePacmanBounce - redirects pacman to opposite direction 
* when hitting top/bottom
*/
void makePacmanBounce() {
    if (mousePressed){ //if the mouse is pressed the code below will function
  pacmanX = xDelta + pacmanX; // pacman will change direction horizontally by xDelta every frame
  pacmanY = pacmanY + yDelta; // pacman will change direction Vertically by yDelta every frame
  }
  
  if((pacmanY > 510)||(pacmanY < 40)){ //if pacmanY is greater than 510 (the floor) or pacmanY is less than 40(the roof)  (these numbers were chosen as they create an affect as though pacman bounces off the roof and floor of the view box)
    yDelta = -1 * yDelta; //then yDelta will be multiplied by negative 1 (creating an affect as though the pacman is moving in the opposite direction)
  } 
}

/*
* makePacmanWrap - puts pacman on left when it reaches right
*/
void makePacmanWrap() {
    if (pacmanX > 1200){ //if pacmanX is greater than 1200px (the width of the box)
    pacmanX = .00096 * pacmanX; //then the pacmanX is multiplied by .00096 reseting the point at something similar to 80(.00096 x 1200) (this creates an illusion of the pacman starting at the same position as the opposite side and repeating the cycle)
  }
}
