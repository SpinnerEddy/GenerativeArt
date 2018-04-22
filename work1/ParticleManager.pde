class ParticleManager{
  ArrayList<Particle> particles;
  //ArrayList<Attractor> attractors;
  //ArrayList<Repeller> repellers;
  
  Attractor attractor;
  Repeller repeller;
  
  ParticleManager(){
    particles = new ArrayList<Particle>();
    for(int i = 0; i < 100; i++){
      addParticle();
    }
    
    attractor = new Attractor(width/2,height/2);
    
  }
  
  void run(){
    for(int i = particles.size()-1; i >= 0; i--){
      Particle p = particles.get(i);
      PVector force = attractor.attract(p);
      p.applyForce(force);
      p.update();
      p.updateAngle();
      p.display();
      p.edgeChecker();
    }
    attractor.display();
  }
  
  void addParticle(){
    particles.add(new Particle(random(width),random(height)));
  }
  
  void addAttractor(){
    particles.add(new Attractor(random(width),random(height)));
  }
  
  void addRepeller(){
    particles.add(new Repeller(random(width),random(height)));
  }
}
