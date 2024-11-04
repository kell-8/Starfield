Particle [] multi = new Particle[200];

void setup() {
  size(600, 600);
  background(0);
  frameRate(30);
  for (int i = 0; i < multi.length; i++){
    multi[i] = new OddballParticle();
  }
  for (int i = 5; i<multi.length; i++) {
    multi[i] = new Particle();
  }
}
void draw() {
  background(0);
  for (int i = 0; i < multi.length; i++) {
    multi[i].show();
    multi[i].move();
    multi[i].reset();
  }
}

class Particle {
  double myX, myY, myAngle, mySpeed, mySize;
  int colour, size;

  Particle() {
    myX = (int)(Math.random()*50)+270;
    myY = (int)(Math.random()*50)+270;
    myAngle = Math.random()*100;
    mySpeed = (Math.random()*10)+1;
    mySize = (float)(Math.random()*17)+5;
  }

  void move() {
    myX = myX + Math.cos(myAngle) * mySpeed;
    myY = myY + Math.sin(myAngle)* mySpeed;
  }

  void show() {
    stroke(1);
    fill((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    float size = (float)mySize;
    ellipse((float)myX, (float)myY, size, size);
  }


  void reset() {
    if (myX > 630 || myY > 630 || myX < 0 || myY < 0) {
      myX = (int)(Math.random()*50)+270;
      myY = (int)(Math.random()*50)+270;
      myAngle = Math.random()*100;
      mySpeed = (Math.random()*10)+1;
      mySize = (float)(Math.random()*17)+5;
    }
  }
}

class OddballParticle extends Particle { //inherits from Particle
  OddballParticle() {
    myX = (int)(Math.random()*100)+100;
    myY = (int)(Math.random()*100)+100;
    myAngle = Math.random()*100;
    mySpeed = (Math.random()*30)+1;
  }

  void show() {
    fill(255);
    noStroke();
    triangle((float)myX-10, (float)myY, (float)myX+10, (float)myY, (float)myX, (float)myY-20);
    triangle((float)myX-10, (float)myY, (float)myX+10, (float)myY, (float)myX, (float)myY+20);
    triangle((float)myX, (float)myY+10, (float)myX, (float)myY-10, (float)myX-20, (float)myY);
    triangle((float)myX, (float)myY+10, (float)myX, (float)myY-10, (float)myX+20, (float)myY);
  }

  void move() {
    myX = myX + Math.cos(myAngle) * (mySpeed/2);
    myY = myY + Math.sin(myAngle)* (mySpeed/2);
  }

  void reset() {
    if (myX > 500 || myY > 500 || myX < 100 || myY < 100) {
      myX = (int)(Math.random()*50)+400;
      myY = (int)(Math.random()*50)+100;
      myAngle = Math.random()*100;
      mySpeed = (Math.random()*30)+1;
      mySize = (float)(Math.random()*17)+5;
    }
  }
}

