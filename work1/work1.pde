Particle[] particles;

void setup(){
  size(800,800);
  background(0);
  particles = new Particle[10];
  for(int i = 0; i < particles.length; i++){
    particles[i] = new Particle(random(width),random(height));
  }
  
}

void draw(){
  //background(0);
  fadeBackground();
  for(int i = 0; i < particles.length; i++){
    PVector force = new PVector(random(-1,1),random(-1,1));
    particles[i].applyForce(force);
    particles[i].applyForceAngle(force.mag());
    particles[i].update();
    particles[i].updateAngle();
    particles[i].display();
    particles[i].edgeChecker();
  }
}

void fadeBackground(){
  rectMode(CORNER); 
  fill(0,20);
  noStroke();
  rect(0,0,width,height);
}
