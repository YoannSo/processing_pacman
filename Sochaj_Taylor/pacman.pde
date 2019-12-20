Game game;
Hero hero=new Hero(); //on creer toutes les classe en variable global
Timer t = new Timer();
Timer t2 = new Timer();
Pinky pinky=new Pinky();
Blinky blinky=new Blinky();
Inky inky=new Inky();
Clyde clyde=new Clyde();
void settings() {
  size(920, 960, P2D);
}

void setup() { 
  frameRate(60);
  //LOAD IN ALL THE IMAGES IN SETUP TO REDUCE MEMORY USAGE IN DRAW FUNCTION
  //PAC
  fullPac = loadImage("fullPac.png");
  leftPac1 = loadImage("leftPac1.png");
  leftPac2 = loadImage("leftPac2.png");
  rightPac1 = loadImage("rightPac1.png");
  rightPac2 = loadImage("rightPac2.png");
  upPac1 = loadImage("upPac1.png");
  upPac2 = loadImage("upPac2.png");
  downPac1 = loadImage("downPac1.png");
  downPac2 = loadImage("downPac2.png");

  //GHOST Blinky = RED, Pinky = PINK, Inky = BLUE, Clyde =ORANGE
  leftRGhost= loadImage("leftRedGhost.png");
  leftBGhost= loadImage("leftBlueGhost.png");
  leftOGhost = loadImage("leftOrangeGhost.png");
  leftPGhost= loadImage("leftPinkGhost.png");
  rightRGhost = loadImage("rightRedGhost.png");
  rightBGhost = loadImage("rightBlueGhost.png");
  rightOGhost= loadImage("rightOrangeGhost.png");
  rightPGhost = loadImage("rightPinkGhost.png");
  downRGhost= loadImage("downRedGhost.png");
  downBGhost= loadImage("downBlueGhost.png");
  downOGhost= loadImage("downOrangeGhost.png");
  downPGhost = loadImage("downPinkGhost.png");
  upRGhost= loadImage("upRedGhost.png");
  upBGhost = loadImage("upBlueGhost.png");
  upOGhost = loadImage("upOrangeGhost.png");
  upPGhost= loadImage("upPinkGhost.png");
  deadGhost1 = loadImage("deadGhost1.png");
  deadGhost2= loadImage("deadGhost2.png");

  //OTHER
  wall = loadImage("wall texture.png");
  dot = loadImage("dot.png");
  superDot = loadImage("superdot.png");
  burger = loadImage("burger.png");
  apple = loadImage("apple.png");
  banana = loadImage("banana.png");
  stage0 = loadImage("stage 0v3.png");  
  stage1 = loadImage("stage 1v6.png"); 
  highscore = loadImage("highscore v2.png"); 
  stage99 = loadImage("stage 99.png"); 
  border = loadImage("bot border2.png");
  scoreFont = loadFont("coders_crux.vlw");
  rightPac1 = loadImage("rightPac1.png");
  feuille = loadImage("sprites.png");
  deadscreen = loadImage("deadscreen.png");
  pausescreen = loadImage("pausescreen.png");
  loadlevel = loadImage("loadlevel.png");
  



  game = new Game();
  game._board=b;
  game._hero=hero;
  game._board.loadLevel();
  game._pinky=pinky;
  game._blinky=blinky;
  game._inky=inky;
  game._clyde=clyde; //on ajoute a gmae toutes les classe
}

void draw() { 
  gameStage(); //Defined in menu
}

void keyPressed() {  //gere le menu
  if (stage<1)
    stage+=1;  
  if (key==ESC) {
    key=0;
    if (stage==5) {
      stage=4;
      t.pause();
    } else stage=1;
  }
  game.handleKey(key);
  if (key=='n')lives=0;
}
