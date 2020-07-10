float zoff = 0.0;

void setup() {
  size(500,500);
  //frameRate(30);
}
void draw() {
  loadPixels();
  float xoff = 0.0;
  for (int x = 0; x < width; x++) {
    float yoff = 0.0;
    for (int y = 0; y < height; y++) {
      float brightness = map(noise(xoff,yoff,zoff), 0, 1, 0, 255);
      pixels[x+y*width] = color(brightness);
      yoff += 0.01;
    }
    xoff += 0.01;
  }
  zoff += 0.01;
  updatePixels();
}





//float xoff = 0.0;
//void draw() {
//  background(204);
//  xoff = xoff + .01;
//  float n = noise(xoff) * width;
//  line(n, 0, n, height);
//}




//float noiseScale = 0.02;
//void setup() {
//  size(500,500);
//}
//void draw() {
//  background(0);
//  for (int x=0; x < width; x++) {
//    float noiseVal = noise((mouseX+x)*noiseScale, mouseY*noiseScale);
//    stroke(noiseVal*255);
//    line(x, mouseY+noiseVal*80, x, height);
//  }
//}
