void game () {
  background(0);

  //draw paddles
  circle(leftx, lefty, leftd);
  circle(rightx, righty, rightd);

  //move paddles
  if (wkey == true) lefty = lefty -5;
  if (skey == true) lefty = lefty +5;
  if (upkey == true) righty = righty -5;
  if (downkey == true) righty = righty +5;

  // DISPLAY BALL
  strokeWeight(5);
  fill(255);
  circle(ballx, bally, balld);

  ballx = ballx + vx;
  bally = bally + vy;

  // BOUNCING
  if (bally < balld/2 || bally > height-balld/2) {
    vy = vy * -1;
  }

  // POINTS SCORED
  if (ballx < -balld) {
    rscore++;
    ballx = width/2;
    bally = height/2;
    vx = 2 * cos(a);
    vy = 2 * sin(a);
  }

  if (ballx > width+balld) {
    lscore++;
    ballx = width/2;
    bally = height/2;
    vx = 2 * cos(a);
    vy = 2 * sin(a);
  }

  // SCORE

  // COLLISION
  // left paddle
  if (dist(leftx, lefty, ballx, bally) < leftd/2 + balld/2) {
    vx = (ballx-leftx)/20;
    vy = (bally-lefty)/20;
  }

  // right paddle
  if (dist(rightx, righty, ballx, bally) < rightd/2 + balld/2) {
    vx = (ballx-rightx)/20;
    vy = (bally-righty)/20;
  }
}

void gameClicks () {
}
