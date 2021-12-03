class Prey extends Animal {

  float sz = 10;
  float reproductionRate = 0.1;
  
  Prey (World w) {
    super(w);
  }
  void display() {
    fill(0,0,255);
    noStroke();
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
    if (shouldReproduce()) {
      float birthamt = random(3);
      for (int i = 0; i < birthamt; i++) {
        w.addAnimal(new Prey(w));
      }
    }

    if (nearBy(sz, Predator.class)) {
      die();
    }
  }
}
