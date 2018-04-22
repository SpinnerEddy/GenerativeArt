ParticleManager particleManager;

void setup(){
  size(800,800);
  background(0); 
  smooth();
  colorMode(HSB);
  particleManager = new ParticleManager();
}

void draw(){
  //background(0);
  //fadeBackground();
  blendMode(ADD);
  particleManager.run();
}

void fadeBackground(){
  rectMode(CORNER); 
  fill(0,20);
  noStroke();
  rect(0,0,width,height);
}

void mousePressed(){
  saveFrame("frame/Frame-####.png");
}
