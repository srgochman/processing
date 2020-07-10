import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;

float x1, y1, x2, y2;
PostFX fx;

void setup() {
  size (700,700,P2D);
  background(0);
  stroke(255,255,255);
  strokeWeight(3);
  //x1 = x2 - 700;
  y1 = height;
  //x2 = 0;
  y2 = 350;
  fx = new PostFX(this);
}

void draw() {
  background(0);
  translate(-800,0);
  x1 = -500;
  x2 = mouseX + 125;
  for (int i=0; i<200; i+=1) {
    line(x1, y1, x2, y2);
    x1 += 50;
    //y1 = ;
    x2 += 20;
    //y2 = ;
  }
  fx.render()
    .bloom(0.5, 20, 30)
    .compose();
}
