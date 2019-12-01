Game game;
Hero hero=new Hero();
void settings ()
{
  size(1900, 1000 ,P2D);}
void setup() 
{background(0);
  game = new Game();
b.drawIt();

}

void draw() {
  game.update();
  game.drawIt();
  hero.drawIt();
}

void keyPressed() {
  game.handleKey(key);
hero.move(b);
}

void mousePressed() {
}
