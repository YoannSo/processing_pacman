class Hero {  
  PVector _position;
  PVector _posOffset; 
  int _cellX, _cellY;  
  float _size;  
  PVector _direction;
  PVector _nextDir;
  PVector _PreviousDir;
  boolean _moving; 

  Hero() {  
    _cellX=12;
    _cellY=16;
    _position=b.getCellCenter(_cellX-1, _cellY);
    _direction=new PVector(0, 0);
    _nextDir=new PVector();
    _PreviousDir=new PVector();
  }

  int getCell(float pos) {
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
      if (changementDirection()) {
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

  boolean changementDirection() {
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
    imageMode(CENTER);
    pacAnimation();
  }

  void eatDot() { //IF PACMAN IS ON A DOT/SUPERDOT HE WILL EAT IT <=> IT WILL TRANSFORM INTO AN EMPTY CELL
    if (b._cells[_cellX][_cellY]==TypeCell.DOT) {
      b._cells[_cellX][_cellY]=TypeCell.EMPTY;
      score+=10;
    }
    if (b._cells[_cellX][_cellY]==TypeCell.SUPER_DOT) {
      b._cells[_cellX][_cellY]=TypeCell.EMPTY;
      score+=50;
    }
  }

  void pacAnimation() { //ANIMATE THE PACMAN WHEN HE IS MOVING
    //LOAD ALL 9 IMAGES FOR ALL DIRECTIONS POSSIBLE
    PImage fullPac = loadImage("fullPac.png");
    PImage leftPac1 = loadImage("leftPac1.png");
    PImage leftPac2 = loadImage("leftPac2.png");
    PImage rightPac1 = loadImage("rightPac1.png");
    PImage rightPac2 = loadImage("rightPac2.png");
    PImage upPac1 = loadImage("upPac1.png");
    PImage upPac2 = loadImage("upPac2.png");
    PImage downPac1 = loadImage("downPac1.png");
    PImage downPac2 = loadImage("downPac2.png");
    //MOVING LEFT
    if (_direction.x==-1&&_direction.y==0) { 
      if (millis() > previousTime + deltaTime) {
        currentFrame++;
        if (currentFrame>2) {
          currentFrame=0;
        }
        previousTime = millis();
      }
      if (currentFrame==0)
        image(fullPac, _position.x, _position.y, 35, 35);
      if (currentFrame==1)
        image(leftPac1, _position.x, _position.y, 35, 35);
      if (currentFrame==2)
        image(leftPac2, _position.x, _position.y, 35, 35);
    }
    //MOVING RIGHT
    if (_direction.x==1&&_direction.y==0) { 
      if (millis() > previousTime + deltaTime) {
        currentFrame++;
        if (currentFrame>2) {
          currentFrame=0;
        }
        previousTime = millis();
      }
      if (currentFrame==0)
        image(fullPac, _position.x, _position.y, 35, 35);
      if (currentFrame==1)
        image(rightPac1, _position.x, _position.y, 35, 35);
      if (currentFrame==2)
        image(rightPac2, _position.x, _position.y, 35, 35);
    }
    //MOVING DOWN
    if (_direction.x==0&&_direction.y==1) { 
      if (millis() > previousTime + deltaTime) {
        currentFrame++;
        if (currentFrame>2) {
          currentFrame=0;
        }
        previousTime = millis();
      }
      if (currentFrame==0)
        image(fullPac, _position.x, _position.y, 35, 35);
      if (currentFrame==1)
        image(downPac1, _position.x, _position.y, 35, 35);
      if (currentFrame==2)
        image(downPac2, _position.x, _position.y, 35, 35);
    }
    //MOVING UP
    if (_direction.x==0&&_direction.y==-1) { 
      if (millis() > previousTime + deltaTime) {
        currentFrame++;
        if (currentFrame>2) {
          currentFrame=0;
        }
        previousTime = millis();
      }
      if (currentFrame==0)
        image(fullPac, _position.x, _position.y, 35, 35);
      if (currentFrame==1)
        image(upPac1, _position.x, _position.y, 35, 35);
      if (currentFrame==2)
        image(upPac2, _position.x, _position.y, 35, 35);
    }
  }
}
