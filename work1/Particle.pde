class Particle{
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  float fillHu;
  float strokeHu;
  
  float angle;
  float aVelocity;
  float aAcceleration;
  
  float radius;
  float mass;
  
  Particle(float x,float y){
    position = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    
    fillHu = random(255);
    strokeHu = random(255);
    
    angle = random(TWO_PI);
    aVelocity = 0;
    aVelocity = 0;
    
    radius = 10;
    mass = 1;
  }
}
