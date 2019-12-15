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
    _nextDir=dir;
    if (b._cells[_cellX+int(dir.x)][_cellY]!=TypeCell.WALL)
      _moving=true;

    if (_moving==true) {   
      if (_position.x%20==0&&_position.x%40!=0&&_position.y%20==0&&_position.y%40!=0) {
        _cellX=getCell(_position.x);
        _cellY=getCell(_position.y);
      }

      if (changementDirection())
      {
        _position.x=_cellX*40+centre;
        _position.y=_cellY*40+centre;
        _PreviousDir=_nextDir;
      } else {  
        _direction.x=dir.x;
        _direction.y=dir.y;
        _PreviousDir=_direction;
        move(b);
      }
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
    eatDot();
    if (b._cells[_cellX+int(_direction.x)][_cellY+int(_direction.y)]!=TypeCell.WALL) {
      _position.x+=_direction.x*defSpeed;
      _position.y+=_direction.y*defSpeed;
    } else
    {
      _moving=false;
    }
  }


  void update(Board board) {
    board.drawIt();
  }

  void drawIt() {    
    final PImage pacLeft = loadImage("pacman left.png");
    final PImage pacRight = loadImage("pacman right.png");
    final PImage pacUp = loadImage("pacman up.png");
    final PImage pacDown = loadImage("pacman down.png");
    imageMode(CENTER);
    rectMode(CENTER);    
    if (_direction.x==-1&&_direction.y==0) { //MOVING LEFT
      image(pacLeft, _position.x, _position.y, 35, 35);
    } else if (_direction.x==1&&_direction.y==0) { //MOVING RIGHT
      image(pacRight, _position.x, _position.y, 35, 35);
    } else if (_direction.x==0&&_direction.y==1) {//MOVING DOWN
      image(pacDown, _position.x, _position.y, 35, 35);
    } else if (_direction.x==0&&_direction.y==-1) {//MOVING UP
      image(pacUp, _position.x, _position.y, 35, 35);
    }
  }

  //boolean estAuCentre() {
  //  if (dist(_cellX, _cellY, int(_position.x/40), int(_position.y/40))<0.5)
  //    return true;
  //  else return false;
  //}


  void eatDot() {
    if (b._cells[_cellX][_cellY]==TypeCell.DOT) {
      b._cells[_cellX][_cellY]=TypeCell.EMPTY;
      score+=10;
    }
    if (b._cells[_cellX][_cellY]==TypeCell.SUPER_DOT) {
      b._cells[_cellX][_cellY]=TypeCell.EMPTY;
      score+=50;
    }
  }
}
