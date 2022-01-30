
float timer = 24;
int historygrade, englishgrade;
float ballposition=PI;
int villainx, villainy, villaindeltax, villaindeltay;
int spaceshipX=100, spaceshipY=100;
boolean movingUp, movingDown;
ArrayList<enemy> enemies = new ArrayList<enemy>();
ArrayList<treasure> treasures = new ArrayList<treasure>();
int goodgrade=50;
int day = 0;
int PhysicsGrade = 0;

int excercise=0;
int MathGrade = 0;
final int AUGUST = 1;
final int SEPTEMBER = 2;
final int OCTOBER = 3;
final int NOVEMBER = 4;
final int DECEMBER = 5;
int EndOfSemester = 6;
int Month = 1;
int MonthDay = 1;
int happiness = 50;
int grades = 0;
int sadness = 0;
int energy = 50;
int loneliness = 0;
int tiredness = 0;
int money = 1000;
int hunger = 0;
int friendship = 0;
int stress= (tiredness+hunger)/2;
boolean onmap=true;
boolean isminigame=false;
int place = 1;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
String texttodraw = " ";
int firstnum = (int)random(10);
int secondnum = (int)random(10);
int operator = (int)random(3);
int wrongone=0, wrongtwo=0;
int savedtime;
int answer;
int position;
int score =0;
int game=-1;
int totalquestions;
int returnedscore;
ArrayList<ball> balls = new ArrayList<ball>();
int jugglex=800;
boolean movingLeft=false, movingRight=false;
void setup() {
  background(0);
  size(1600, 900);
  img1 = loadImage("Bedroom.png");
  img2 = loadImage("Store.png");
  img3 = loadImage("Erickson Field.png");
  img4 = loadImage("Dining Hall.png");
}

