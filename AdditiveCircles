import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;

float shakeMag;
float d = 200;
float f, a;
PVector mouse, origin, ray;
PostFX fx;

import processing.sound.*;
Pulse pulse;
WhiteNoise noise;
LowPass lowPass;

float amp=0.0;


void setup() {
  size(700,700, P2D);
  //fullScreen();
  colorMode(HSB,100);
  blendMode(ADD);
  background(0);
  strokeWeight(20);
  noFill();
  fx = new PostFX(this);
  pulse = new Pulse(this);
}

void draw() {
  background(0);
  mouse = new PVector(mouseX, mouseY);
  origin = new PVector(width/2, height/2);
  mouse.sub(origin);
  //mouse.mult(-0.05);
  
  float distance = dist(0, 0, mouse.x, mouse.y);
  //shakeMag = 100/distance;
  if(distance < d / 2) {
    //shakeMag = 10;
    shakeMag = distance/5 - 10;
  } else {
    shakeMag = 1000/distance;
  }
  //println(shakeMag, distance);
  
  //put in if statement to ignore movement when near the center
  translate(width/2,height/2);
  //line(0, 0, mouse.x, mouse.y);

  stroke(20, 100, 100);
  //ellipse(random(-shakeMag, shakeMag) - mouse.x * 0.01, random(-shakeMag, shakeMag) - mouse.y * 0.01, d, d); 
  // relationship needs to be negative (other side) inverse (grow with decreasing distance)
  ellipse(-300/mouse.x, -300/mouse.y, d, d); 
  
  stroke(55, 100, 100);
  //ellipse(random(-shakeMag, shakeMag), random(-shakeMag, shakeMag), d, d);
  ellipse(300/mouse.x, 300/mouse.y, d, d);
  
  stroke(88, 100, 100);
  //ellipse(random(-shakeMag, shakeMag), random(-shakeMag, shakeMag), d, d); 
  ellipse(-500/mouse.x, -500/mouse.y, d, d); 
  
  fx.render().bloom(0.5, 20, 40).compose();
      
  f = shakeMag*10;
  a = map(shakeMag, 0, 50, 0, 1);
  pulse.freq(f);
  pulse.amp(a);
  pulse.play();
  
  // Create a noise generator and a bandpass filter
  //noise = new WhiteNoise(this);
  //lowPass = new LowPass(this);
  //noise.play();
  //lowPass.process(noise, 2000);
  
}
