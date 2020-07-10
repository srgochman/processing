float radius = 80;
color a, b;
float spikeFactor;
boolean spike = false;
float frame = 0;
float[] T;

void setup() {
  size(500,500);
  ellipseMode(RADIUS);
  frameRate(11);
  colorMode(HSB, 100);  //oddly, the gradient transitions through hues if in HSB mode
  a = color(70, 0, 100);
  b = color(70, 80, 100);
  //a = color(255, 255, 255);
  //b = color(30, 100, 255);
  
  //creates an array of starting lengths for the rays
  T = new float[360];  //T SHOULD BE AN ARRAY OF PERLIN ARRAYS.
  for(int d=0; d<T.length; d++) {
    T[d] = noise(d);  //irregularity of rays
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  frame += 1;
  
  for(int d=0; d<360; d++) {
    //rotate canvas to make radial arrangement
    rotate(radians(1));
    
    //spike occasionally
    int rand = int(random(360));
    if(d==rand && frame%int(random(0,40))==0) {
      spikeFactor = 5;
      spike = true;
    } else {
      spikeFactor = 1;
      spike = false;
    }
    
    //drawRay()
    float x = T[d] * 25;  //EACH ARRAY[ELEMENT]; T[d[t]]
    gradientLine(radius, 0, radius + x*spikeFactor/*+y*/, 0, a, b);
  }
  
  //animation of (adjusts) each ray for draw cycle
  for(int d=0; d<T.length; d++) {  //EACH ARRAY[ELEMENT] +=1 EACH DRAW CYCLE
    T[d] += random(-0.05,0.05);
  }
  fill(0);
  noStroke();
  ellipse(0, 0, radius, radius);
}

void gradientLine(float x1, float y1, float x2, float y2, color a, color b) {
  float deltaX = x2-x1;
  float deltaY = y2-y1;
  float tStep = 1.0/dist(x1, y1, x2, y2);
  for (float t = 0.0; t < 1.0; t += tStep) {
    fill(lerpColor(a, b, t));
    if(spike) {
      ellipse(x1+t*deltaX, y1+t*deltaY, 4-3*t, 4-3*t);
    } else {
      ellipse(x1+t*deltaX, y1+t*deltaY, 1, 1); //stkW is effective line stroke weight
    }
  }
}
