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
    _cellX=11;
    _cellY=16;
    _position=new PVector(40*_cellX+20, 40*_cellY+20);
    _direction=new PVector();
  }

  void launchMove(PVector dir) {
    _direction.x=dir.x;
    _direction.y=dir.y;

    if (dir.x==0 && dir.y==-1) { //GOING UP
      if (b._cells[int(_position.x/b._cellSize)][int(_position.y/b._cellSize-1)]!=TypeCell.WALL) {
        _direction.y=dir.y; 
        move(b);
      } else 
      //println("UP:ERROR");
      return;
    }  
    if (dir.x==0 && dir.y==1) { //GOING DOWN
      if (b._cells[int(_position.x/b._cellSize)][int(_position.y/b._cellSize+1)]!=TypeCell.WALL) {
        _direction.y=dir.y; 
        move(b);
      } else 
      //println("DOWN:ERROR");
      return;
    }  
    if (dir.x==1 && dir.y==0) { //GOING RIGHT
      if (b._cells[int(_position.x/b._cellSize+1)][int(_position.y/b._cellSize)]!=TypeCell.WALL) {
        _direction.x=dir.x; 
        move(b);
      } else 
      //println("LEFT:ERROR");
      return;
    }  
    if (dir.x==-1 && dir.y==0) { //GOING LEFT
      if (b._cells[int(_position.x/b._cellSize-1)][int(_position.y/b._cellSize)]!=TypeCell.WALL) {
        _direction.x=dir.x; 
        move(b);
      }
    } else 
    //println("RIGHT:ERROR");
    return;
  }



  void isMoving() {
    if (_direction.x==0 && _direction.y==0) _moving = false;
    else _moving = true;
  }

  void move(Board b) {
    if (millis() >previousTime + deltaTime) {
      previousTime = millis();
      _position.x+=_direction.x*defSpeed;      
      _position.y+=_direction.y*defSpeed;
    }
  }












  // int defSpeed =4;i
  //_direction.y=0;
  //   _direction.x=0;
  // switch(key) {
  // case 'w': 
  //   //if (b._cells[int(_position.x/size)][int((_position.y/size)-1)]==TypeCell.WALL) { //size = cellSize
  //   //  println("cant go up because wall");
  //   //} else {
  //   _position.y-=defSpeed;
  //   _direction.y=-1;
  //   _direction.x=0;

  //   break;
  // case 'a':
  //   //if (b._cells[int((_position.x/size)-1)][int(_position.y/size)]==TypeCell.WALL) {
  //   //  println("cant go left bc wall");
  //   //} else {
  //   _position.x-=defSpeed;
  //   if (_position.x<60 && _position.y==11*40+20) { //11*40 pour avoir le milieu de la fenetre selon y //on rajoute 20 car on a un espace en haut et en bas de 20
  //     _position.x=width+20;
  //   } 
  //   _direction.y=0;
  //   _direction.x=-1;

  //   break;
  // case 's':
  //   //if (b._cells[int(_position.x/size)][int((_position.y/size)+1)]==TypeCell.WALL) { //size = cellSize
  //   //  println("cant go down bc wall");
  //   //} else {
  //   _position.y+=defSpeed;
  //   _direction.y=1;
  //   _direction.x=0;

  //   break;
  // case 'd':
  //   //if (b._cells[int((_position.x/size)+1)][int(_position.y/size)]==TypeCell.WALL) { //size = cellSize
  //   //  println("cant go right bc wall");
  //   //} else {
  //   if (_position.x>width && _position.y==11*40+20) {
  //     _position.x=-20;
  //   } 
  //   _position.x+=defSpeed;
  //   _direction.y=0;
  //   _direction.x=1;

  //   break;
  // }


  //void eatDot() {


  //  //int score=0;
  //  //if (b._cells[int(_position.x/size)][int((_position.y/size))]==TypeCell.DOT) {
  //  //  b._cells[int(_position.x/size)][int((_position.y/size))]=TypeCell.EMPTY;
  //    //score+=10;
  //  }



  void update(Board board) {
    board.drawIt();
  }

  void drawIt() {
    PImage feuille = loadImage("sprites.png");
    imageMode(CENTER);
    rectMode(CENTER);
    //fill(yellow);
    //rect(_position.x, _position.y, 40, 40);
    //fill(red);
    //ellipse(_position.x, _position.y, 5, 5);

    if (_direction.x==-1&&_direction.y==0) { //MOVING LEFT
      copy(feuille, 50*17, 50*8, 50, 50, int(_position.x-b._cellSize*0.5), int(_position.y-b._cellSize*0.5), 40, 40);
    } else if (_direction.x==1&&_direction.y==0) { //MOVING RIGHT
      copy(feuille, 50*17, 50*2, 50, 50, int(_position.x-b._cellSize*0.5), int(_position.y-b._cellSize*0.5), 40, 40);
    } else if (_direction.x==0&&_direction.y==1) {//MOVING DOWN
      copy(feuille, 50*17, 50*5, 50, 50, int(_position.x-b._cellSize*0.5), int(_position.y-b._cellSize*0.5), 40, 40);
    } else if (_direction.x==0&&_direction.y==-1) {//MOVING UP
      copy(feuille, 50*17, 50*11, 50, 50, int(_position.x-b._cellSize*0.5), int(_position.y-b._cellSize*0.5), 40, 40);
    }
  }
  boolean estAuCentre() {
    if (dist(b.getCellCenter(_cellX, _cellY).x, b.getCellCenter(_cellX, _cellY).y, _position.x, _position.y)<2)
      return true;

    else return false;
  }
}
