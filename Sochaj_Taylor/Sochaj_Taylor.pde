PVector p = new PVector(0, 0);  //<>//
 //taille d'une case
final float size =40;
Board b= new Board(p, 22, 23, size);// creation du board 
enum TypeCell {
  EMPTY, WALL, DOT, SUPER_DOT, PACMAN, VOID, BONUS   //nous vons rajouter void et bonus void qui correspond au case ou il ny aura jamais rien et Bonus correspond aux fruits
}

class Board {  //class du plateau de jeu
  TypeCell _cells[][];
  PVector _position;
  int _nbCellsX;
  int _nbCellsY;
  float _cellSize; 

  Board(PVector pos, int nbX, int nbY, float size) {  //initialisation du plateau
    _position = pos.copy();
    _nbCellsX = nbX;
    _nbCellsY = nbY;
    _cellSize = size;
    _cells = new TypeCell[_nbCellsY][_nbCellsX];
  }

  PVector getCellCenter(int i, int j) {  //retourne la position x,y de la case i,j
    return new PVector( _position.x + i * _cellSize + (_cellSize * 0.5), 
      _position.y + j * _cellSize + (_cellSize * 0.5) );
  }

  void loadLevel() { //permet de charger le levle 1 a l'ecran
    char c;
    level = loadStrings("level1.txt"); //on charge le fichier texte qui va correspondre au plateau de jeu (board)
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
        case 'E':
          b._cells[j][i]=TypeCell.VOID; //VOID représente ou le pacman ne peut jamais aller
          break;
        }
      }
    }
  }

  void drawIt() { //permet l'affiche du level en temps reel
    background(black); //on fait un fond de couleur noir
    float   posX=b._position.x;
    float   posY=b._position.y;
    rectMode(CENTER);
 
    for (int i=0; i<b._cells.length; i++) {
      for (int j=0; j<b._cells[i].length; j++) {
        switch(b._cells[i][j]) {
        case WALL:   //si c'est un WALL alors on load notre image custom qui correspond a la texture d'un mur (dans data) 
          image(wall, i*size+centre+posX, j*size+centre+posY, size, size);
          break;
        case DOT: //pareil pour un DOT, image custom 
          image(dot, i*size+centre+posX, j*size+centre+posY, 10, 10);
          break;
        case SUPER_DOT: 
          tint(255, 0, 0);
          image(superDot, i*size+centre+posX, j*size+centre+posY, 20, 20); 
          noTint();
          break;
        case PACMAN: 
        fill(yellow);
        ellipse(i*size+centre+posX, j*size+centre+posY,30,30); //ellipse qui va reprensenter pacman a l'instant 0
          break;
        case EMPTY:
          break;
        case VOID:         
          break;
        case BONUS: //l'image de BONUS change a chaque fois pour rendre le jeu plus agréable et moins répétitif? change entre APPLE/BANANA/BURGER
          image(randomImage(), 11*40+centre, 16*40+centre);
          break;
        }
      }
    }
  }

  void reloadBoard() { //reload the board with dots & superdots when we eat a certain amount of DOTS
    if (b._cells[1][2]==TypeCell.EMPTY) b._cells[1][2]=TypeCell.SUPER_DOT;
    if (b._cells[1][16]==TypeCell.EMPTY) b._cells[1][16]=TypeCell.SUPER_DOT;
    if (b._cells[21][16]==TypeCell.EMPTY) b._cells[21][16]=TypeCell.SUPER_DOT;
    if (b._cells[21][2]==TypeCell.EMPTY) b._cells[21][2]=TypeCell.SUPER_DOT;
    for (int i=0; i<b._cells.length; i++) {
      for (int j=0; j<b._cells[i].length; j++) {
        if (b._cells[i][j]==TypeCell.EMPTY) b._cells[i][j]=TypeCell.DOT;
      }
    }
  }


  PImage randomImage() {  //va permetre d'avoir une image random pour les fruits
    PImage bonus=null;
    int x =fruitCount;
    if (x==0) bonus = apple;
    if (x==1) bonus = burger;
    if (x==2) bonus = banana;
    return bonus;
  }
}