void draw() {
  background(0);
  size(1600, 900);
  fill(40, 40, 40);
  rect(0, 0, 448, 900);
  strokeWeight(3);
  stroke(60, 60, 60);
  fill(40, 40, 40);
  rect(448, 648, 1152, 252);
  fill(0);
  rect(448, 0, 1152, 648);


  strokeWeight(3);
  stroke(60, 60, 60);
  line(0, 450, 445, 450);


  noStroke();
  calendarDate();
 // dayoftheweek();
  drawtext();
  displaystats();
  noStroke();
  if (onmap==true) {
    if (place == 1) {
      // background(0);
      image(img1, 448, 0);
      fill(0, 0, 255, 50);
      rect(100+350, 800-252, 100, 100);
      rect(725, 325, 100, 100);
      rect(1255, 445, 100, 100);
      rect(1020, 445, 100, 100);
      rect(1500, 800-252, 100, 100);
    } else if (place == 2) {
      //background(0);
      image(img2, 448, 0);
      fill(0, 0, 255, 50);
      rect(475, 300, 100, 100);
      rect(100+350, 800-252, 100, 100);
    } else if (place == 3) {
      //  background(0);
      image(img3, 448, 0);
      fill(0, 0, 255, 50);
      rect(1000, 500, 100, 100);
      rect(1400, 500, 100, 100);
      rect(660, 250, 100, 100);
      rect(950, 275, 100, 100);
    } else if (place == 4) {
      //  background(0);
      image(img4, 448, 0);
      fill(0, 0, 255, 50);
      rect(450, 550, 100, 100);
      rect(450, 0, 100, 100);
      rect(1350, 200, 100, 100);
    }
  }
  if (isminigame==true) {
    if ( game==1) {
      fill(255);
      for ( int i=0; i < balls.size(); i++) {
        fill(255);
        ellipse(balls.get(i).landingpoint, balls.get(i).currentposition, 25, 25);
        if (balls.get(i).currentposition>610 && (balls.get(i).landingpoint>jugglex+50 || balls.get(i).landingpoint<jugglex-50)) {
          endgame();
          PhysicsGrade+=returnedscore;
        }
        balls.get(i).move();
        if (balls.get(i).addscore==true) {
          score+=1; 
          if (score%10==0) {
            balls.add(new ball(random(448+25, 1575), 5, 250+(int)random(-200, 25)));
          }
          balls.get(i).addscore=false;
        }
      }
      text(score, 1500, 50);
      rect(jugglex, 625, 50, 10);
      if ( movingLeft==true) jugglex-=10;
      if ( movingRight==true) jugglex+=10;
      if (jugglex<448) jugglex=448;
      if (jugglex>1550) jugglex= 1550;
    }
    if (game==0) {
      fill(255);
      switch(operator) {
      case 0:
        text(firstnum + "+" + secondnum + " =", 800, 250);
        break;
      case 1:
        text(firstnum + "-" + secondnum + " =", 800, 250);
        break;
      case 2:
        text(firstnum + "*" + secondnum + " =", 800, 250);
        break;
      } 
      fill(255);
      switch(position) {
        case(0):
        text(answer, 750, 300); 
        text(wrongone, 800, 300); 
        text(wrongtwo, 850, 300); 
        break;
        case(1):
        text(wrongone, 750, 300); 
        text(answer, 800, 300); 
        text(wrongtwo, 850, 300); 
        break;  
        case(2):
        text(wrongone, 750, 300); 
        text(wrongtwo, 800, 300); 
        text(answer, 850, 300); 
        break;
      }
      float percentageleft= ((float)millis()-(float)savedtime)/5000;
      arc(448+25, 25, 25, 25, 0, 2*PI*percentageleft);
      text(score, 1550, 25);
      if (savedtime<millis()-5000) {
        newquestion();
      }
    }
    if ( game==2) {
      fill(255);
      text(score, 1500, 50);
      ellipse(spaceshipX+448, spaceshipY, 50, 50);
      fill(255, 0, 0);
      for (int i = 0; i < enemies.size(); i++) {
        ellipse(enemies.get(i).x+448, enemies.get(i).y, 50, 50);
        if (enemies.get(i).x<spaceshipX) {
          enemies.get(i).x+=1;
        } else  enemies.get(i).x-=1;
        if (enemies.get(i).y<spaceshipY) {
          enemies.get(i).y+=1;
        } else  enemies.get(i).y-=1;
        float distance = sqrt((spaceshipX-enemies.get(i).x)*(spaceshipX-enemies.get(i).x)+ (spaceshipY-enemies.get(i).y)*(spaceshipY-enemies.get(i).y));
        if (distance<50) {
          endgame(); 
          historygrade+=returnedscore;
        }
      }
      fill(255, 255, 0);
      for (int i = 0; i < treasures.size(); i++) {

        float distance = sqrt((spaceshipX-treasures.get(i).x)*(spaceshipX-treasures.get(i).x)+ (spaceshipY-treasures.get(i).y)*(spaceshipY-treasures.get(i).y));
        if (distance<50) {
          treasures.get(i).captured=true;
        }
        if (treasures.get(i).captured==false)
          ellipse(treasures.get(i).x+448, treasures.get(i).y, 50, 50);
      }
      if (movingLeft) {
        spaceshipX-=2;
      }
      if (movingRight) {
        spaceshipX+=2;
      }
      if (movingUp) {
        spaceshipY-=2;
      }
      if (movingDown) {
        spaceshipY+=2;
      }
      if (spaceshipX<25) spaceshipX=25;
      if (spaceshipX>1152-25) spaceshipX=1152-25;
      if (spaceshipY<25) spaceshipY=25;
      if (spaceshipY>648-25) spaceshipY=648-25;
      checkround();
    } 
    if (game==3) {
      float realx=sin(ballposition)*175+1152/2;
      float realy =cos(ballposition)*175+648/2;

      fill(255);
      text(score, 1500, 50);
      ellipse(1152/2+448, 648/2, 250, 250);
      fill(255, 255, 0);
      ellipse(realx+448, realy, 100, 100);
      fill(255, 0, 0);
      ellipse(villainx+448, villainy, 50, 50);
      if (movingLeft) {
        ballposition+=.02;
      }
      if (movingRight) {
        ballposition-=.02;
      }
      float distance = sqrt((realx-villainx)*(realx-villainx)+ (realy-villainy)*(realy-villainy));
      if (distance<75) {
        generateenemy();
      }
      float losedistance = sqrt(((576-villainx)*(576-villainx))+ ((324-villainy)*(324-villainy)));
      if (losedistance<150) {
        endgame(); 
        englishgrade+=returnedscore;
      }
      movevillain();
    }
  }
}



