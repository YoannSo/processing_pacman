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
  //void name(Hero h){
  //h._cellX = int(_position.x/b._cellSize);
  //h._cellY = int(_position.y/b._cellSize);
  //}
  void launchMove(PVector dir) {

    switch(key) {
    case 'w': 
      if (b._cells[int(_position.x/b._cellSize)][int((_position.y/b._cellSize)-1)]==TypeCell.WALL) {//size = cellSize
       
    } else {
        _position.y-=defSpeed; 
        _direction.y=-1;
        _direction.x=0;
        break;
      }
    case 'a': 
    if (b._cells[int(_position.x/b._cellSize)-1][int(_position.y/b._cellSize)]==TypeCell.WALL) {//size = cellSize
       
    } else {
      _position.x-=defSpeed;
      _direction.y=0;
      _direction.x=-1;
      break;}
    case 's': 
    if (b._cells[int(_position.x/b._cellSize)][int((_position.y/b._cellSize)+1)]==TypeCell.WALL) {//size = cellSize
       
    } else {
      _position.y+=defSpeed;
      _direction.y=-1;
      _direction.x=0;
      break;}
    case 'd': 
    if (b._cells[int(_position.x/b._cellSize)+1][int(_position.y/b._cellSize)]==TypeCell.WALL) {//size = cellSize
       
    } else {
      _position.x+=defSpeed;
      _direction.y=0;
      _direction.x=1;
      break;}
    }
  }


    void isMoving() {
      if (_direction.x==0 && _direction.y==0) _moving = false;
      else _moving = true;
    }

    void move(Board b) {

      switch(key) {
      case 'w': 
        //if (b._cells[int(_position.x/size)][int((_position.y/size)-1)]==TypeCell.WALL) { //size = cellSize
        //  println("cant go up because wall");
        //} else {
        _position.y-=defSpeed;
        _direction.y=-1;
        _direction.x=0;

        break;
      case 'a':
        //if (b._cells[int((_position.x/size)-1)][int(_position.y/size)]==TypeCell.WALL) {
        //  println("cant go left bc wall");
        //} else {
        _position.x-=defSpeed;
        if (_position.x<20 && _position.y==11*40+20) { //11*40 pour avoir le milieu de la fenetre selon y //on rajoute 20 car on a un espace en haut et en bas de 20
          _position.x=width+20;
        } 
        _direction.y=0;
        _direction.x=-1;

        break;
      case 's':
        //if (b._cells[int(_position.x/size)][int((_position.y/size)+1)]==TypeCell.WALL) { //size = cellSize
        //  println("cant go down bc wall");
        //} else {
        _position.y+=defSpeed;
        _direction.y=1;
        _direction.x=0;

        break;
      case 'd':
        //if (b._cells[int((_position.x/size)+1)][int(_position.y/size)]==TypeCell.WALL) { //size = cellSize
        //  println("cant go right bc wall");
        //} else {
        if (_position.x>width && _position.y==11*40+20) {
          _position.x=-20;
        } 
        _position.x+=defSpeed;
        _direction.y=0;
        _direction.x=1;

        break;
      }
      //isMoving();
    }
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
      final PImage feuille = loadImage("sprites.png");
      imageMode(CENTER);
      //rectMode(CENTER);
      fill(yellow);

      rect(_position.x, _position.y, b._cellSize, b._cellSize);
      //  if (_direction.x==-1&&_direction.y==0) { //MOVING LEFT
      //    copy(feuille, 50*17, 50*8, 50, 50, int(_position.x-b._cellSize*0.5), int(_position.y-b._cellSize*0.5), 40, 40);
      //  } else if (_direction.x==1&&_direction.y==0) { //MOVING RIGHT
      //    copy(feuille, 50*17, 50*2, 50, 50, int(_position.x-b._cellSize*0.5), int(_position.y-b._cellSize*0.5), 40, 40);
      //  } else if (_direction.x==0&&_direction.y==1) {//MOVING DOWN
      //    copy(feuille, 50*17, 50*5, 50, 50, int(_position.x-b._cellSize*0.5), int(_position.y-b._cellSize*0.5), 40, 40);
      //  } else if (_direction.x==0&&_direction.y==-1) {//MOVING UP
      //    copy(feuille, 50*17, 50*11, 50, 50, int(_position.x-b._cellSize*0.5), int(_position.y-b._cellSize*0.5), 40, 40);
      //  }
      //}
    }
  }
