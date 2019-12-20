class Game { //la class du jeu qui ca contenir toutes les classe
  Board _board;
  Hero _hero;
  String _levelName;
  Blinky _blinky;
  Pinky _pinky;
  Inky _inky;
  Clyde _clyde;

  Game() {  //initialiser le jeu
    _board = null;
    _hero = null;
  
  }

  void update() {   //la fonction qui va update tout le jeu
    if (nbDot<90) {     // ce if ca va permettre de reremplir la plateau si il y a moins de 90 dot
      b._cells[11][16]=TypeCell.BONUS;    
      if (hero._cellX==11 && hero._cellY==16) {
        b._cells[11][16]=TypeCell.EMPTY;
        b.reloadBoard();
        if (fruitCount<2)fruitCount++;
        else fruitCount=0;
        nbDot=224;
      }
    }
    ajouterLive=score;
    if (ajouterLive>=10000&&lives<3) {       //ce if va permettre a ajouter 1 vie si on a moins de 3 vie et si la variable ajouterLive>10000
      lives++;
      ajouterLive=0;
    }
    if (_blinky.estDansCage()==false&&_pinky.estDansCage()==false&&_inky.estDansCage()==false&&_clyde.estDansCage()==false)  //ce if va permettre de mettre un mur pour bloquer la cage si il y a aucun fantome dans la cage
      _board._cells[11][9]=TypeCell.WALL;
    else 
    _board._cells[11][9]=TypeCell.EMPTY;
    mangerFantome(_blinky);   //la fonction va permettre de soit manger un fantome si on a le bonus des superdot sinon de manger le pacman si on l'a pas
    mangerFantome(_pinky);
    mangerFantome(_inky);
    mangerFantome(_clyde);
   handleKey(key); //va permettre le deplacement du héro
    if (millis()%70==0) //va permettre de faire 1 seule fois le deplacement dans le prochain if
    {
      _blinky._oneTime=0;
      _pinky._oneTime=0;
      _inky._oneTime=0;
      _clyde._oneTime=0;
    }
    
    if (b._cells[ _pinky._cellX+int( _pinky._direction.x)][ _pinky._cellY+int( _pinky._direction.y)]==TypeCell.WALL||_pinky.nbDirPossible()>=3&&_pinky._position.x%20==0&&_pinky._position.y%20==0&&_pinky._oneTime==0) {  //tous ces if vont permettre de faire les deplacements aléatoire des fantômes
      _pinky._direction=_pinky.getRandom();
    }
    if (b._cells[ _inky._cellX+int( _inky._direction.x)][ _inky._cellY+int( _inky._direction.y)]==TypeCell.WALL||_inky.nbDirPossible()>=3&&_inky._position.x%20==0&&_inky._position.y%20==0&&_inky._oneTime==0) { 
      _inky._direction=_inky.getRandom();
    }
    if (b._cells[ _blinky._cellX+int( _blinky._direction.x)][ _blinky._cellY+int( _blinky._direction.y)]==TypeCell.WALL||_blinky.nbDirPossible()>=3&&_blinky._position.x%20==0&&_blinky._position.y%20==0&&_blinky._oneTime==0) { 
      _blinky._direction=_blinky.getRandom();
    }
    if (b._cells[ _clyde._cellX+int( _clyde._direction.x)][ _clyde._cellY+int( _clyde._direction.y)]==TypeCell.WALL||_clyde.nbDirPossible()>=3&&_clyde._position.x%20==0&&_clyde._position.y%20==0&&_clyde._oneTime==0) { 
      _clyde._direction=_clyde.getRandom();
    }
    _blinky.launchMove(_blinky._direction); //on appelle les fonction qui vont lancer le deplacement des fantomes 
    _pinky.launchMove(_pinky._direction);
    _inky.launchMove(_inky._direction);
    _clyde.launchMove(_clyde._direction);
  }

  void drawIt() { //va dessiner tout le jeu
    _board.drawIt();
    _hero.drawIt();
    _blinky.drawIt();
    _pinky.drawIt();
    _inky.drawIt();
    _clyde.drawIt();
  }

  void handleKey(int k) {  //permet d'identifier des touches a des deplacement 
    if (key==CODED)
    { ;
      if (keyCode==DOWN)
        k='s';
      if (keyCode==LEFT)
        k='a';
      if (keyCode==RIGHT)
        k='d';
      if (keyCode==UP)
        k='w';
    }


    if (k=='w' || k=='W')
      _hero.launchMove(Up);
    if (k=='d' || k=='D')
      _hero.launchMove(Right);
    if (k=='a' || k=='A')
      _hero.launchMove(Left);
    if (k=='s' || k=='S')
      _hero.launchMove(Down);
  }
  void mangerFantome(Ghost fantome)   //manger fantomes si superdot sinon manger pac
  { 
    if (_hero._cellX==fantome._cellX&&_hero._cellY==fantome._cellY) {//si les les cases du heros et d'un fantome sont confondue alors on regarde si les fantomes sont vulnerable ==>on mange le fantome et reset son placement sinon reset le heros et les fantomes 
      if (fantome._vulnerable==true) {
        fantome.reset();
        score+=100*multiplicateur;
        multiplicateur++;
      } else {
        lives--;
        _hero.reset();
        _clyde.reset();
        _inky.reset();
        _blinky.reset();
        _pinky.reset();
      }
    }
  }
}
