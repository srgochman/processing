class Circle {
  int x;
  int y;
  float radius;
  int r;
  int g;
  int b;
  Circle() {
    radius = 1;
    strokeWeight(2);
    //stroke(155, 100, 100);
    noFill();
  }
  void display(int x, int y) {
    //stroke(255, 100, 100);
    stroke(255, g, b);
    ellipse(x, y, radius, radius);
  }
  void step() {
    radius += 15;
    r -= 10;
    g += 10;
    b += 10;
  }
}

Circle c;

void setup() {
  size(600, 600);
  background(255);
  c = new Circle();
  for(int i=0; i<30; i++){
    c.display(300,300);
    c.step();
  }
}
