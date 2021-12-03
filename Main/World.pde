class World {
  private final int MAX_ANIMALS = 10000;
  private Animal[] animals;
  private int num = 0;

  World() {
    animals = new Animal[MAX_ANIMALS];
  }

  void tic() {
    // advance the simulation by a step
    for (int i = 0; i < num; i++) {
      animals[i].step();
      animals[i].show();
    }
    removeDead();
  }

  void addAnimal(Animal a) {
    // add an animal to the simulation
    animals[num] = a;
    num++;
  }

  int count(Class T) {
    // return how many animals of type T are in the world
    int count = 0;
    for (int i = 0; i < animals.length; i++) {
      if (T.isInstance(animals[i])) {
        count ++;
      }
    }
    return count;
  }

  void removeDead() {
    // remove of the animals in the world that are not alive
    for (int i = num-1; i >= 0; i--) {
      if (!animals[i].alive) {
        animals[i] = animals[num-1];
        animals[num-1] = null;
        num--;
      }
    }
  }

  boolean nearBy(Animal c, float maxD, Class T) {
    // determine if any animals (of type T) are maxD pixels from the Animal c
    for (int i = 0; i < num; i++) {
      float d =  c.distance(animals[i]);
      if (d < maxD && T.isInstance(animals[i])) {
        return true;
      }
    }
    return false;
  }
}
