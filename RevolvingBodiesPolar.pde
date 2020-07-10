import java.util.Random;
Random generator;
Body[] bodyList;
Body[] band;
float t = 0;

void setup() {
  size(800,800);
  translate(width/2, height/2);
  colorMode(HSB, 100);
  background(0);  
  noStroke();
  
  color[] bodyColorList = {50, 60, 68};
  bodyList = new Body[250];
  for(int i=0; i<bodyList.length; i++) {
    bodyList[i] = new Body(random(360), random(0.5,1.2), random(-10,10), random(-10,10), random(3,7), bodyColorList[i%bodyColorList.length], 50, 250);
  }
  
  color[] bandColorList = {50, 60, 68};
  band = new Body[180];
  for(int i=0; i<band.length; i++) {
    band[i] = new Body(i*2, 1, 0, 0, random(3,7), bandColorList[i%bandColorList.length], 8, noise(t)*250+100);
    t += random(0.005,0.05);
  }
}

void draw() {
  translate(width/2, height/2);
  background(0);
  stroke(0, 0, 100);
  
  for(int i=0; i<bodyList.length; i++) {
    bodyList[i].display();
  }
  for(int i=0; i<band.length; i++) {
    band[i].display();
  }
}

class Body {
  float r, theta, speed, shiftx, shifty, radius, hue, sd, mean;
  
  Body(float thetaTemp, float speedTemp, float shiftxTemp, float shiftyTemp, float radiusTemp, float hueTemp, float sdTemp, float meanTemp) {
    generator = new Random();
    float num = (float) generator.nextGaussian();
    sd = sdTemp;  //normal distribution width of bodies
    mean = meanTemp;  //mean of normal distribution of bodies
    r = sd*num+mean;  //distance of body from origin
    theta = thetaTemp;  //starting angle of body in relation to x-axis
    speed = speedTemp;  //rotational speed of body; speed value has same # revolutions per time regardless of r
    shiftx = shiftxTemp;  //use with push pop to shift origin for body
    shifty = shiftyTemp;
    radius = radiusTemp;  //radius of body object
    hue = hueTemp;  //color of body 
  }
  
  void display() {
    pushMatrix();
    translate(shiftx, shifty);
    rotate(-radians(theta));
    noStroke();
    fill(hue, 80, 100, 30);
    ellipse(r, 0, 3*radius, 3*radius);
    fill(hue, 80, 100, 30);
    ellipse(r, 0, 2*radius, 2*radius);
    fill(hue, 30, 100, 100);
    ellipse(r, 0, radius, radius);
    theta += speed;
    popMatrix();
  }
}
