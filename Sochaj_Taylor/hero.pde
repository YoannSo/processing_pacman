class Hero {  //class du hero
  PVector _position;
  PVector _posOffset; 
  int _cellX, _cellY;  
  float _size;  
  PVector _direction;
  PVector _nextDir;
  PVector _PreviousDir;
  boolean _moving; 
  int _defSpeed;

  Hero() {  //initialisation du hero
    _cellX=12;
    _cellY=16;
    _position=b.getCellCenter(_cellX-1, _cellY);
    _direction=new PVector(0, 0);
    _nextDir=new PVector();
    _PreviousDir=new PVector();
    _defSpeed=4;
  }

  int getCell(float pos) { //renvoie l'indice de la case
    return int(pos/40);
  }

  void launchMove(PVector dir) {     //lance le mouvement 
    _nextDir=dir;
    if (_cellX==1&&_cellY==10&&dir==Left) //s'occupe des tunnels
    {
      tunnelGauche();
    } else if (_cellX==21&&_cellY==10&&dir==Right)
    {
      tunnelDroit();
    }
    if (b._cells[_cellX+int(dir.x)][_cellY]!=TypeCell.WALL) //si il peut bouger alors -moving = true
      _moving=true;
    if (_moving==true) {   
      if (_position.x%20==0&&_position.x%40!=0&&_position.y%20==0&&_position.y%40!=0) {
        _cellX=getCell(_position.x);
        _cellY=getCell(_position.y); //permet d'avoir l'indices de la position du hero dans le tableau
      }
      if (changementDirection()) {//la mini teleportation si il change de direction pour eviter le decalage et que le pacman soit au centre 
        _position.x=_cellX*40+centre;
        _position.y=_cellY*40+centre;
        _PreviousDir=_nextDir;
      } else {  
        _direction.x=dir.x;//va lancer le moovement avec la bonne directoion
        _direction.y=dir.y;
        _PreviousDir=_direction;
        move(b);
      }
    }
  }

  void tunnelGauche()//la fonction des tunnels
  { 
    _cellX=21;
    _position=b.getCellCenter(_cellX-1, _cellY);
  }
  void tunnelDroit()
  { 
    _cellX=2;
    _position=b.getCellCenter(_cellX-1, _cellY);
  }

  boolean changementDirection() { // si il y a un changement de direction alors renvoie true
    if (_nextDir.x!=_PreviousDir.x&&_nextDir.y!=_PreviousDir.y)return true;
    return false;
  }



  void move(Board b) { //la fonction qui va bouger le hero
    eatDot(); //si il bouge alors il mange 
    if (b._cells[_cellX+int(_direction.x)][_cellY+int(_direction.y)]!=TypeCell.WALL) {
      _position.x+=_direction.x*_defSpeed;
      _position.y+=_direction.y*_defSpeed; //deplace le hero
    } else
    {
      _moving=false; //sinon il bouge pas
    }
  }

 
  void drawIt() {     //va dessiner le pacman
    imageMode(CENTER);
    pacAnimation();//va faire l'animation du pacman
  }
  void reset() {//reset le pacman par exemple si il se fait manger
    _cellX=11;
    _cellY=16;
    _position=b.getCellCenter(_cellX, _cellY);
  }
  void eatDot() { //IF PACMAN IS ON A DOT/SUPERDOT HE WILL EAT IT <=> IT WILL TRANSFORM INTO AN EMPTY CELL
    if (blinky._vulnerable==true&&t2.second()==10) {//si les fantome sosnt vulnerable et que cela fait 10 second alors ils deviennent invulnerable, reset le multiplcateur,remet la vitesse normal, et les recentre pour eviter le decalage 
      blinky._vulnerable=false;
      pinky._vulnerable=false;
      inky._vulnerable=false;
      clyde._vulnerable=false;
      multiplicateur=0;
       blinky._defSpeed=4;
      pinky._defSpeed=4;
      inky._defSpeed=4;
      clyde._defSpeed=4;
      blinky._position=b.getCellCenter(blinky._cellX,blinky._cellY);
      pinky._position=b.getCellCenter(pinky._cellX,pinky._cellY);
      inky._position=b.getCellCenter(inky._cellX,inky._cellY);
      clyde._position=b.getCellCenter(clyde._cellX,clyde._cellY);
    }
  if (b._cells[_cellX][_cellY]==TypeCell.PACMAN)//si il y a pacman dans la cellule(ellispe jaune a t=0) alors la remplace par empty
    b._cells[_cellX][_cellY]=TypeCell.EMPTY;
    if (b._cells[_cellX][_cellY]==TypeCell.DOT) {  //si il y a un dot la remplace par un empty augmente le score et baisse le nombre de dot
      b._cells[_cellX][_cellY]=TypeCell.EMPTY;
      score+=10;
      nbDot--;
    }
    if (b._cells[_cellX][_cellY]==TypeCell.SUPER_DOT) { //si c'est un superDot alors augemente le score,start le timer,et passe les fantômes invulnerable 
      b._cells[_cellX][_cellY]=TypeCell.EMPTY;
      score+=50;

      t2.start();

      blinky._vulnerable=true;
      pinky._vulnerable=true;
      inky._vulnerable=true;
      clyde._vulnerable=true;
    }
  }

  void pacAnimation() { //ANIMATE THE PACMAN WHEN HE IS MOVING
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
