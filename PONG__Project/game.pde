void game () {
  background(0);
  
  //draw paddles
  circle(leftx, lefty, leftd);
  circle(rightx, righty, rightd);
  
  //move paddles
  if (wkey == true) lefty = lefty -5;
  if (skey == true) lefty = lefty +5;
  
  //ball
  circle(ballx, bally, balld);
}

void gameClicks () {
}
