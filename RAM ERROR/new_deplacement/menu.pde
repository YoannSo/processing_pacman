int currentFrame;

//class Menu {
//  Menu() {
//  }

//  void drawIt() {
//  }
//}

void gameStage() {
  if (stage==0) { //SCREEN 0: press key to start
    menuAnimation0();
    exitButton();
  }
  if (stage==1) { //SCREEN 1: new game, load game, highscores...    
    menuAnimation1();
    menuMove1();
    exitButton();
  }
  if (stage==2) { //SCREEN 2: HIGHSCORES
    menuAnimation2();
  }
  if (stage==5) { //STAGE 5: GAMEPLAY
    game.update();
    game.drawIt();
    stage5Animation();
  }
  if (stage==99) { //STAGE 99: ARE YOU SURE YOU WANT TO QUIT?
    menuAnimation99();
    menuMove99();
  }
}

//MENU ANIMATIONS FUNCTIONS
void menuAnimation0() {  
  imageMode(NORMAL);
  PImage stage0 = loadImage("stage 0v3.png");  
  image(stage0, 0, 0);
  pacAnimationInMenu();
}

void menuAnimation1() {
  imageMode(NORMAL);
  PImage stage1 = loadImage("stage 1v5.png"); 
  image(stage1, 0, 0);
  pacAnimationInMenu();
}

void menuAnimation2() {
  imageMode(NORMAL); 
  PImage highscore = loadImage("highscore v1.png");  
  image(highscore, 0, 0);
  pacAnimationInMenu();
}

void menuAnimation99() {
  imageMode(NORMAL);
  PImage stage99 = loadImage("stage 99.png"); 
  image(stage99, 0, 0);
  pacAnimationInMenu();
}


//MENU MOVE FUNCTIONS <=> IF IM CLICKING ON THIS BUTTON THEN DO THAT...
void menuMove1() {
  if (mouseX>278 && mouseX<674 && mouseY>570 && mouseY<630) { //NEW GAME, top rectangle
    if (mousePressed)
      stage=5;
  } 
  if (mouseX>267 && mouseX<690 && mouseY>680 && mouseY<741) { //LOAD GAME, 2nd rectangle from top
    if (mousePressed)
      println("LOAD GAME");
  }
  if (mouseX>265 && mouseX<700 && mouseY>794 && mouseY<854) { //HIGHSCORES, bottom rectangle
    if (mousePressed) {    
      stage=2;
    }
  }
}

void menuMove99() {
  if (mouseX>191 && mouseX<424 && mouseY>744 && mouseY<837) { //YES BUTTON -> CLOSE GAME DOWN
    if (mousePressed)
      exit();
  }
  if (mouseX>549 && mouseX<733 && mouseY>740 && mouseY<837) { //NO BUTTON -> GO BACK TO MENU
    if (mousePressed)
      stage=1;
  }
}

void exitButton() {
  if (stage!=5 && stage!=99) { 
    if (mouseX>65 && mouseX<176 && mouseY>840 && mouseY<919)
      if (mousePressed)
        stage=99;
  }
}

void stage5Animation() {
  PImage border = loadImage("bot border2.png");
  PFont scoreFont = loadFont("coders_crux.vlw");
  PImage rightPac1 = loadImage("rightPac1.png");
  int seconds = (millis()/1000)%60;
  int minutes = seconds/60;
  textFont(scoreFont);
  textSize(70);
  text(score, width/2+50, height-25);
  text(minutes +":" +seconds, width/2+330, height-25);
  if (lives==2) {
    image(rightPac1, width/2-250, height-size);
    image(rightPac1, width/2-200, height-size);
  }
  if (lives==1) {
    image(rightPac1, width/2-250, height-size);
  }
  image(border, width/2, height-size);
}


void pacAnimationInMenu() { //ANIMATE PACMAN IN THE MENU, looks cool :P
  PImage feuille = loadImage("sprites.png");
  if (millis() > previousTime + deltaTime) {
    currentFrame++;
    if (currentFrame>2) {
      currentFrame=0;
    }
    previousTime = millis();
  }
  if (currentFrame==0)
    copy(feuille, 50*17, 50*7, 50, 50, 680, 450, 80, 80);
  if (currentFrame==1)
    copy(feuille, 50*17, 50*8, 50, 50, 680, 450, 80, 80);
  if (currentFrame==2)
    copy(feuille, 50*17, 50*9, 50, 50, 680, 450, 80, 80);
}
