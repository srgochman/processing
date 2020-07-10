color c;
Shrinks[] shrinks;

void setup(){
  size(500,500);
  background(255);
  strokeWeight(2);
  stroke(255);
  //noStroke();
  shrinks = new Shrinks[0];
}

class Shrinks{
  float t=random(100000);
  float T=t;
  float mult=400;
  float radius=30;
  float i=0;
  color c = color(int(random(255)), int(random(255)), int(random(255)));
  Shrinks(){}
  void display(){
    while (radius>2) {
      fill(c);
      ellipse(i, mult*noise(t)-mult*noise(T), radius, radius);
      radius-=1;
      i+=radius/2;    //x distance between dots within a trail
      t+=0.03;       //y motion within a trail
    }
  }
}

void mousePressed(){
  Shrinks s = new Shrinks();
  shrinks = (Shrinks[]) append(shrinks, s);
}

void draw(){
  translate(mouseX, mouseY);
  for(int n=0; n<shrinks.length; n++){
    shrinks[n].display();
  }
}