void keyPressed() {
  if (key==('q')){
    ending();
  }
  if  (isminigame==true) {
    if (game==-1) {
      texttodraw="";
      if (key=='m') {
        mathsetup();
        game=0;
      }
      if ( key=='p') {
        physsetup();
        game=1;
      }
      if (key=='h') {
        historysetup();
        game=2;
      }
      if (key=='e') {
        englishsetup();
        game=3;
      }
    }
    if (game ==1 || game == 2 || game==3) {
      if (keyCode==LEFT) movingLeft=true;
      if (keyCode==RIGHT) movingRight=true;
      if (keyCode==UP) movingUp=true;
      if (keyCode==DOWN) movingDown=true;
    }
  }
}

void keyReleased() {
  if ( game ==1|| game==2 || game==3) {
    if (keyCode==LEFT) movingLeft=false;
    if (keyCode==RIGHT) movingRight=false;
    if (keyCode==UP) movingUp=false;
    if (keyCode==DOWN) movingDown=false;
  }
}


void mousePressed() {
  if (isminigame==true && game==0) {
    if (mouseY>230&&mouseY<320) {
      if (mouseX>750 && mouseX<800 && position==0)score+=1;
      if (mouseX>800 && mouseX<850 && position==1)score+=1;
      if (mouseX>850 && mouseX<900 && position==2)score+=1;
      println(mouseX);
      newquestion();
    }
  }
  println(place);
  if (onmap== true&& mouseX>448) {
    if (place == 1) {
      if ( (mouseX > 450 && mouseX < 550) && (mouseY > 550 && mouseY <650)) {

        place = 3;
      }
      if ( (mouseX > 1450 && mouseX < 1550) && (mouseY >550 && mouseY <650)) {
        place = 4;
      }
      if ( (mouseX > 725 && mouseX < 825) && (mouseY >325 && mouseY <425)) {
        if (hunger>25) {
          texttodraw="you are too hungry to study";
        } else if (tiredness>16) {
          texttodraw="you are too tired to study";
        } else
          startminigame();
      }
      if ((mouseX>1255 && mouseX<1355) && mouseY>450 && mouseY<550) {
        tiredness-=5;
        if ( tiredness<0) tiredness=0;
        texttodraw="slept for one hour";
        addtime(1);
      }
      if ((mouseX>1020 && mouseX<1120) && mouseY>450 && mouseY<550) {

        stress-=5;
        if (stress<0) stress = 0;
        texttodraw="relaxed for one hour";
        addtime(1);
      }
    } else if (place == 2) {
      //background(0);
      if ( (mouseX > 450 && mouseX < 550) && (mouseY >550 && mouseY <650)) {
        place = 3;
      }
      if ( (mouseX > 475 && mouseX < 575) && (mouseY >300 && mouseY <400)) {
        friendship+=5;
        if (friendship<0) friendship=0;
        texttodraw="participated in club activity for 1 hour";
        addtime(1);
      }
    } else if (place == 3) {

      if ((mouseX > 1000 && mouseX < 1100) && (mouseY > 500 && mouseY < 600)) {
        place = 1;
      }
      if ((mouseX > 1400 && mouseX < 1500) && (mouseY < 600 && mouseY > 500)) {
        place = 4;
      }
      if ((mouseX > 660 && mouseX < 760) && (mouseY > 250 && mouseY <350)) {
        place = 2;
      }
      if ((mouseX > 950 && mouseX < 1050) && (mouseY > 275 && mouseY <375)) {
        if (tiredness<10 && hunger<10) {
          tiredness+=4;
          excercise+=3;
          hunger+=2;
          texttodraw="exercised for 1 hour";
          addtime(1);
        } else texttodraw="you cannot exercise if your tiredness or hunger is over 10";
      }
    } else if (place == 4) {
      if ( (mouseX > 450 && mouseX < 550) && (mouseY >550  && mouseY < 650)) {
        place = 3;
      }
      if ((mouseX > 450 && mouseX < 550) && (mouseY > 0 && mouseY < 100)) {
        place = 1;
      }
      if ((mouseX > 1350 && mouseX < 1450) && (mouseY > 200 && mouseY < 300)) {
        if (money>0) {
          hunger-=6;
          if (hunger<0) hunger=0;
          texttodraw="ate for 1/2 hour";
          addtime(.5);
        } else print("dont have enough money for food");
      }
    }
  }
}

