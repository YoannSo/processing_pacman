 //<>//
class Hero {
  // position on screen
  PVector _position;
  PVector _posOffset;
  // position on board
  int _cellX, _cellY;
  // display size
  float _size;
  // move data
  PVector _direction;
  boolean _moving; // is moving ? 

  Hero() {  
    _position=b.getCellCenter(16, 11);
    _direction=new PVector();
  }

  void launchMove(PVector dir) {
  }

  void isMoving() {
    if (_direction.x==0 && _direction.y==0) _moving = false;
    else _moving = true;
  }

  void move(Board board) {
    switch(key) {
    case 'w':    
      _position.y-=b._cellSize;
      _direction.y=-1;
      _direction.x=0;
      break;
    case 'a':
      if (_position.x<60 && _position.y==11*40+20) { //11*40 pour avoir le milieu de la fenetre selon y //on rajoute 20 car on a un espace en haut et en bas de 20
        _position.x=width+20;
      } 
      _position.x-=b._cellSize;
      _direction.y=0;
      _direction.x=-1;
      break;
    case 's':
      _position.y+=b._cellSize;
      _direction.y=1;
      _direction.x=0;
      break;
    case 'd':
      if (_position.x>width && _position.y==11*40+20) {
        _position.x=-20;
      } 
      _position.x+=b._cellSize;
      _direction.y=0;
      _direction.x=1;
      break;
    }
    isMoving();
  }

  void update(Board board) {
    board.drawIt();
  }

  void drawIt() {
    final PImage feuille = loadImage("sprites.png");
    imageMode(CENTER);
    rectMode(CENTER);
    fill(yellow);
    rect(_position.x, _position.y, 40, 40);
    //if (_direction.y==0&&_direction.x==-1) {
    //  copy(feuille, 50*17, 50*7, 50, 50, int(_position.x-b._cellSize*0.5), int(_position.y-b._cellSize*0.5), 40, 40);
  }
}
