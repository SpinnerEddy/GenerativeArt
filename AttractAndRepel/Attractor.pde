class Attractor extends Particle{
  
  float G;
  
  Attractor(float x,float y){
    super(x,y);
    velocity = new PVector(0,0);
    G = 1;
    mass = 20;
  }
  
  void display(){
    noStroke();
    colorMode(RGB);
    fill(255,0,0);
    ellipse(position.x,position.y,20,20);
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
