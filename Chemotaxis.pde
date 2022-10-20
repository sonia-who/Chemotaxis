// Walker bob;
Bacteria[] slowpokes = new Bacteria[150];
PImage insideout;

float x;
float y;
float easing = 0.009;

boolean click = false;
boolean mouseMove = false;

void setup() {
  size(500, 281);
  // bob = new Walker();
  
  int i = 0;
  while (i < 100) {
    slowpokes[i] = new Bacteria((int)(Math.random() * 500), (int)(Math.random()*500));
    i++;
  }
  
  // insideout = loadImage("https://i.pinimg.com/originals/42/6f/a0/426fa06b58f4e25876e493b6469b27e2.png");
  insideout = loadImage("inside-out-rileys-headquarters.jpg");
}

void draw() {
  background(0);
  //bob.show();
  //bob.walk();
  image(insideout, 0, 0);

  
  
  
  for (int i = 0; i < 100; i++) {
    slowpokes[i].show();
    slowpokes[i].walk();
    if (click == true) {
      slowpokes[i].dance();
    } else if (mouseMove == true) {
      slowpokes[i].stopDance();
    }
  }    
}

void mouseClicked() {
  click = true;
}

/*
void mouseMoved() {
  mouseMove = true;
}
*/

class Bacteria {
  int myX, myY, myColor;
  Bacteria(int x, int y) {
    myX = x;
    myY = y;
    myColor = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
    // myX = myY = 250;
  }
  
  void walk() {
    myX = myX +(int)(Math.random()*7)-3;
    myY = myY +(int)(Math.random()*7)-3;
  
     
    float targetX = mouseX;
    float dx = targetX - myX;
    myX += dx * easing;
    
    float targetY = mouseY;
    float dy = targetY - myY;
    myY += dy * easing;
  }
  
  void show() {
    // int randomSize = (int)(Math.random() * 10);
    
    // filter(BLUR, .01);
    
    fill(myColor);
    ellipse(myX, myY, 20, 20);
  }
  
  void dance() {
    myX = myX + (int)(Math.random() * 20) - 10;
    myY = myY + (int)(Math.random() * 20) - 10;
  }
  
  void stopDance() {
    myX = myX - (int)(Math.random() * 20) - 10;
    myY = myY - (int)(Math.random() * 20) - 10;
  }
  
}
