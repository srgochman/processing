float x, y, tx, ty, resolution, rad, tr, tChange, nVal, nInt, nAmp, i, j;

void setup() {
  size(800,800);
  colorMode(HSB, 800);
  background(0);
  fill(0);
  //noFill();
  strokeWeight(1);
  
  tx = 0;
  ty = 1000;
  tr = 0;
  
  resolution = 260; // how many points in the circle
  rad = 150;
  nInt = 0.3;
  nAmp = 0.2;
  noiseDetail(4);
}

void draw() {
  stroke(x, 500, 700);
  x = map(noise(tx), 0, 1, 0, width);
  y = map(noise(ty), 0, 1, 0, height);
  tx += 0.002;
  ty += 0.002;
  
  translate(x, y);
  beginShape();
  for (float a=0; a<=TWO_PI; a+=TWO_PI/resolution) {
    nVal = 2*map(noise( cos(a)*nInt+1, sin(a)*nInt+1, tr ), 0.0, 1.0, nAmp, 1.0); // map noise value to match the amplitude
    i = cos(a)*rad *nVal;
    j = sin(a)*rad *nVal;
    vertex(i, j);
  }
  endShape(CLOSE);
  tr += 0.01;
}
