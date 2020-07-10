import processing.video.*;

//PImage img;
Capture img;

void captureEvent(Capture img) {
  img.read();
}

void setup() {
  size(570,470);
  fill(255);
  noStroke();
  smooth();
  
  //img = loadImage("face.jpg");
  
  String[] cameras = Capture.list();
  img = new Capture(this, width, height, cameras[0]);
  //img = new Capture(this, width, height, "FaceTime HD Camera (Built-in)");
  img.start();
}

void draw() {
  background(0);
  scale(-1.0,1.0);
  
  //img.start();
  image(img, 0, 0, width, height);
  
  //float coarseness = map(mouseX, 0, width, 0, 3);
  float coarseness = mouseX/20;
  float exposure = mouseY/20;
  float contrast = exposure;
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      int loc = x + y*img.width;
      float brightness = brightness(img.pixels[loc]); 
      float size = map(brightness, 0, 255, 0, exposure);
      if (x % coarseness == 0 && y % coarseness == 0) {
        ellipse(x, y, size*1, size*1);
      }
    }
  }
}
