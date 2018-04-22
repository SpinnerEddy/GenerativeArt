class ParticleManager{
  ArrayList<Particle> particles;
  ArrayList<Attractor> attractors;
  ArrayList<Repeller> repellers;
  
  Attractor attractor;
  Repeller repeller;
  
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
  }
  
  void run(){
    for(int i = particles.size()-1; i >= 0; i--){
      Particle p = particles.get(i);
      //for(int j = 0; j < 10; j++){
      //  if(dist(p.position.x,p.position.y,
      //          repellers.get(j).position.x,repellers.get(j).position.y) < 100){
      //    PVector force = repellers.get(j).repel(p);
      //    p.applyForce(force);
      //  }else{
      //    PVector force = attractors.get(j).attract(p);
      //    p.applyForce(force);
      //  }
      //}
      if(dist(p.position.x,p.position.y,width/2,height/2) < 200){
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
