

class Timer {
  int startTime=0;
  int stopTime =0;
  int pauseTime =0;
  boolean on=false;
  boolean isPaused = false;

  void start() {
    startTime = millis();
    on = true;
  }
  void stop() {
    stopTime = millis();
    on = false;
  }
  void resume() {
    isPaused=false;
  }

  void pause() {
    isPaused=true;
    pauseTime = millis()-getTime();
  }

  int getTime() {
    int timePast;
    if (on) {
      timePast = (millis()-startTime);
    } else {
      timePast = (stopTime - startTime);
    }
    return timePast;
  }
  int second() {
    return (getTime()/1000)%60;
  }
  int minute() {
    return (getTime()/(1000*60))%60;
  }
}









void gameStage() {
  if (stage==0) { //SCREEN 0: press key to start
    menuAnimation0();
    exitButton();
  }
  if (stage==1) { //SCREEN 1: new game, load game, highscores...    
    menuAnimation1();
    menuMove1();
    exitButton();
  }
  if (stage==2) { //SCREEN 2: HIGHSCORES
    menuAnimation2();
  }
  if (stage==3) {
    menuAnimation3();
    exitButton();
  }
  if (stage==4) { //SCREEN 2: PAUSE SCREEN
    menuAnimation4();
    menuMove4();
    exitButton();
  }
  if (stage==5) { //STAGE 5: GAMEPLAY
    game.update();
    game.drawIt();
    stage5Animation();
    if (lives==0) {
      stage=98;
      scoreCheck();
    }
  }
  if (stage==98) { //STAGE 98: YOU ARE DEAD, GG
    menuAnimation98();
    exitButton();
  }
  if (stage==99) { //STAGE 99: ARE YOU SURE YOU WANT TO QUIT?
    menuAnimation99();
    menuMove99();
  }
}

//MENU ANIMATIONS FUNCTIONS
void menuAnimation0() {  
  imageMode(NORMAL);
  image(stage0, 0, 0);
  pacAnimationInMenu();
}

void menuAnimation1() {
  imageMode(NORMAL);
  image(stage1, 0, 0);
  pacAnimationInMenu();
}

void menuAnimation2() {
  imageMode(NORMAL); 
  image(highscore, 0, 0);
  pacAnimationInMenu();
}

void menuAnimation3() {  
  imageMode(NORMAL);
  image(loadlevel, 0, 0);
  pacAnimationInMenu();
}

void menuAnimation4() {
  imageMode(NORMAL); 
  tint(255, 10);
  image(pausescreen, 0, 0);
  noTint();
  pacAnimationInMenu();
}

void menuAnimation98() {
  imageMode(NORMAL); 
  image(deadscreen, 0, 0);
  textSize(160);
  text(score, 600, 740);
  //if highscore then blink highscore text
  pacAnimationInMenu98();
}

void menuAnimation99() {
  imageMode(NORMAL);
  image(stage99, 0, 0);
  pacAnimationInMenu();
}


//MENU MOVE FUNCTIONS <=> IF IM CLICKING ON THIS BUTTON THEN DO THAT...
void menuMove1() {
  if (mouseX>278 && mouseX<674 && mouseY>538 && mouseY<599) { //NEW GAME, top rectangle
    if (mousePressed) {
      stage=5;
      lives=2;
      score=0;
      hero.reset();
      blinky.reset();
      inky.reset();
      clyde.reset();
      pinky.reset();
      b.reloadBoard();
      t.start();
    }
  }
  if (mouseX>269 && mouseX<692 && mouseY>620 && mouseY<681) { //LOAD GAME, 2nd rectangle from top
    if (mousePressed) {     
      stage=3;
      loadALevel();
      stage=5;
    }
  }
  if (mouseX>278 && mouseX<687 && mouseY>708 && mouseY<770) { //SAVE GAME, 2nd rectangle from bot
    if (mousePressed) {    
      levelSave();
    }
  }
  if (mouseX>265 && mouseX<700 && mouseY>794 && mouseY<854) { //HIGHSCORES, bottom rectangle
    if (mousePressed) {      
      stage=2;
    }
  }
}

void menuMove4() {
  if (mouseX>321 && mouseX<630 && mouseY>538 && mouseY<600) { //RESUME -> GO BACK TO GAME
    if (mousePressed) {
      stage=5;
      t.resume();
    }
  }
  if (mouseX>268 && mouseX<691 && mouseY>619 && mouseY<680) { //MAIN MENU -> GO TO MENU (STAGE 1)
    if (mousePressed)
      stage=1;
  }
  if (mouseX>278 && mouseX<686 && mouseY>708 && mouseY<769) { //SAVE GAME -> SAVE GAME IN FILE.TXT
    if (mousePressed) {
      levelSave();
    }
  }
}

void menuMove99() {
  if (mouseX>191 && mouseX<424 && mouseY>744 && mouseY<837) { //YES BUTTON -> CLOSE GAME DOWN
    if (mousePressed)
      exit();
  }
  if (mouseX>549 && mouseX<733 && mouseY>740 && mouseY<837) { //NO BUTTON -> GO BACK TO MENU
    if (mousePressed) {
      if (score>0)
        stage=5;
      stage=1;
    }
  }
}

