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
  //fadeBackground();
  stroke(255,15);
  noFill();
  pushMatrix();
  translate(width/2,height/2);
  beginShape();
  for(float i = 0; i < TWO_PI; i += 0.01){
    float x = (radius + map(pow(sin(inc1),3),0,1,-100,100)) * cos(inc2+i);
    float y = (radius + map(pow(sin(inc2),8),0,1,-100,100)) * sin(inc1+i);
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

void fadeBackground(){
  noStroke();
  fill(0,20);
  rect(0,0,width,height);
}

void mousePressed(){
  saveFrame("frame/Frame-####.png");
}
