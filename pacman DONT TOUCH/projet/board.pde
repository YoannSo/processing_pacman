PVector p = new PVector(800, 800);
Board b= new Board(p, 22, 22, 50); //16 cases en x car 800/50
color blue = color(0, 0, 255);
color pink = color(255, 192, 203);
color red = color(255, 0, 0);
color yellow = color(255, 255, 0);

enum TypeCell 
{
  EMPTY, WALL, DOT, SUPER_DOT, PACMAN // others ?
}

class Board 
{
  TypeCell _cells[][];
  PVector _position;
  int _nbCellsX;
  int _nbCellsY;
  int _cellSize; // cells should be square

  Board(PVector pos, int nbX, int nbY, int size) {
    _position = pos.copy();
    _nbCellsX = nbX;
    _nbCellsY = nbY;
    _cellSize = size;
    _cells = new TypeCell[_nbCellsY][_nbCellsX];
  }

  PVector getCellCenter(int i, int j) {
    return new PVector( _position.x + j * _cellSize + (_cellSize * 0.5), 
      _position.y + i * _cellSize + (_cellSize * 0.5) );
  }

  void loadLevel() {
    String [] level = loadStrings("level1.txt"); //on charge le fichier texte qui correspond au niveau //<>//
    for (int i=1; i<level.length; ) { //car la premiere ligne est un commentaire du prof // pour parcourir le tableau de level
      for (int j=0; j<b._cells.length; j++, i++) {
        for (int k=0; k<b._cells.length; k++) { 
          char c=level[i].charAt(k); //on recupere le caractere k de la ligne i
          switch(c) { //on test toutes les possibilites de c
          case 'x': 
            b._cells[k][j]=TypeCell.WALL;
            break;
          case 'V': 
            b._cells[k][j]=TypeCell.EMPTY;
            break;
          case 'o': 
            b._cells[k][j]=TypeCell.DOT;
            break;
          case 'O': 
            b._cells[k][j]=TypeCell.SUPER_DOT;
            break;
          case 'P': 
            b._cells[k][j]=TypeCell.PACMAN;
            break;
          }
        }
      }
    }
  }

  void drawIt() {
    noStroke();
    ellipseMode(CENTER);
    float size = 800/22;
    float centre = size/2;
    b.loadLevel();
    for (int i=0; i<b._cells.length; i++) {
      for (int j=0; j<b._cells.length; j++) {
        switch(b._cells[i][j]) {
        case WALL: 
          fill(blue); 
          rect(i*size, j*size, size, size);
          break;
        case DOT: 
          fill(pink);
          ellipse(i*size+centre, j*size+centre, 10, 10); 
          break;
        case SUPER_DOT: 
          fill(red);
          ellipse(i*size+centre, j*size+centre, 20, 20);
          break;
        case PACMAN: 
          fill(yellow); 
          ellipse(i*size+centre, j*size+centre, 35, 35);
          break;
        case EMPTY:
          break;
        }
      }
    }
  }
}
