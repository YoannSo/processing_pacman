
Game game;
Hero hero=new Hero();
void settings () {
  size(920, 960, P2D);
}

void setup() { 
  frameRate(60);
  game = new Game();
  game._board=b;
  game._hero=hero;
  
}

void draw() { 
  game.update();
  game.drawIt();
  
}

void keyPressed() {
  
  game.handleKey(key);
}

void mousePressed() {
}
