void setup() {
  size(700, 700);
  colorMode(HSB, 100);
  //blendMode(ADD);
  background(100);
  strokeWeight(2);
  stroke(60, 70, 70, 20);
  noFill();
}

float t = random(100);
float count = 0;

void draw() {
  //background(100);

  if (count % 5 == 0) {
    for (int x=0; x < width; x += 1) {
      point(x, noise(t) * 300 - 150 + mouseY);
      t += 0.005;
    }
  }
  count++;
}
