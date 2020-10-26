void game () {
  //background
  background(#7E531D);
  fill(255);
  stroke(255);
  line(400, 0, 400, 600);
  line(200, 0, 200, 600);
  line(600, 0, 600, 600);

  //scoreboard 
  textSize(50);
  fill(255);
  text("" + lscore, 210, 100);
  fill(0);
  text("" + rscore, 560, 100);
  timer = timer -1;

  //draw paddles
  circle(leftx, lefty, leftd);
  circle(rightx, righty, rightd);

  //move paddles
  if (wkey == true) lefty = lefty -5;
  if (skey == true) lefty = lefty +5;

  if (AI == false) {
    if (upkey == true) righty = righty -5;
    if (downkey == true) righty = righty +5;
  } 
  if (AI == true) {
    if (righty - balld > bally) {
      balldown = true;
      ballup = false;
    } else if (righty + balld < bally) {
      balldown = false;
      ballup = true;
    } else {
      balldown = false;
      ballup = false;
    }
  }

  if (balldown == true) {
    righty = righty - 5;
  } else if (ballup == true) {
    righty = righty + 5;
  }

  // DISPLAY BALL
  strokeWeight(5);
  fill(255);
  circle(ballx, bally, balld);

  // PAUSE BUTTON
  if (dist(100, 100, mouseX, mouseY)<50) {
  stroke(255);
  fill(255);
  circle(100, 100, 100);
  fill(0);
  text("||", 86, 119);
  } else {
  stroke(0);
  fill(255);
  circle(100, 100, 100);
  fill(0);
  text("||", 86, 119);
  }

  //move ball
  if (timer < 0) {
    ballx = ballx + vx;
    bally = bally + vy;
  }

  // BOUNCING
  if (bally < balld/2 || bally > height-balld/2) {
    wall.rewind();
    wall.play();
    vy = vy * -1;
  }

  //limiting the paddle
  if (lefty < leftd/2) {
    lefty = leftd/2;
  }
  if (righty < rightd/2) {
    righty = rightd/2;
  }
  if (lefty > 500) {
    lefty = 500;
  }
  if (righty > 500) {
    righty = 500;
  }

  // POINTS SCORED
  if (ballx < -balld) {
    rscore++;
    ballx = width/2;
    bally = height/2;
    vx = -2 * cos(a);
    vy = -2 * sin(a);
    timer = 100;
    score.rewind();
    score.play();
  }

  if (ballx > width+balld) {
    lscore++;
    ballx = width/2;
    bally = height/2;
    vx = 2 * cos(a);
    vy = 2 * sin(a);
    timer = 100;
    score.rewind();
    score.play();
  }

  if (lscore == 3 || rscore == 3) {
    mode = GAMEOVER;
  }

  // COLLISION
  // left paddle
  if (dist(leftx, lefty, ballx, bally) < leftd/2 + balld/2) {
    leftpaddle.rewind();
    leftpaddle.play();
    vx = (ballx-leftx)/20;
    vy = (bally-lefty)/20;
  }

  // right paddle
  if (dist(rightx, righty, ballx, bally) < rightd/2 + balld/2) {
    rightpaddle.rewind();
    rightpaddle.play();
    vx = (ballx-rightx)/20;
    vy = (bally-righty)/20;
  }
}

void gameClicks () {
  if (dist(mouseX, mouseY, 100, 100) < 50) {
    mode = PAUSE;
  }
}
