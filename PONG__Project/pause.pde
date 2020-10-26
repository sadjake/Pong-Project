void pause () {
  fill(0);
  text("paused", 330, 350);
}

void pauseClicks () {
  if (dist(mouseX, mouseY, 100, 100) < 50) {
    mode = GAME;
  }
}
