Game game;
Hero hero=new Hero();

void settings() {
  size(920, 960, P2D);
}

void setup() { 
  frameRate(60);
  game = new Game();
  game._board=b;
  game._hero=hero;
  game._board.loadLevel();
}

void draw() { 
  gameStage(); //Defined in menu 
}

void keyPressed() {  
  if (stage<1)
    stage+=1;  
  if (key==ESC) {
    key=0;
    stage=1;
  }
  game.handleKey(key);
  if(key=='n')lives=1;
}

void mousePressed() {
}
