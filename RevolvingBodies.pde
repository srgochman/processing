Body body1;
Body body2;
Body body3;

void setup() {
  size(800,800);
  translate(width/2, height/2);
  colorMode(HSB, 100);
  background(0);  
  noStroke();
  //float[] bodyList = new float[100];
  body1 = new Body(200, 0, 60, 0, -14, 800); //(x, y, hue, vx, vy, mass)
  body2 = new Body(100, 0, 40, 0, -7, 100);
  body3 = new Body(50, 0, 20, 0, -3.5, 12.5);
}

void draw() {
  translate(width/2, height/2);
  background(0);
  stroke(0, 0, 100);
  noFill();
  line(200, -height/2, 200, height/2);
  line(-200, -height/2, -200, height/2);
  line(-width/2, -200, width/2, -200);
  line(-width/2, 200, width/2, 200);
  ellipse(0,0,200,200);
  ellipse(0,0,400,400);
  //for object in body list:
  body1.step();
  body2.step();
  body3.step();
  body1.display();
  body2.display();
  body3.display();
}

class Body {
  float radius = 6;
  float G = 50;
  float x, y, vx, vy, r, a, ax, ay, mass, hue;
  
  Body(float xTemp, float yTemp, float hueTemp, float vxTemp, float vyTemp, float massTemp) {
    x = xTemp;
    y = yTemp;
    vx = vxTemp;
    //vy = vyTemp;  //trial&error (first G, x or r, vy) for perfect circle --> synth. equation for vy
    //vx = ;  //depends on x (distance from origin), r (later)
    vy = x/14;
    mass = massTemp; //12.5*pow(2.71828, 0.0208*x);
    hue = hueTemp;
  }
  
  void step() {
    //update position
    x += vx;
    y += vy;
    
    //compute acceleration
    r = sqrt(x*x + y*y);
    a = (G * mass) / (r*r);
    ax = a * (0-x) / r;
    ay = a * (0-y) / r;
    
    //update velocity
    vx += ax;
    vy += ay;
  }
  
  void display() {
    noStroke();
    fill(hue, 80, 100, 60);
    ellipse(x, y, radius+6, radius+6);
    fill(hue, 30, 100, 100);
    ellipse(x, y, radius, radius);
  }
}
