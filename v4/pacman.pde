
Game game;
Hero hero=new Hero();
void settings () {
  size(920, 960, P2D);
}

void setup() { 
  game = new Game();
  b.drawIt();
}

void draw() { 
  //hero.eatDot();
  //game.update();
  //game.drawIt();  
  if (hero._moving) { 
    b.drawIt();
  }
  b.drawIt();
  hero.drawIt();

  hero.move(b);

  if (keyPressed) {
    if (key == 'p') {   
      b.pause();
    }
  }

  //hero.nextToWall();
}

void keyPressed() {
  
  hero.move(b);
  game.handleKey(key);
}

void mousePressed() {
}
