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
  PVector _nextDir;
  PVector _PreviousDir;
  boolean _moving; // is moving ? 

  Hero() {  
    _cellX=12;
    _cellY=16;
    _position=b.getCellCenter(_cellX-1, _cellY);
    _direction=new PVector(0, 0);
       _nextDir=new PVector();
   _PreviousDir=new PVector();
  }
  int getCell(float pos)
  {
    return int(pos/40);
  }

  void launchMove(PVector dir) {
    // if(b.getCellCenter(_cellX,_cellY).x==_position.x&&b.getCellCenter(_cellX,_cellY).y==_position.y){ if (b._cells[int((_position.x/size)-1)][int(_position.y/size)]==TypeCell.WALL) 
    //    println("cant go left bc wall");
    //  }
    //move(b); println(estAuCentre());
    // if(_moving==true) {_cellX+=_direction.x;
    //_cellY+=_direction.y;}

    _nextDir=dir;
    if (b._cells[_cellX+int(dir.x)][_cellY]!=TypeCell.WALL)
      _moving=true;

    if (_moving==true) {   
      if (_position.x%20==0&&_position.x%40!=0&&_position.y%20==0&&_position.y%40!=0) {
        _cellX=getCell(_position.x);
        _cellY=getCell(_position.y);
      }
      println(_PreviousDir);
      println(_nextDir);
        if(changementDirection())
          {_position.x=_cellX*40+centre;
           _position.y=_cellY*40+centre;
       _PreviousDir=_nextDir;
        
        
      }
      else {  _direction.x=dir.x;
      _direction.y=dir.y;
      _PreviousDir=_direction;
      move(b);}
   
   
   }
  }

  boolean changementDirection()
  {
    if (_nextDir.x!=_PreviousDir.x&&_nextDir.y!=_PreviousDir.y)return true;
    return false;
  }


  void isMoving() {
    if (_direction.x==0 && _direction.y==0) _moving = false;
    else _moving = true;
  }

  void move(Board b) {

    if (b._cells[_cellX+int(_direction.x)][_cellY+int(_direction.y)]!=TypeCell.WALL) {
      _position.x+=_direction.x*defSpeed;
      _position.y+=_direction.y*defSpeed;
    } else
    {
      _moving=false;
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
    final PImage feuille = loadImage("sprites.png");
    imageMode(CENTER);
    rectMode(CENTER);
    fill(yellow);
    //ellipse(_position.x, _position.y, 30, 30);
    //fill(red);
    //ellipse(_position.x, _position.y, 5, 5);
    //rect(_cellX*40+centre, _cellY*40+centre, 20, 20); 

    if (_direction.x==-1&&_direction.y==0) { //MOVING LEFT
      copy(feuille, 50*17, 50*8, 50, 50, int(_position.x)-centre,int(_position.y)-centre, 40, 40);
    } else if (_direction.x==1&&_direction.y==0) { //MOVING RIGHT
      copy(feuille, 50*17, 50*2, 50, 50, int(_position.x)-centre, int(_position.y)-centre, 40, 40);
    } else if (_direction.x==0&&_direction.y==1) {//MOVING DOWN
      copy(feuille, 50*17, 50*5, 50, 50, int(_position.x)-centre,int(_position.y)-centre, 40, 40);
    } else if (_direction.x==0&&_direction.y==-1) {//MOVING UP
      copy(feuille, 50*17, 50*11, 50, 50, int(_position.x)-centre, int(_position.y)-centre, 40, 40);
    }
  }
  boolean estAuCentre() {
    if (dist(_cellX, _cellY, int(_position.x/40), int(_position.y/40))<0.5)
      return true;

    else return false;
  }
}
