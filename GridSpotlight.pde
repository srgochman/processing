float step=20;

void setup() {
  size(500, 500);
  colorMode(HSB, 100);
  noStroke();
}

void draw() {
  background(0);
  float c1x=mouseX;
  float c1y=mouseY;
  float c1r=50;
  float r=5;
  for (int x=10; x<width; x+=step) {
    for (int y=10; y<width; y+=step) {
      if (collision(c1x, c1y, c1r, x, y, r)) {
        fill(20);
        ellipse(x, y, 12, 12);
        fill(100);
      } else {
        fill(30);
      }
      ellipse(x, y, 5, 5);
    }
  }
}

boolean collision(float c1x, float c1y, float c1r, float x, float y, float r) {
  float distX = c1x - x;
  float distY = c1y - y;
  float dist = sqrt(distX*distX + distY*distY);
  if (dist <= c1r+r) {
    return true;
  } else {
    return false;
  }
}
