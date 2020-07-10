//trying to make a circular arrangement of circles that rotates at the same rate as the whole thing revolves
float angle;
float circleRadius = 100;
float dotRadius = 15;

void setup(){
  size(600,600);
  ellipseMode(RADIUS);
  rectMode(CENTER);
  smooth();
}

void draw(){
  background(255);
  translate(width/2, height/2);  //center coordinate system
  //line(width/2, 0, -width/2, 0); //draws coordinate axes
  //line(0, height/2, 0, -height/2);
  noFill();
  //ellipse(0, 0, circleRadius, circleRadius);  //traces circular path of dot array
  
  drawPaths();
  
  //shape's revolution (rotates shape about screen origin)
  angle -= 1.5;
  rotate(radians(angle));
  
  //shape rotates around its own origin
  rotateShape();
}

//draw radial array of 8 dots
void drawShape(){
  fill(0);
  for(int i=0; i<8; i++){        
    ellipse(circleRadius, 0, dotRadius, dotRadius);
    line(0, 0, 0, -circleRadius);
    rotate(radians(45));
  }
}

//makes new coordinate system for shape to rotate around its center
void rotateShape(){
  pushMatrix();
  translate(circleRadius,0);  //distance from screen origin
  rotate(radians(-2*angle));  //rotates shape in opposite direction of shape's revolution
  drawShape();
  //ellipse(0, 0, dotRadius, dotRadius);  //draws dot at center of array
  popMatrix();
}

//draws paths of dots (static in background)
void drawPaths(){
  fill(255);
  pushMatrix();
  for(int i=0; i<8; i++){
    rotate(radians(22.5));  //rotates shape in opposite direction of shape's revolution
    //line(dotRadius, height/3, dotRadius, -height/3);
    //line(-dotRadius, height/3, -dotRadius, -height/3);
    //ellipse(0, height/3, dotRadius, dotRadius);
    //ellipse(0, -height/3, dotRadius, dotRadius);
    line(0, height/3, 0, -height/3);
    //line(dotRadius, circleRadius, dotRadius, -circleRadius);
    //line(-dotRadius, circleRadius, -dotRadius, -circleRadius);
  }
  popMatrix();
}
