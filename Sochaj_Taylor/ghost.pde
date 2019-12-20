class Ghost { //classe ghost ou on va utiliser l'heritage 
  PVector _position; 
  int _cellX, _cellY;
  float _size;
  PVector _direction;
  PVector _nextDir;
  PVector _previousDir;
  boolean _moving;
  boolean _vulnerable;
  int _oneTime;
  int _nbDir;
  int _defSpeed;

  void launchMove(PVector dir) {    //permet de lancer un deplacement d'un fantome
    _nextDir=dir;
    if (_cellX==1&&_cellY==10&&dir==Left) //les deux prochains if s'occupent des tunnels
    {
      tunnelGauche();
    } else if (_cellX==21&&_cellY==10&&dir==Right)
    {
      tunnelDroit();
    }
    if (b._cells[_cellX+int(dir.x)][_cellY]!=TypeCell.WALL) //si il y a pas de mur dans la direction _moving=true
    { 
      _moving=true;
    }
    if (_moving==true) {   
      if (_position.x%20==0&&_position.x%40!=0&&_position.y%20==0&&_position.y%40!=0) { //permet d'avoir CellX et CellY dynamiquement 
        _cellX=getCell(_position.x);
        _cellY=getCell(_position.y);
      }

      if (changementDirection()) //if il y a un changement de direction
      {
        _position.x=_cellX*40+centre;
        _position.y=_cellY*40+centre; // alors on fait la mini teleportation pour eviter de decalage et que les fantômes soit au centre de la case 
        _previousDir=_nextDir;
      } else {  
        _direction.x=dir.x;
        _direction.y=dir.y;
        _previousDir=_direction; //sinon on lance moove b avec le bon vecteur direction
        move(b);
      }
    }
  }
  void move(Board b) { //fait le deplacement 

    if (b._cells[_cellX+int(_direction.x)][_cellY+int(_direction.y)]!=TypeCell.WALL) {
      _position.x+=_direction.x*_defSpeed;
      _position.y+=_direction.y*_defSpeed;   //bouge la position des fantomes
    } else
    {
      _moving=false; //si il peut pas bouger alors _moving =false
    }
  }
  boolean changementDirection() //renvoit vrai si il y a un changement de direction
  {
    if (_nextDir.x!=_previousDir.x&&_nextDir.y!=_previousDir.y)return true;
    return false;
  }
  int getCell(float pos) //renvoit l indice de la case 
  {
    return int(pos/40);
  }
  void tunnelGauche() //s'occupe du tunnel gauche
  { 
    _cellX=22;
    _position=b.getCellCenter(_cellX-1, _cellY);
  }
  void tunnelDroit() //s'occupe du tunnel droite
  { 
    _cellX=2;
    _position=b.getCellCenter(_cellX-1, _cellY);
  }
  void reset() //reset la position du fantome  et sa vulnerabilite si il se fait manger par exemple 
  {
    _cellX=11;
  _cellY=10;
  _position=b.getCellCenter(_cellX, _cellY);
  _vulnerable=false;
  _defSpeed=4;
}
PVector getRandom() //va permettre d'avoir une direction aléatoire
{
  _oneTime=1; //met la variabke 1 time qui va dire qu'on a fait une fois le deplacement 
  ArrayList<PVector> dirPossible= new ArrayList<PVector>(); //creer un tableau dynamique qu'on va remplir avec les vecteurs direction possible
  for (int i = dirPossible.size() - 1; i >= 0; i--)
    dirPossible.remove(i);   
  if (estDansCage()==true) {  
    if (b._cells[_cellX][_cellY-1]!=TypeCell.WALL) {
      dirPossible.add( Up);
    } 
    if (b._cells[_cellX][_cellY+1]!=TypeCell.WALL) {
      dirPossible.add( Down);
    }
    if (b._cells[_cellX+1][_cellY]!=TypeCell.WALL) {
      dirPossible.add( Right);
    }
    if (b._cells[_cellX-1][_cellY]!=TypeCell.WALL) {
      dirPossible.add( Left);
    }
  } else { //si les fantome sont pas dans la cage ils ne peuvent pas faire la direction inverse cela rends le jeu plus agreable
    if (b._cells[_cellX][_cellY-1]!=TypeCell.WALL&&_previousDir!=Down) {
      dirPossible.add( Up);
    } 
    if (b._cells[_cellX][_cellY+1]!=TypeCell.WALL&&_previousDir!=Up) {
      dirPossible.add( Down);
    }
    if (b._cells[_cellX+1][_cellY]!=TypeCell.WALL&&_previousDir!=Left) {
      dirPossible.add( Right);
    }
    if (b._cells[_cellX-1][_cellY]!=TypeCell.WALL&&_previousDir!=Right) {
      dirPossible.add( Left);
    }
  }
  return dirPossible.get(int(random(dirPossible.size())));// return une direction random
}

int nbDirPossible() //renvoie le nombre de direction possible 
{ 
  _nbDir=0;

  if (b._cells[_cellX][_cellY-1]!=TypeCell.WALL) {
    _nbDir++;
  } 
  if (b._cells[_cellX][_cellY+1]!=TypeCell.WALL) {
  }
  if (b._cells[_cellX+1][_cellY]!=TypeCell.WALL) {
    _nbDir++;
  }
  if (b._cells[_cellX-1][_cellY]!=TypeCell.WALL) {
    _nbDir++;
  }
  if (b._cells[_cellX][_cellY+1]!=TypeCell.WALL) {
    _nbDir++;
  }

  return _nbDir;
}

boolean estDansCage() { //boolean qui renvoie vrai si le fantôme est dans la cage
  if (_cellY==10&&(_cellX==10||_cellX==11||_cellX==12||_cellX==13||_cellX==9))
    return true;
  return false;
}
}

