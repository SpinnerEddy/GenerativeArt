PVector location1;
PVector location2;

PVector center;

float amp;
float angle;
float theta;
float distance;

float noiseSeedX1;
float noiseSeedX2;
float noiseSeedY1;
float noiseSeedY2;

void setup(){
  size(600,600);
  background(0);
  location1 = new PVector();
  location2 = new PVector();
  center = new PVector();
  //center = PVector.add(location1,location2).div(2);
  amp = 200;
  angle = 0;
  theta = 0;
  noiseSeedX1 = random(10,1000);
  noiseSeedX2 = random(1000,10000);
  noiseSeedY1 = random(10,1000);
  noiseSeedY2 = random(1000,10000);
  //distance = dist(location1.x,location1.y,location2.x,location2.y);
}

void draw(){
  //background(0);
  //fadeBackground();
  stroke(255,10);
  //fill(255);
  noFill();
  //line(location1.x,location1.y,location2.x,location2.y);
  //translate(width/2,height/2);
  
  location1.x = map(noise(noiseSeedX1),0,1,0,width);
  location1.y = map(noise(noiseSeedY1),0,1,0,height);
  location2.x = map(noise(noiseSeedX2),0,1,0,width);
  location2.y = map(noise(noiseSeedY2),0,1,0,height);
  
  distance = dist(location1.x,location1.y,location2.x,location2.y);
  
  center = PVector.add(location1,location2).div(2);
  
  translate(center.x,center.y);
  rotate(PVector.sub(location2,location1).heading());
  beginShape();
  for(float x = -distance/2; x <= distance/2; x++){
    float y = amp * sin(angle + map(x,location1.x,location2.x,0,TWO_PI));
    //ellipse(x,y,10,10);
    vertex(x,y);
  }
  endShape();
  //for(float x = location1.x; x <= location2.x; x++){
  //  float y = location2.y + amp * sin(angle + map(x,location1.x,location2.x,0,TWO_PI));
  //  ellipse(x,y,10,10);
  //}
  //seed += 0.1;
  angle += 0.1;
  theta += 0.05;
  noiseSeedX1 += 0.001;
  noiseSeedY1 += 0.001;
  noiseSeedX2 += 0.001;
  noiseSeedY2 += 0.001;
}

void mousePressed(){
  saveFrame("frame/frame-####.png");
}

void fadeBackground(){
  fill(0,20);
  noStroke();
  rectMode(CORNER);
  rect(0,0,width,height);
}
