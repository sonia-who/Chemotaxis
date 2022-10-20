// Walker bob;
Walker[] slowpokes = new Walker[150];
PImage insideout;

float x;
float y;
float easing = 0.009;

boolean mouseClicked = false;
boolean keyPress = false;

void setup() {
  size(500, 500);
  // bob = new Walker();
  
  int i = 0;
  while (i < 150) {
    slowpokes[i] = new Walker((int)(Math.random() * 500), (int)(Math.random()*500));
    i++;
  }
  
  insideout = loadImage("insideout");
}

void draw() {
  background(0);
  //bob.show();
  //bob.walk();
  
  // image(insideout, 250, 250);
  
  for (int i = 0; i < 150; i++) {
    slowpokes[i].show();
    slowpokes[i].walk();
    if (mouseClicked == true) {
      slowpokes[i].dance();
    } else if (keyPress == true) {
      slowpokes[i].stopDance();
    }
  }    
}

void mouseClicked() {
  mouseClicked = true;
}

void keyPressed() {
  keyPress = true;
}

class Walker {
  int myX, myY, myColor;
  Walker(int x, int y) {
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
    int randomSize = (int)(Math.random() * 10);
    fill(myColor);
    ellipse(myX, myY, randomSize, randomSize);
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