class Blinky extends Ghost { //RED GHOST on utilise l'héritage
  Blinky() {  // on l'initialise 
    _defSpeed=4;
    _vulnerable=false;
    _cellX=9;
    _cellY=10;
    _position=b.getCellCenter(_cellX, _cellY);      
    _direction=new PVector(0, -1);
    _nextDir=new PVector();
    _previousDir=new PVector();
  }
  void drawIt() {  //ici on dessine le ghost avec l'animation 
    if (_vulnerable) { //si il est vunerable il faut le montrer au joueur
      _defSpeed=2;
      if (millis() > previousTime + deltaTime) {
        currentFrame++;
        if (currentFrame>1) {
          currentFrame=0;
        }
        previousTime = millis();
      }
      if (currentFrame==0)
        image(deadGhost1, _position.x, _position.y, 35, 35);
      else
        image(deadGhost2, _position.x, _position.y, 35, 35);
    } else if (_direction==Left)
      image(leftRGhost, _position.x, _position.y, 35, 35);
    else if (_direction==Right) 
      image(rightRGhost, _position.x, _position.y, 35, 35);
    else if (_direction==Up) 
      image(upRGhost, _position.x, _position.y, 35, 35);
    else if (_direction==Down) 
      image(downRGhost, _position.x, _position.y, 35, 35);
  }
}

class Clyde extends Ghost { //ORANGE exactement pareil que le fantôme au dessus 
  Clyde() {  
    _defSpeed=4;
    _vulnerable=false;
    _cellX=10;
    _cellY=10;
    _position=b.getCellCenter(_cellX, _cellY);      
    _direction=new PVector(-1, 0);
    _nextDir=new PVector();
    _previousDir=new PVector();
  }
  void drawIt() { 
    if (_vulnerable) {
      _defSpeed=2;
      if (millis() > previousTime + deltaTime) {
        currentFrame++;
        if (currentFrame>1) {
          currentFrame=0;
        }
        previousTime = millis();
      }
      if (currentFrame==0)
        image(deadGhost1, _position.x, _position.y, 35, 35);
      else
        image(deadGhost2, _position.x, _position.y, 35, 35);
    } else if (_direction==Left)
      image(leftOGhost, _position.x, _position.y, 35, 35);
    else if (_direction==Right) 
      image(rightOGhost, _position.x, _position.y, 35, 35);
    else if (_direction==Up) 
      image(upOGhost, _position.x, _position.y, 35, 35);
    else if (_direction==Down) 
      image(downOGhost, _position.x, _position.y, 35, 35);
  }
}

class Inky extends Ghost { //BLUE
  Inky() {  
    _defSpeed=4;
    _vulnerable=false;
    _cellX=13;
    _cellY=10;
    _position=b.getCellCenter(_cellX, _cellY);      
    _direction=new PVector(1, 0);
    _nextDir=new PVector();
    _previousDir=new PVector();
  }
  void drawIt() {  
    if (_vulnerable) {
      _defSpeed=2;
      if (millis() > previousTime + deltaTime) {
        currentFrame++;
        if (currentFrame>1) {
          currentFrame=0;
        }
        previousTime = millis();
      }
      if (currentFrame==0)
        image(deadGhost1, _position.x, _position.y, 35, 35);
      else
        image(deadGhost2, _position.x, _position.y, 35, 35);
    } else if (_direction==Left)
      image(leftBGhost, _position.x, _position.y, 35, 35);
    else if (_direction==Right) 
      image(rightBGhost, _position.x, _position.y, 35, 35);
    else if (_direction==Up) 
      image(upBGhost, _position.x, _position.y, 35, 35);
    else if (_direction==Down) 
      image(downBGhost, _position.x, _position.y, 35, 35);
  }
}


class Pinky extends Ghost { //PINK duhh
  Pinky() {  
    _defSpeed=4;
    _vulnerable=false;
    _cellX=12;
    _cellY=10;
    _position=b.getCellCenter(_cellX, _cellY);      
    _direction=new PVector(0, 1);
    _nextDir=new PVector();
    _previousDir=new PVector();
  }
  void drawIt() {    
    if (_vulnerable) {
      _defSpeed=2;
      if (millis() > previousTime + deltaTime) {
        currentFrame++;
        if (currentFrame>1) {
          currentFrame=0;
        }
        previousTime = millis();
      }
      if (currentFrame==0)
        image(deadGhost1, _position.x, _position.y, 35, 35);
      else
        image(deadGhost2, _position.x, _position.y, 35, 35);
    } else if (_direction==Left)
      image(leftPGhost, _position.x, _position.y, 35, 35);
    else if (_direction==Right) 
      image(rightPGhost, _position.x, _position.y, 35, 35);
    else if (_direction==Up) 
      image(upPGhost, _position.x, _position.y, 35, 35);
    else if (_direction==Down) 
      image(downPGhost, _position.x, _position.y, 35, 35);
  }
}
