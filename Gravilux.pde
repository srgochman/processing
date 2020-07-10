Mover[][] movers;
int rows = 100, cols = 100, cellsize = 7, count = 0;

void setup() {
  size(700,700);
  background(255);
  movers = new Mover[cols][rows];
  for (int a = 0; a < cols; a++) {
    for (int b = 0; b < rows; b++ ) {
      // Initialize each object in the array.
      movers[a][b] = new Mover(a*cellsize, b*cellsize);
    }
  }
}

void draw() {  
  if (count % 2 == 0) {
    background(255);
    stroke(0);
  } else {
    background(0);
    stroke(255);
  }
  
  for (int a = 0; a < cols; a++) {
    for (int b = 0; b < rows; b++ ) {
      //PVector target;
      //if (mousePressed){
      //  target = new PVector(mouseX,mouseY);
      //} 
      //else {
      //  target = movers[a][b].origin;
      //}
      movers[a][b].update();
      //movers[a][b].checkEdges();
      //movers[a][b].seek(target);
      //movers[a][b].arrive(target);
      movers[a][b].display();
    }
  }
  //PVector sum = new PVector();
  //if (count > 0) {
  //  sum.div(count);
  //  sum.normalize();
  //  sum.mult(this.maxspeed);
  //  PVector steer = PVector.sub(sum, vel);
  //  steer.limit(maxforce);
  //  applyForce(steer);
  //}
}

void keyPressed() {
  if (key == TAB) {
    count++;
  }
}

// there is a library to do this: 
// https://github.com/hapticdata/toxiclibsjs-examples/blob/master/src/javascripts/examples/attraction2d.pde



class Mover {

  PVector location, velocity, acceleration, origin;
  // The variable topspeed will limit the magnitude of velocity.
  float r, maxspeed, maxforce;

  Mover(int x, int y) {
    //place them in a grid with 2 for loops
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    origin = new PVector(x,y);
    r = 3.0;
    maxspeed = 100;
    maxforce = 0.1;
  }

  void update() {
    //PVector dir;
    // if mouse is pressed, points accelerate towards mouse
    //if (mousePressed){
    //  PVector mouse = new PVector(mouseX,mouseY);
      //dir = PVector.sub(mouse,location);
    //}
    // otherwise, points accelerate towards their origin points
    //else {
    //  dir = PVector.sub(this.origin,location);
    //}

    //dir.normalize();
    //dir.x = 1/dir.x;
    //dir.y = 1/dir.y;
    //dir.mult(0.5);
    //acceleration = dir;
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
    
    PVector target;
    if (mousePressed){
      target = new PVector(mouseX,mouseY);
    }
    else {
      target = origin;
    }
    
    PVector desired = PVector.sub(target,location);

    // The distance is the magnitude of
    // the vector pointing from
    // location to target.
    float d = desired.mag();
    desired.normalize();
    // If we are closer than 100 pixels...
    if (d < 100) {
      //[full] ...set the magnitude
      // according to how close we are.
      float m = map(d,0,100,0,maxspeed);
      desired.mult(m);
      //[end]
    } else {
      // Otherwise, proceed at maximum speed.
      desired.mult(maxspeed);
    }

    // The usual steering = desired - velocity
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  // Newton’s second law; we could divide by mass if we wanted.
  void applyForce(PVector force) {
    acceleration.add(force);
  }

  // Our seek steering force algorithm
  //void seek(PVector target) {
  //  PVector desired = PVector.sub(target,location);
  //  desired.normalize();
  //  desired.mult(maxspeed);
  //  PVector steer = PVector.sub(desired,velocity);
  //  steer.limit(maxforce);
  //  applyForce(steer);
  //}
  
  void display() {
    ellipse(location.x,location.y,2,2);
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
 
    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
  
  void arrive(PVector target) {
    
  }
}
