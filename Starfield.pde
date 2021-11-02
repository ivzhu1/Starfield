Spinner[] bob;
Particle[] wow;
boolean spin = true;
boolean trail = true;
void setup() {
  size(500, 500);
  bob = new Spinner[2];
  for (int i = 0; i < bob.length; i++)
    bob[i] = new Spinner(i);
  wow = new Particle[100];
  for (int i = 0; i < 5; i++)
    wow[i] = new Oddball();
  for (int i = 5; i < wow.length; i++)
    wow[i] = new Particle();
  frameRate(160);
}
void draw() {
  if (trail == true)
    fill(52, 21, 130, 30);
  else 
    fill(52, 21, 130);
  rect(0, 0, 500, 500);
  if (spin == true) {
    for (int i = 0; i < bob.length; i++) {
      noStroke();
      bob[i].move();
      bob[i].show();
      bob[i].angle += .01;
    }
  } else {
    for (int i = 0; i < wow.length; i++) {
      noStroke();
      wow[i].move();
      wow[i].show();
    }
  }
  if (dist((float)bob[0].x, (float)bob[0].y, (float)bob[1].x, (float)bob[1].y) < .5)
    spin = false;
}
void mousePressed() {
  fill(52, 21, 130);
  rect(0, 0, 500, 500);
  for (int i = 0; i < bob.length; i++)
    bob[i] = new Spinner(i);
  for (int i = 0; i < 5; i++)
    wow[i] = new Oddball();
  for (int i = 5; i < wow.length; i++)
    wow[i] = new Particle();
  spin = true;
}
void keyPressed() {
  if (trail == false) {
    fill(52, 21, 130, 30);
    trail = true;
  } else {
    fill(52, 21, 130);
    trail = false;
  }
  rect(0, 0, 500, 500);
}
class Spinner {
  int myColor;
  double angle, x, y, dist;
  Spinner(int a) {
    x = 250;
    y = 250;
    myColor = color(189, 203, 255);
    angle = a*PI;
    dist = 200;
  }
  void move() {
    x = 250 + Math.cos(angle)*dist;
    y = 250 + Math.sin(angle)*dist;
    angle = angle + 2*PI/180;
    dist -= .1;
  }
  void show() {
    fill(myColor);
    ellipse((float)x, (float)y, 15, 15);
  }
}
class Particle {
  int myColor, size;
  double angle, speed, x, y;
  Particle() {
    x = y = 250;
    myColor = color((int)(Math.random()*70+145), (int)(Math.random()*190+10), 255);
    angle = Math.random()*2*PI;
    speed = Math.random()*7+.1;
    size = 10;
  }
  void move() {
    x = x + Math.cos(angle)*speed;
    y = y + Math.sin(angle)*speed;
  }
  void show() {
    fill(myColor);
    ellipse((float)x, (float)y, size, size);
  }
}
class Oddball extends Particle {
  Oddball() {
    x = y = 250;
    myColor = color(92, 168, 255);
    angle = Math.random()*2*PI;
    speed = Math.random()/1.5+.1;
    size = 20;
  }
}
