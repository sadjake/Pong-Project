import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// PONG! Project
// Jake Choi
// October 15, 2020

//mode framework
int mode;
int rscore;
int lscore;
int timer;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

//entity variables
boolean AI;
boolean ballup;
boolean balldown;

//paddles
float leftx, lefty, leftd, rightx, righty, rightd; 
//ball 
float ballx, bally, balld;
float vx, vy;
float a;

//keyboard variables
boolean wkey, skey, upkey, downkey;

//font
PFont mentality;

//image
PImage volleyball;

// sound varibales
Minim minim;
AudioPlayer intro, wall, score, rightpaddle, leftpaddle, clapping;

void setup() {
  size(800, 600);
  volleyball = loadImage("volleyball.jpg");
  mentality = createFont("Mentality.ttf",200);
  mode = INTRO;

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
  balld = 40;

  vx = random(-5, 8);
  vy = random(-5, 8);
  a = radians(45);
  
  //minim
  minim = new Minim(this);
  intro = minim.loadFile("intro.wav");
  clapping = minim.loadFile("clapping.wav");
  leftpaddle = minim.loadFile("leftpaddle.wav");
  rightpaddle = minim.loadFile("rightpaddle.wav");
  score = minim.loadFile("score.wav");
  wall = minim.loadFile("wall.wav");
  

  //initialize keyboard variables
  wkey = skey = upkey = downkey = false;
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode error: " + mode);
  }
}
