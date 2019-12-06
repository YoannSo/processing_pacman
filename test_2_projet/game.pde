class Game 
{
  Board _board;
  Hero _hero;

  String _levelName;

  Game() {
    _board = null;
    _hero = null;
  }

  void update() {
    //_hero.move(b);
    handleKey(key);
   
  }

  void drawIt() {

    _board.drawIt();
    _hero.drawIt();
  }

  void handleKey(int k) {
    //switch (k)
    //{ 
    //case :
    //  k='z';
    //  break;
    //case 's':
    //  k='s';
    //  break;
    //case 'q':
    //  k='q';
    //  break;
    //case 'd':
    //  k='d';
    //  break;
    //}
    println(hero.estAuCentre());
    println(_hero._cellX);
    if (k=='z')
      _hero.launchMove(Up);
    if (k=='d')
      _hero.launchMove(Right);
    if (k=='q')
      _hero.launchMove(Left);
    if (k=='s')
      _hero.launchMove(Down);
    }
}
