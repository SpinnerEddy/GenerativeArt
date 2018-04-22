class Particle{
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  float fillHu;
  float strokeHu;
  float alpha;
  
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
    alpha = 255;
    
    angle = random(TWO_PI);
    aVelocity = 0;
    aVelocity = 0;
    
    radius = 10;
    mass = 1;
  }
  
  void update(){
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }
  
  void updateAngle(){
    aVelocity += aAcceleration;
    angle += aVelocity;
    aAcceleration *= 0;
  }
  
  void applyForce(PVector f){
    PVector force = f.div(mass);
    acceleration.add(force);
  }
  
  void applyForceAngle(float f){
    float force = f / mass;
    aAcceleration += force;
  }
  
  void display(){
    colorMode(HSB);
    stroke(strokeHu,255,255,alpha);
    fill(fillHu,255,255,alpha);
    ellipse(position.x,position.y,radius,radius);
  }
  
}
