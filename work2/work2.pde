float radius;
float inc1,inc2;

PVector firstPoint;

void setup(){
  size(600,600);
  background(0);
  radius = 200;
  inc1 = random(100,1000);
  inc2 = random(1000,10000);
  firstPoint = new PVector();
}

void draw(){
  //background(0);
  stroke(255,10);
  noFill();
  pushMatrix();
  translate(width/2,height/2);
  beginShape();
  for(float i = 0; i < TWO_PI; i += 0.1){
    float x = (radius + map(pow(sin(i+inc1),3),0,1,-100,100)) * cos(i);
    float y = (radius + map(pow(sin(i+inc2),3),0,1,-100,100)) * sin(i);
    //float x = radius * cos(i);
    //float y = radius * sin(i);
    vertex(x,y);
    //ellipse(x,y,5,5);
  }
  //vertex(firstPoint.x,firstPoint.y);
  endShape(CLOSE);
  popMatrix();
  inc1 += 0.01f;
  inc2 += 0.01f;
}

void mousePressed(){
  saveFrame("frame/Frame-####.png");
}
