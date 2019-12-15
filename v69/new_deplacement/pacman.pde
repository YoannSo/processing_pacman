Game game;
Hero hero=new Hero();
//Ghost ghostRed = new Ghost();


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
  if (stage==0) { //SCREEN 0: press key to start
    menuAnimation0();
  }
  if (stage==1) { //SCREEN 1: new game, load game, highscores...    
    menuAnimation1();
    menuMove();
   
  }
  if (stage==2) { 
    game.update();
    game.drawIt();
    textSize(32);
    text(score,width/2, height-50);
  }
}

void keyPressed() {  
  if (stage<1)
    stage+=1;  
  if (key==ESC) {
    key=0;
    stage-=1;
  }
  game.handleKey(key);
}

void mousePressed() {
  //stage-=1;
}
