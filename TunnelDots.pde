void setup() {
  size(800,800);
  colorMode(HSB,100);
  background(0);
  fill(100);
  noStroke();
  float radius = 3;
  float x = 80;
  float t = 0;
  
  translate(width/2, height/2);
  
  // draw 3 rings
  for (int n=2; n<=4; n++) {
    
    // draw 1 ring
    for (int deg=0; deg<360; deg++){
      float c = map(x, 0, width/2, 10, 100);
      fill(c, 50, 100);
      x = 15*n*n + 2*n*noise(t)*15;
      ellipse(x, 0, radius, radius);
      rotate(radians(1));
      t += 0.3;
    }
    radius += 3;
  }
}
