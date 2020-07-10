Point[] points;
//float theta=0;
//float speed=0.2;

void setup(){
  size(800,800);
  translate(width/2, height/2);
  background(0);
  colorMode(HSB,100);
  fill(100);
  stroke(100);
  strokeWeight(2);
  
  points = new Point[18];
  for(int i=0; i<points.length; i++){
    points[i] = new Point(i*20, 0, 0, 0.2);
    //points[i].display();
    //if(i!=0){
    //  line(points[i-1].x, points[i-1].y, points[i].x, points[i].y);
    //}
  }
}

void draw(){
  background(0);
  translate(width/2, height/2);
  //rotate(-radians(theta));
  //theta += speed;
  for(int i=0; i<points.length; i++){
    points[i].step();
    points[i].display();

    // IT DRAWS LINES AT START AND THEN ONLY MOVES THEM WITH CURRENT POINT
    if(i!=0){
      line(points[i-1].x, points[i-1].y, points[i].x, points[i].y);
    }
  }
  //for(int i=0; i<points.length; i++){
    //line(points[1].x, points[1].y, points[2].x, points[2].y);
    //if(i!=0){
    //  line(points[i-1].x, points[i-1].y, points[i].x, points[i].y);
    //}
  //}
  return;
}

class Point{
  float x, y, theta, speed, screenX, screenY, sx, sy;
  Point(float xTemp, float yTemp, float thetaTemp, float speedTemp){
    x = xTemp;
    y = yTemp;
    theta = thetaTemp;
    speed = speedTemp;
    //screenX = screenX(x,y);
    //screenY = screenY(x,y);
  }
  
  void step(){
    rotate(-radians(theta));
    theta += speed;
    //translate(x*cos(theta), x*sin(theta));
    //sx = 
  }
  
  void display(){
    ellipse(x, y, 8, 8);
  }
}
