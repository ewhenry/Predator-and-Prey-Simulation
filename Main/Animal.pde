class Animal {
  float x, y;
  float heading;
  float sz;
  float tspeed, fspeed;
  float energy;
  boolean alive = true;
  float reproductionRate;
  World w;

  Animal(World w) {
    x = random(width);
    y = random(height);
    tspeed = 0.1;
    fspeed = 2;
    sz = 15;
    energy = 200;
    reproductionRate = 0.01;
    heading = random(2*PI);
    this.w = w;
  }

  // first job is to override this in child classes
  void display() {
      // draw this animal (relative to 0,0)
  }

  void show() {
    // show the animal
    if (alive) {
      pushMatrix();
      translate(x, y);
      rotate(heading);
      display();
      popMatrix();
    }
  }

  void step() {
    // advance animal's behavior by one tic in the simulation
    move();
    fence();
  }

  boolean shouldReproduce() {
    // determine whether this animal should reproduce
    return random(1) < reproductionRate;
  }

  void turn(float dRads) {
    // turn by dRads radians
    heading += dRads;
  }

  void forward(float amount) {
    // move forward by amount
    x += cos(heading) * amount;
    y += sin(heading) * amount;
  }

  void move() {
    // move the animal for one step
    turn(random(-tspeed, tspeed));
    forward(random(fspeed));
  }

  void wrap() {
    // wrap the animal's position around the screen
    if (x > width) x = 0;
    else if (x < 0 ) x = width;
    
    if (y > height) y = 0;
    else if (y < 0 ) y = height;
  }

  void fence() {
    // prevent the animal from leaving the screen
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }

  void die() {
    // animal near the end of its life
    alive = false;
  }

  float distance(Animal a) {
    // compute the distance between this object and another Animal, a
    return dist(x, y, a.x, a.y);
  }

  boolean nearBy(float maxD, Class T) {
    // determine if another Animal (of Type T) is within maxD pixels
    // for example: nearBy(10, Animal.class) tells you if an 
    // Animal is within 10 pixels of this object
    return w.nearBy(this, maxD, T);
  }
}