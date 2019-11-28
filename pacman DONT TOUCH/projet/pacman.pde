Game game;

void setup() {
  
  background(0);
  b.drawIt();
  game = new Game();
}

void settings() {
  size(800, 800, P2D);
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
