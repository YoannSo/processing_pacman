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
  //println(hero._position.x);
  //println(hero._position.y);
  //println(b._cells[1][20]);
  //if(mousePressed)println("              ");
  
  
}

void keyPressed() {
  
  game.handleKey(key);
}

void mousePressed() {
}
