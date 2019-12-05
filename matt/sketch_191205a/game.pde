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
    _hero.launchMove(p);
  }

  void drawIt() {
    
    _board.drawIt();
    _hero.drawIt();
  }

  void handleKey(int k) {
  }
}
