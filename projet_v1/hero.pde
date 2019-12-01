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
    
  Hero() {  _position=b.getCellCenter(16,11); //<>//
             
    
  
  
  
  
  }
  
  void launchMove(PVector dir) {
 
  
  
  }
  
  void move(Board board) {
        switch(key){
             case 'z':
        _position.y-=b._cellSize;
          break;
        case 'q':
          _position.x-=b._cellSize;
          break;
        case 's':
       _position.y+=b._cellSize;
          break;
        case 'd':
         _position.x+=b._cellSize;
          break;
      
        
        
        
        
        }

  
  
  }
  
  void update(Board board) {
  
  }
  
  void drawIt() { ellipseMode(CENTER);
  fill(yellow);
        rect(_position.x+b._position.x, _position.y+b._position.y, b._cellSize,  b._cellSize);
  
  
  
  }



}