//addtime-makes time past after minigames and activities
//adjusts stats and goals based off of time as well
//one input, which tells how much time has passed, no outputs ore side effects
void addtime(float time) {
  hunger+= time;
  tiredness+=time+2;
  timer-=time;
  if (timer<0) {
    MonthDay+=1;
    timer+=24;
    if (MonthDay %7==0) {
      if (historygrade+PhysicsGrade+MathGrade+englishgrade<goodgrade*4) {
        texttodraw="your grades are slipping, be sure to pick them up by the end of the semester";
      }
      goodgrade+=50;
    }
    if (MonthDay==75) {
      ending();
    }
  }
}
//physsetup- sets up physichs game
//adjusts variables to their starting points for the physihcs game
//no inputs, outputs, or side effects.
void physsetup() {
  balls = new ArrayList<ball>();
  jugglex=800;
  score=0;
  balls.add(new ball(800, 5, 250));
}
//mathseup- sets up math game
//adjusts variables to their starting points for the math game
//no inputs, outputs, or side effects.
void mathsetup() {
  background(0);
  score=0;
  totalquestions=10;
  newquestion();
}
//displaystats
//writes the stats on the side of the screen
//no inputs outputs or side effects
void displaystats() {

  fill(255);
  textSize(24);
  text("Month: september", 10, 30);
  text("Day:" + MonthDay, 10, 60);

  text("Hours Left:" + timer, 10, 120);

  strokeWeight(3);
  stroke(60, 60, 60);
  line(0, 130, 445, 130);

  fill(255);
  text("Math Grade: " + MathGrade + " /" + goodgrade, 10, 160);
  text("Physics Grade: " + PhysicsGrade + " /" + goodgrade, 10, 190);
  text("English Grade:" + englishgrade +" /" + goodgrade, 10, 220);
  text("History Grade:" + historygrade+" /" + goodgrade, 10, 250);

  strokeWeight(3);
  stroke(60, 60, 60);
  line(0, 260, 445, 260);
  fill(255);
  text("Tiredness: " + tiredness, 10, 290);
  text("Hunger: " + hunger, 10, 320);
  text("friendship: " + friendship, 10, 350);
  text("Excercise: " + excercise, 10, 380);
  text("Stress: " + stress, 10, 410);
  text("Money: " + money, 10, 440);

}
void ending() {
  if (MathGrade>=goodgrade &&  PhysicsGrade>=goodgrade && historygrade>=goodgrade && englishgrade>=goodgrade) {
    background(0);
    fill(255);
    text(" you passed", width/2-20, height/2);
    noLoop();
  } else {
    background(0);
    fill(255);
    text(" you did not pass", width/2-20, height/2);
    noLoop();
  }
}
//endgame-ends the  minigame
// resets variables back to normal and saves the score
// no inputs,outputs, or side effects
void endgame() {
  returnedscore=score*((int)(excercise/4+1));
  excercise-=3;
  if (excercise<0) excercise=0;
  score=0;
  game=-1;
  addtime(2/(friendship+1)+1);
  friendship-=1;
  if (friendship<0) friendship=0;
  // stress+=5;
  isminigame=false;
  movingUp=false;
  movingDown=false;
  movingLeft=false;
  movingRight=false;
  onmap=true;
}



