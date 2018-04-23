class ParticleManager{
  ArrayList<Particle> particles;
  ArrayList<Attractor> attractors;
  ArrayList<Repeller> repellers;
  
  Attractor attractor;
  Repeller repeller;
  
  float repelRange;
  
  ParticleManager(){
    particles = new ArrayList<Particle>();
    for(int i = 0; i < 1000; i++){
      addParticle();
    }
    
    //attractors = new ArrayList<Attractor>();
    //repellers = new ArrayList<Repeller>();
    //for(int i = 0; i < 10; i++){
    //  addAttractorAndRepeller(random(width),random(height));
    //}
    
    attractor = new Attractor(width/2,height/2);
    repeller = new Repeller(width/2,height/2);
    repelRange = 100;
  }
  
  void run(){
    for(int i = particles.size()-1; i >= 0; i--){
      Particle p = particles.get(i);
      if(dist(p.position.x,p.position.y,width/2,height/2) < repelRange){
        PVector force = repeller.repel(p);
        p.applyForce(force);
      }else{
        PVector force = attractor.attract(p);
        p.applyForce(force);
      }
      //for(int j = i; j >= 0; j--){
      //  PVector force = particles.get(j).attract(p);
      //  p.applyForce(force);
      //}
      p.update();
      p.updateAngle();
      p.display();
      p.edgeChecker();
    }
    //attractor.display();
    repelRange = 200 + 100 * sin(frameCount*0.04);
  }
  
  void addParticle(){
    particles.add(new Particle(random(width),random(height)));
  }
  
  void addAttractor(){
    attractors.add(new Attractor(random(width),random(height)));
  }
  
  void addRepeller(){
    repellers.add(new Repeller(random(width),random(height)));
  }
  
  void addAttractorAndRepeller(float x,float y){
    attractors.add(new Attractor(x,y));
    repellers.add(new Repeller(x,y));
  }
}
