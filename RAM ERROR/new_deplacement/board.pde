PVector p = new PVector(0, 0);  //<>//
float size =40;
Board b= new Board(p, 22, 23, size); //16 cases en x car 800/50
enum TypeCell {
  EMPTY, WALL, DOT, SUPER_DOT, PACMAN
}

class Board {
  TypeCell _cells[][];
  PVector _position;
  int _nbCellsX;
  int _nbCellsY;
  float _cellSize; 

  Board(PVector pos, int nbX, int nbY, float size) {
    _position = pos.copy();
    _nbCellsX = nbX;
    _nbCellsY = nbY;
    _cellSize = size;
    _cells = new TypeCell[_nbCellsY][_nbCellsX];
  }

  PVector getCellCenter(int i, int j) {
    return new PVector( _position.x + i * _cellSize + (_cellSize * 0.5), 
      _position.y + j * _cellSize + (_cellSize * 0.5) );
  }

  void loadLevel() {
    char c;
    String [] level = loadStrings("level1.txt"); //on charge le fichier texte qui va correspondre au plateau de jeu (board)
    for (int i=0; i<level.length; i++) {
      for (int j=0; j<=b._cells[i].length; j++) {
        c=level[i].charAt(j);
        switch(c) { //on test toutes les possibilites de c
        case 'x':
          b._cells[j][i]=TypeCell.WALL;
          break;
        case 'V':
          b._cells[j][i]=TypeCell.EMPTY;
          break;
        case 'o':
          b._cells[j][i]=TypeCell.DOT;
          break;
        case 'O':
          b._cells[j][i]=TypeCell.SUPER_DOT;
          break;
        case 'P':
          b._cells[j][i]=TypeCell.PACMAN;
          break;
        }
      }
    }
  }

  void drawIt() {
    background(0);
    PImage wall = loadImage("wall texture.png");
    PImage dot = loadImage("dot.png");
    PImage superDot = loadImage("superdot.png");
    float   posX=b._position.x;
    float   posY=b._position.y;
    noStroke();
    ellipseMode(CENTER);
    rectMode(CENTER);
    float size = 40; //800/23
    float centre = 20;
    for (int i=0; i<b._cells.length; i++) {
      for (int j=0; j<b._cells[i].length; j++) {
        switch(b._cells[i][j]) {
        case WALL:         
          image(wall, i*size+centre+posX, j*size+centre+posY, size, size);
          break;
        case DOT:
          image(dot, i*size+centre+posX, j*size+centre+posY, 10, 10);
          break;
        case SUPER_DOT: 
          tint(255, 0, 0);
          image(superDot, i*size+centre+posX, j*size+centre+posY, 20, 20);
          noTint();
          break;
        case PACMAN:         
          break;
        case EMPTY:
          break;
        }
      }
    }
  }
}
