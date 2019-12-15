class Ghost extends Hero {

  Ghost() {  
    _cellX=11;
    _cellY=16;
    _position=new PVector(40*_cellX+20, 40*_cellY+20);
    _direction=new PVector();
  }

  void drawIt() {
    PImage feuille = loadImage("sprites.png");
    //if (_direction.x==-1&&_direction.y==0) { //MOVING LEFT
    copy(feuille, 50*1, 50*6, 50, 50, 440, 400, 40, 40);
    //} else if (_direction.x==1&&_direction.y==0) { //MOVING RIGHT
    copy(feuille, 50*2, 50*6, 50, 50, 400, 400, 40, 40);
    //} else if (_direction.x==0&&_direction.y==1) {//MOVING DOWN
    copy(feuille, 50*3, 50*6, 50, 50, 480, 400, 40, 40);
    //} else if (_direction.x==0&&_direction.y==-1) {//MOVING UP
    copy(feuille, 50*4, 50*6, 50, 50, 520, 400, 40, 40);
    copy(feuille, 50*5, 50*6, 50, 50, 360, 400, 40, 40);
  }
}