void exitButton() {
  if (stage!=5 && stage!=99) { 
    if (mouseX>65 && mouseX<176 && mouseY>840 && mouseY<919)
      if (mousePressed)
        stage=99;
  }
}

void stage5Animation() {
  textFont(scoreFont);
  fill(white);
  textSize(70);
  text(score, width/2+50, height-25);
  textSize(60);
  text(t.minute()+ ":" +t.second(), width/2+320, height-25);
  if (lives==3) {
    image(rightPac1, width/2-150, height-size);
    image(rightPac1, width/2-250, height-size);
    image(rightPac1, width/2-200, height-size);
  }
  if (lives==2) {
    image(rightPac1, width/2-250, height-size);
    image(rightPac1, width/2-200, height-size);
  }
  if (lives==1) {
    image(rightPac1, width/2-250, height-size);
  }
  image(border, width/2, height-size);
}

void scoreCheck() {
  scoreFile = createWriter("scores.txt");
  if (score>scoreTab[4]) {//ITS A TOP 5 SCORE
    //name = askString("enter your name");
    scoreFile.println(score + ":" + name);
    scoreFile.flush();
    scoreFile.close();
    sort(scoreTab);
  }
}

void levelSave() { //va permettre de sauvegarder un niveau avec un nombre random et va vous l afficher pour eviter qu'un autre fichier save se fasse ecraser
  levelFile = createWriter("savedLevel"+randomSave+".txt");
  String longString = "";
  for (int i=0; i<level.length; i++) {
    if (longString!="") {
      levelFile.println(longString); 
      longString ="";
    }
    for (int j=0; j<=b._cells[i].length; j++) {
      if (b._cells[j][i]==TypeCell.WALL) { 
        longString+='x';
      }
      if (b._cells[j][i]==TypeCell.EMPTY) {
        longString+='V';
      }
      if (b._cells[j][i]==TypeCell.DOT) {
        longString+='o';
      }
      if (b._cells[j][i]==TypeCell.SUPER_DOT) { 
        longString+='O';
      }
      if (b._cells[j][i]==TypeCell.PACMAN) { 
        longString+='P';
      }
      if (b._cells[j][i]==TypeCell.VOID) { 
        longString+='E';
      }
    }
  }
  levelFile.print("xxxxxxxxxxxxxxxxxxxxxxx");

  println("Your level has been saved, it is level: " +randomSave);
  levelFile.flush();
  levelFile.close();
}

void loadALevel() { //permet de load un level sauvegarder et vous demande le numero du level
  int saveNumber = askInteger("What save do you want to open?");
  char c;
  level = loadStrings("savedLevel"+saveNumber+".txt"); 
  for (int i=0; i<level.length; i++) {
    for (int j=0; j<=b._cells[i].length; j++) {
      c=level[i].charAt(j);
      switch(c) {
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
        b._cells[j][i]=TypeCell.VOID;
        break;
      }
    }
  }
}




void pacAnimationInMenu() { //ANIMATE PACMAN IN THE MENU, looks cool :P
  if (millis() > previousTime + deltaTime) {
    currentFrame++;
    if (currentFrame>2) {
      currentFrame=0;
    }
    previousTime = millis();
  }
  if (currentFrame==0)
    copy(feuille, 50*17, 50*7, 50, 50, 680, 450, 80, 80);
  if (currentFrame==1)
    copy(feuille, 50*17, 50*8, 50, 50, 680, 450, 80, 80);
  if (currentFrame==2)
    copy(feuille, 50*17, 50*9, 50, 50, 680, 450, 80, 80);
}

void pacAnimationInMenu98() { //ANIMATE PACMAN IN THE MENU 98, you are dead
  if (millis() > previousTime + betaTime) {
    currentFrame++;
    if (currentFrame>10) {
      currentFrame=0;
    }
    previousTime = millis();
  }
  if (currentFrame==0)
    copy(feuille, 50*7, 50*1, 50, 50, 680, 450, 80, 80);
  if (currentFrame==1)
    copy(feuille, 50*7, 50*2, 50, 50, 680, 450, 80, 80);
  if (currentFrame==2)
    copy(feuille, 50*7, 50*3, 50, 50, 680, 450, 80, 80);
  if (currentFrame==3)
    copy(feuille, 50*7, 50*4, 50, 50, 680, 450, 80, 80);
  if (currentFrame==4)
    copy(feuille, 50*7, 50*5, 50, 50, 680, 450, 80, 80);
  if (currentFrame==5)
    copy(feuille, 50*7, 50*6, 50, 50, 680, 450, 80, 80);
  if (currentFrame==6)
    copy(feuille, 50*7, 50*7, 50, 50, 680, 450, 80, 80);
  if (currentFrame==7)
    copy(feuille, 50*7, 50*8, 50, 50, 680, 450, 80, 80);
  if (currentFrame==8)
    copy(feuille, 50*7, 50*9, 50, 50, 680, 450, 80, 80);
  if (currentFrame==9)
    copy(feuille, 50*7, 50*10, 50, 50, 680, 450, 80, 80);
  if (currentFrame==10)
    copy(feuille, 50*7, 50*11, 50, 50, 680, 450, 80, 80);
  if (currentFrame==11)
    copy(feuille, 50*7, 50*3, 50, 50, 680, 450, 80, 80);
}
