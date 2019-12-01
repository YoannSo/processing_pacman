
Game game;
Hero hero=new Hero();
void settings ()
{
  size(920, 960, P2D);
}
void setup() 
{
  game = new Game();
  b.drawIt();
  
}

void draw() {  
  //game.update();
  //game.drawIt();  
  if (hero._moving) b.drawIt();
  hero.drawIt();
  
}

void keyPressed() {
  hero.move(b);
  game.handleKey(key);
}

void mousePressed() {
}
