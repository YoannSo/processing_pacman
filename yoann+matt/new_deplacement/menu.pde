int currentFrame;

class Menu {
  Menu() {
  }

  void drawIt() {
  }
}



void menuAnimation0() {
  PImage feuille = loadImage("sprites.png");
  PImage stage0 = loadImage("stage 0v2.png");
  if (millis() > previousTime + deltaTime) {
    currentFrame++;
    if (currentFrame>2) {
      currentFrame=0;
    }
    previousTime = millis();
  }
  //background(0);
  image(stage0, 0, 0);
  if (currentFrame==0)
    copy(feuille, 50*17, 50*7, 50, 50, 680, 450, 80, 80);
  if (currentFrame==1)
    copy(feuille, 50*17, 50*8, 50, 50, 680, 450, 80, 80);
  if (currentFrame==2)
    copy(feuille, 50*17, 50*9, 50, 50, 680, 450, 80, 80);
}


void menuAnimation1() {
  imageMode(NORMAL);
  PImage feuille = loadImage("sprites.png");
  PImage stage1 = loadImage("stage 1v4.png");
  if (millis() > previousTime + deltaTime) {
    currentFrame++;
    if (currentFrame>2) {
      currentFrame=0;
    }
    previousTime = millis();
  }
  //background(0);
  image(stage1, 0, 0);
  if (currentFrame==0)
    copy(feuille, 50*17, 50*7, 50, 50, 680, 450, 80, 80);
  if (currentFrame==1)
    copy(feuille, 50*17, 50*8, 50, 50, 680, 450, 80, 80);
  if (currentFrame==2)
    copy(feuille, 50*17, 50*9, 50, 50, 680, 450, 80, 80);
}


void menuMove() {
  PImage highscore = loadImage("highscore v1.png");
  if (mouseX>278 && mouseX<674 && mouseY>570 && mouseY<630) { //NEW GAME, top rectangle
    if (mousePressed)
      stage=2;
  } 
  if (mouseX>267 && mouseX<690 && mouseY>680 && mouseY<741) { //LOAD GAME, 2nd rectangle from top
    if (mousePressed)
      println("LOAD GAME");
  }
  if (mouseX>265 && mouseX<700 && mouseY>794 && mouseY<854) { //HIGHSCORES, bottom rectangle
    if (mousePressed) {    
      image(highscore, 0, 0);
    }
  }
}
