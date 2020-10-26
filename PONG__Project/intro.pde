void intro () {
  intro.play();
  // DECORATION
  image(volleyball,0,0,860,600);
  fill(0);
  textFont(mentality);
  textSize(55);
  text("VOLLEYBALL PONG!", 160, 170);
  fill(255);
  text("VOLLEYBALL PONG!", 157, 173);

  // 1 PLAYER
  fill(255);
  stroke(0);
  strokeWeight(5);
  tactile(100,450,200,100);
  rect(100, 450, 200, 100);
  fill(0);
  textFont(mentality);
  textSize(30);
  text("1 PLAYER", 130, 510);

  // 2 PLAYERS
  fill(255);
  stroke(0);
  strokeWeight(5);
  tactile(500,450,200,100);
  rect(500, 450, 200, 100);
  fill(0);
  textFont(mentality);
  textSize(30);
  text("2 PLAYERS", 525, 510);
}

void tactile (int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    stroke(#7E531D);
  } else {
    stroke (0);
  }
}

void introClicks() {
  //1 player
  if (mouseX > 100 && mouseX < 300 && mouseY > 450 && mouseY < 550) {
    mode = GAME;
    intro.pause();
    intro.rewind();
    AI = true;
  }

  //2 players
  if (mouseX > 500 && mouseX < 700 && mouseY > 450 && mouseY < 550){
    mode = GAME;
    intro.pause();
    intro.rewind();
    AI = false;
  }
    

  lscore = 0;
  rscore = 0;
  timer = 100;
  
   //initialize paddles 
  leftx = 0;
  lefty = height/2;
  leftd = 200;

  rightx = width;
  righty = height/2;
  rightd = 200;

  //initialize ball
  ballx = width/2;
  bally = height/2;
  balld = 100;

  vx = random(-5, 8);
  vy = random(-5, 8);
  a = radians(45);
  

  //initialize keyboard variables
  wkey = skey = upkey = downkey = false;
}
