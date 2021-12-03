class Predator extends Animal {

  float sz = 12;
  float reproductionRate = 0.01;

  Prey p;
  
  Predator (World w) {
    super(w);
  }
  
  void display() {
    noStroke();
    fill(255,0,0);
    ellipse(0,0,sz,sz);
    fill(255);
    ellipse(0-3,0+2,sz/4,sz/4);
    ellipse(0+3,0+2,sz/4,sz/4);
    fill(0);
    ellipse(0-3,0+2,sz/12,sz/12);
    ellipse(0+3,0+2,sz/12,sz/12);

  }

  void step() {
    super.step();
    if (energy > 25) {
      if (shouldReproduce()) {
        w.addAnimal(new Predator(w));
      }
    }

    if (nearBy(sz, Prey.class)) {
      energy += 10;
    }

    energy--;

    if (energy <= 0) {
      die();
    }
  }
}
