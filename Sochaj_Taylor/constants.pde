
final color blue = color(0, 0, 255);
final color pink = color(255, 192, 203);
final color red = color(255, 0, 0);
final color yellow = color(255, 255, 0);
final color white = color(255);
final color black = color(0);
final PVector Up=new PVector(0, -1);
final PVector Down=new PVector(0, 1);
final PVector Left=new PVector(-1, 0);
final PVector Right=new PVector(1, 0);
final float centre = 20;
float previousTime;
float deltaTime =150;
float betaTime =100;
float stage =0;
int score =0;
int lives =2;
int currentFrame;
int scoreTab [] = new int [100];
PrintWriter scoreFile;
PrintWriter levelFile;
String name;
String [] level;
int randomSave =int(random(100));
int multiplicateur=1;
int ajouterLive;
int nbDot=224;
//SoundFile eatDot;
//SoundFile death;
//SoundFile eatFruit;
//SoundFile eatGhost;





//IMAGES TO BE LOADED IN SETUP

//PACMAN
PImage fullPac;
PImage leftPac1;
PImage leftPac2 ;
PImage rightPac1;
PImage rightPac2 ;
PImage upPac1 ;
PImage upPac2;
PImage downPac1 ;
PImage downPac2;

//GHOSTS R=RED, B=BLUE, O=ORANGE, P=PINK
PImage leftRGhost;
PImage leftBGhost;
PImage leftOGhost ;
PImage leftPGhost;
PImage rightRGhost ;
PImage rightBGhost ;
PImage rightOGhost;
PImage rightPGhost ;
PImage downRGhost;
PImage downBGhost;
PImage downOGhost;
PImage downPGhost ;
PImage upRGhost;
PImage upBGhost ;
PImage upOGhost ;
PImage upPGhost;
PImage deadGhost1 ;
PImage deadGhost2;

//OTHER
PImage wall ;
PImage dot ;
PImage superDot ;
PImage apple ;
PImage burger ;
PImage banana ;
PImage stage0;  
PImage stage1 ; 
PImage highscore ;  
PImage stage99 ; 
PImage border ;
PFont scoreFont ;
PImage feuille ;
PImage deadscreen ;
PImage pausescreen;
PImage loadlevel;
int fruitCount;
