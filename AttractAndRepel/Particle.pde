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
  
  float G;
  
  Particle(float x,float y){
    position = new PVector(x,y);
    //velocity = new PVector(0,0);
    velocity = PVector.random2D().mult(random(0.1,3));
    acceleration = new PVector(0,0);
    
    fillHu = random(255);
    strokeHu = random(255);
    alpha = 10;
    
    angle = random(TWO_PI);
    aVelocity = random(-0.2,0.2);
    aAcceleration = 0;
    
    //radius = random(10,20);
    radius = 3;
    mass = radius/10;
    //mass = random(1,2);
    //G = abs(aVelocity);
    G = abs(aVelocity);
  }
  
  void update(){
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    
    velocity.mult(0.99);
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
    //noStroke();
    stroke(strokeHu,255,255,alpha);
    //noFill();
    fill(fillHu,255,255,alpha);
    //ellipse(position.x,position.y,radius*2,radius*2);
    rectMode(CENTER);
    pushMatrix();
    translate(position.x,position.y);
    rotate(angle);
    rect(0,0,radius,radius);
    popMatrix();
  }
  
  void edgeChecker(){
    if(position.x > width || position.x < 0){
      velocity.x *= -1;
    }
    if(position.y > height || position.y < 0){
      velocity.y *= -1;
    }
  }
  
  PVector attract(Particle p){
    PVector force = PVector.sub(position,p.position);
    float distance = force.mag();
    distance = constrain(distance,radius/2,radius*2);
    force.normalize();
    
    float strength = (G * mass * p.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
  
}
