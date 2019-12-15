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
    handleKey(key);
   
  }

  void drawIt() {
    _board.drawIt();
    _hero.drawIt();
  }

  void handleKey(int k) {    
   if (k=='w')
      _hero.launchMove(Up);
    if (k=='d')
      _hero.launchMove(Right);
    if (k=='a')
      _hero.launchMove(Left);
    if (k=='s')
      _hero.launchMove(Down);
    }
}
