// Henry Wandover <hw9692@bard.edu> & Sahil Chopra <sc2822@bard.edu>
// Nov 18 2021
// CMSC 141
// Lab_8: Simulation
// I coded by myself with assistance from the Processing reference page
// I found that the predator's consistently seemed to win in the end, I tried to sustain the Prey population longer by giving a chance
// for a higher amount of births as well as increasing the starting population. 

World w;

void setup() {
  size(500, 500);
  w = new World();
  for (int i = 0; i < 100; i++) {
    w.addAnimal(new Prey(w));
  }

  for (int i = 0; i < 10; i++) {
    w.addAnimal(new Predator(w));
  }
}

void draw() {
  background(196);
  w.tic();
  drawPop();
}

void drawPop() {
  // display the number of Animals in the simulation as a bar chart
  int numPrey = w.count(Prey.class);
  int numPredator = w.count(Predator.class);

  if (numPrey == 0 || numPredator == 0) {
    background(196);
    textSize(32);
    fill(24);
    text("steps: " + frameCount, 50, 50);
    text("prey: " + numPrey, 50, 100);
    text("predator: " + numPredator, 50, 150);
    noLoop();
  } else {  
    noStroke();
    fill(0, 0, 255, 124);
    rect(0, 10, numPrey*3, 18);
    fill(255, 0, 0, 124);
    rect (0, 30, numPredator*3, 18);
  }
}
