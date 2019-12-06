class Hero { //<>//
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
    if (keyPressed) {
      delay(50);
      switch(key) {
      case 'w': 
        if (b._cells[int(_position.x/b._cellSize)][int(_position.y/b._cellSize-1)]==TypeCell.WALL) {
          println("UP:ERROR");
        } else {
          _position.y-=defSpeed; 
          _direction.y=-1;
          _direction.x=0;
        }
        break;
      case 'a': 
        if (_position.x<=20 && _position.y==420) _position.x=width+20;
        if (b._cells[int(_position.x/b._cellSize-1)][int(_position.y/b._cellSize)]==TypeCell.WALL) {
          println("LEFT:ERROR");
        } else {
          _position.x-=defSpeed;
          _direction.y=0;
          _direction.x=-1;
        }
        break;
      case 's': 
        if (b._cells[int(_position.x/b._cellSize)][int(_position.y/b._cellSize+1)]==TypeCell.WALL) {
          println("DOWN:ERROR");
        } else {

          _position.y+=defSpeed;
          _direction.y=+1;
          _direction.x=0;
        }
        break;

      case 'd': 
        if (_position.x>=900 && _position.y==420) _position.x=-20;
        if (b._cells[int(_position.x/b._cellSize+1)][int(_position.y/b._cellSize)]==TypeCell.WALL) 
          println("RIGHT:ERROR");
        else {
          _position.x+=defSpeed;
          _direction.y=0;
          _direction.x=1;
          break;
        }
      }
    }
  }


  void isMoving() {
    if (_direction.x==0 && _direction.y==0) _moving = false;
    else _moving = true;
  }

  void move(Board b) {
  }

  void countCell() {//count how many spaces you can move in each direction    
    int cellUP=0;
    int cellDOWN=0;
    int cellRIGHT=0;
    int cellLEFT=0;
    for (int i=0; i<_position.y; i+=b._cellSize) {     
      if (b._cells[int(_position.x/b._cellSize)][int(_position.y/b._cellSize)-1]!=TypeCell.WALL)
        cellUP+=1;
    //  else if (b._cells[int(_position.x/b._cellSize)][int(_position.y/b._cellSize)+1]!=TypeCell.WALL)
    //    cellDOWN+=1;
    //}
    //for (int j=0; j<_position.x; j+=b._cellSize) {
    //  if (b._cells[int(_position.x/b._cellSize)+1][int(_position.y/b._cellSize)]!=TypeCell.WALL)
    //    cellRIGHT+=1;
    //  else if (b._cells[int(_position.x/b._cellSize)-1][int(_position.y/b._cellSize)]!=TypeCell.WALL)
    //    cellLEFT+=1;
    }
    println(cellUP +" UP");
    println(cellDOWN +" DOWN");
    println(cellRIGHT +" RIGHT");
    println(cellLEFT +" LEFT");
  }

  void eatDot() {    
    if (b._cells[int(_position.x/b._cellSize)][int(_position.y/b._cellSize)]==TypeCell.DOT) {
      b._cells[int(_position.x/b._cellSize)][int(_position.y/b._cellSize)]=TypeCell.EATEN;
      //println("you are on a dot");
    }
  }

  void drawIt() {
    final PImage feuille = loadImage("sprites.png");
    imageMode(CENTER);
    //rectMode(CENTER);
    imageMode(CENTER);
    fill(yellow);
    //rect(_position.x, _position.y, b._cellSize, b._cellSize);
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
}
