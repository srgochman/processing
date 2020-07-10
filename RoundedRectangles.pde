Geo[] geos;
float r = 0;
float speed = 0.004;
float inc = TWO_PI*speed;
float wobble = 3.15;
float T = 3;

void setup(){
  size(600,600);
  colorMode(HSB,100);
  //stroke(100);
  noFill();
  rectMode(CENTER);
  geos = new Geo[10];
  for(int i=0; i<geos.length; i++){
    geos[i] = new Geo(i*40+15, 0, i*T, i+45);
  }
}

void draw(){
  background(0);
  translate(width/2, height/2);
  for(int i=0; i<geos.length; i++){
    pushMatrix();
    geos[i].step();
    geos[i].display();
    popMatrix();
  }
  r -= inc;
}

class Geo{
  float radius, round, t, c;
  Geo(float radiusTemp, float roundTemp, float tTemp, float cTemp){
    radius = radiusTemp;
    round = roundTemp;
    t = tTemp;
    c = cTemp;
  }
  
  void step(){
    rotate(sin(r-radians(t))*wobble);        //whole rotation (r) offset by each t    
    //round = (sin(r*radius/100/*+t*/)+1)*31.5;                              //t should dictate round and rotation
    float a = radius/4;
    round = a*sin(r-t/a)+a;
  }

  void display(){
    strokeWeight(12);
    stroke(c, 90, 90, 30);
    rect(0, 0, radius, radius, round);
    strokeWeight(7);
    stroke(c, 90, 90, 40);
    rect(0, 0, radius, radius, round);
    strokeWeight(2);
    stroke(c, 90, 90, 100);
    rect(0, 0, radius, radius, round);       //, rounding());
  }
  
  //float rounding(){
  //  return ;
  //}
}
