void gameover () {
  if (lscore > rscore) {
    clapping.play();
    textSize(50);
    text("LEFT WINS",300,300);
  }
  else { 
    clapping.play();
    textSize(50);
    text("RIGHT WINS",275,300);
  }
}

void gameoverClicks () {
    if (mouseX > 0 && mouseX < 800 && mouseY > 0 && mouseY < 600)
    mode = INTRO;
    lscore = 0;
    rscore = 0;
}
