// Draws a solid background with hue controlled by x location of average point
// grab and drag shape

import org.openkinect.freenect.*;
import org.openkinect.processing.*;

// The kinect stuff is happening in another class
KinectTracker tracker;
Kinect kinect;
ParticleSystem ps;

float ballX = 320;
float ballY = 260;
float ballD = 40;

void setup() {
  size(640, 520);
  colorMode(HSB, 100);
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  ps = new ParticleSystem(new PVector(640/2, 520/2));
}

void draw() {
  background(0);
  
  // Run the tracking analysis
  tracker.track();
  // Show the image
  tracker.display();

  // Let's draw the raw location
  PVector average = tracker.getPos();
  fill(0, 0, 100);
  noStroke();
  //ellipse(average.x, average.y, 20, 20);
  
  drawBall(average);
}

void drawBall(PVector pointer) {
  if (pointer.x < ballX+ballD && pointer.x > ballX-ballD && pointer.y < ballY+ballD && pointer.y > ballY-ballD) {
    // create offsetX and offsetY to adjust ballX and ballY according to the way pointer and ball collide
    //float distance = dist(pointer.x, pointer.y, ballX, ballY);
    //float offsetX = pointer.x-ballX;
    //float offsetY = pointer.y-ballY;
    ballX = pointer.x;
    ballY = pointer.y;
    ps.addParticle(pointer);
    ps.run();
  } else {
    fill(0,0,100);
    ellipse(ballX, ballY, ballD, ballD);
  }
}






// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
  }

  void addParticle(PVector pointer) {
    particles.add(new Particle(pointer));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}


// A simple Particle class

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = l.copy();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    stroke(100, lifespan);
    fill(100, lifespan);
    ellipse(position.x, position.y, 8, 8);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}




// Daniel Shiffman
// Tracking the average location beyond a given depth threshold
// Thanks to Dan O'Sullivan

// https://github.com/shiffman/OpenKinect-for-Processing
// http://shiffman.net/p5/kinect/

class KinectTracker {

  // Depth thresholds
  int frontThreshold = 745;
  int backThreshold = 1000;

  // Raw location
  PVector loc;

  // Interpolated location
  PVector lerpedLoc;

  // Depth data
  int[] depth;
  
  // What we'll show the user
  PImage display;
   
  KinectTracker() {
    // This is an awkard use of a global variable here
    // But doing it this way for simplicity
    kinect.initDepth();
    kinect.enableMirror(true);
    // Make a blank image
    display = createImage(kinect.width, kinect.height, HSB);
    // Set up the vectors
    loc = new PVector(0, 0);
    lerpedLoc = new PVector(0, 0);
  }

  void track() {
    // Get the raw depth as array of integers
    depth = kinect.getRawDepth();

    // Being overly cautious here
    if (depth == null) return;

    float sumX = 0;
    float sumY = 0;
    float count = 0;

    for (int x = 0; x < kinect.width; x++) {
      for (int y = 0; y < kinect.height; y++) {
        
        int offset =  x + y*kinect.width;
        // Grabbing the raw depth
        int rawDepth = depth[offset];

        // Testing against threshold
        if (rawDepth < frontThreshold) {
          sumX += x;
          sumY += y;
          count++;
        }
      }
    }
    // As long as we found something
    if (count != 0) {
      loc = new PVector(sumX/count, sumY/count);
    }

    // Interpolating the location, doing it arbitrarily for now
    lerpedLoc.x = PApplet.lerp(lerpedLoc.x, loc.x, 0.3f);
    lerpedLoc.y = PApplet.lerp(lerpedLoc.y, loc.y, 0.3f);
  }

  PVector getLerpedPos() {
    return lerpedLoc;
  }

  PVector getPos() {
    return loc;
  }

  void display() {
    PImage img = kinect.getDepthImage();

    // Being overly cautious here
    if (depth == null || img == null) return;

    // Going to rewrite the depth image to show which pixels are in threshold
    // A lot of this is redundant, but this is just for demonstration purposes
    display.loadPixels();
    for (int x = 0; x < kinect.width; x++) {
      for (int y = 0; y < kinect.height; y++) {

        int offset = x + y * kinect.width;
        // Raw depth
        int rawDepth = depth[offset];
        int pix = x + y * display.width;
        if (rawDepth < frontThreshold) {
          // Map to color based on depth instead
          int depthColor = int(map(rawDepth, frontThreshold, 0, 0, 100));
          display.pixels[pix] = color(depthColor, 80, 80);
          //display.pixels[pix] = color(60, 30, 100);
        } else if (rawDepth < backThreshold) {
          display.pixels[pix] = img.pixels[offset];
        } else {
          display.pixels[pix] = color(0);
        }
      }
    }
    display.updatePixels();

    // Draw the image
    image(display, 0, 0);
  }

  int getThreshold() {
    return frontThreshold;
  }

  void setThreshold(int t) {
    frontThreshold =  t;
  }
}