void calendarDate() {
  fill(255);
  if ((MonthDay == 32)&&(Month == AUGUST)) {
    Month = SEPTEMBER;
    MonthDay = 0;
  } else if ((MonthDay == 30)&&(Month == SEPTEMBER)) {
    Month = OCTOBER;
    MonthDay = 0;
  } else if ((MonthDay == 32)&&(Month == OCTOBER)) {
    Month = NOVEMBER;
    MonthDay = 0;
  } else if ((MonthDay == 30)&&(Month == OCTOBER)) {
    Month = DECEMBER;
    MonthDay = 0;
  }
}
// startminigame-goes to the minigame set up menu
// sets up variables such that a minigame can be chosen
//no inputs, outputs, or side effects.
void startminigame() {
  texttodraw="press p for physichs and m for math, h for history, e for english"; 
  onmap=false;
  isminigame=true;
  game=-1;
}
// drawtext-draws text to the text box
//no inputs, outputs, or side effects.
void drawtext() {
  fill(0, 0, 204);
  rect(448, 648, 1152, 252);
  fill(0);
  textSize(32);
  text(texttodraw, 500, 700);
}
// newquestion-a unction for the math minigame
//generates a new question
//no inputs,outputs, or side effects
void newquestion() {
  totalquestions-=1;
  if (totalquestions==0) {
    endgame();
    MathGrade+=returnedscore;
    return;
  }
  savedtime = millis();
  //text(score,400,100);
  //background(0);
  firstnum = (int)random(10);
  secondnum = (int)random(10);
  operator = (int)random(3);
  position = (int)random(3);
  switch(operator) {
  case 0:
    answer = firstnum+secondnum;
    break;
  case 1:
    answer = firstnum-secondnum;
    break;
  case 2:
    answer = firstnum*secondnum;
    break;
  }

  wrongone = answer+(int)random(5, 1);//*(1-(((int)(random(0,2)))*2));

  wrongtwo = answer-(int)random(5, 1);//*(1-((int)(random(2))*2));
  // if( wrongtwo == wrongone) wrongtwo+=(int)random(5,1);
}
//checkround, a question for the history minigame
//checks to see if the round has ended
//no inputs,outputs, or side effects
void checkround() {
  boolean endround=true;
  for (int i = 0; i < treasures.size(); i++) {
    if (!treasures.get(i).captured) {
      endround=false;
    }
  }
  if (endround==true) {
    newround();
  }
}
//newround a question for the history minigame
//generates new positions for the enemyies and treasures
//no inputs,outputs, or side effects
void newround() {
  for (int i = 0; i < enemies.size(); i++) {
    enemies.set(i, new enemy());
  }
  enemies.add(new enemy());
  for (int i = 0; i < treasures.size(); i++) {
    treasures.set(i, new treasure());
  }
  treasures.add(new treasure());
  score+=1;
}
//historysetup-sets up the history minigame
//sets variables to the place they need to be
//no inputs,outputs, or side effects
void historysetup() {
  enemies = new ArrayList<enemy>();
  treasures = new ArrayList<treasure>();
  spaceshipX=100;
  spaceshipY=100;
  newround();
}
//generateenemy-a function for the english minigame
//sets up a new ball
//no inputs,outputs, or side effects
void generateenemy() {
  score+=1;
  villainx=(int)random(0, 350);
  villaindeltax=(int)random(-7, -3);
  if (random(1)>.5) {
    villainx+=648;
    villaindeltax=-villaindeltax;
  }
  villainy=(int)random(648);
  villaindeltay=(int)random(-7, 3);
  if (villaindeltay==0) {
    villaindeltay=(int)(random(-7, 0));
  }
}
//movevillain-a function for the english minigame
//moves the ball around and 
//no inputs,outputs, or side effects
void movevillain() {
  villainx+=villaindeltax;
  villainy+=villaindeltay;
  if (villainx<25) {
    villainx=25;
    villaindeltax=-villaindeltax;
  }
  if (villainx>1152-25) {
    villainx=1152-25;
    villaindeltax=-villaindeltax;
  }
  if (villainy<25) {
    villainy=25;
    villaindeltay=-villaindeltay;
  }
  if (villainy>648-25) {
    villainy=648-25;
    villaindeltay=-villaindeltay;
  }
}
//englishsetup-sets up the english minigame
//sets variables to the place they need to be
//no inputs,outputs, or side effects
void englishsetup() {
  ballposition=PI;
  generateenemy();
}
