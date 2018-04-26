PVector location1;
PVector location2;

float amp;
float angle;
float theta;
float distance;

float seed;

void setup(){
  size(600,600);
  background(0);
  location1 = new PVector(width/4,height/2);
  location2 = new PVector((width/4)*3,height/2);
  amp = 200;
  angle = 0;
  theta = 0;
  seed = random(1000);
  distance = dist(location1.x,location1.y,location2.x,location2.y);
}

void draw(){
  //background(0);
  stroke(255,1);
  fill(255,1);
  //line(location1.x,location1.y,location2.x,location2.y);
  amp = map(noise(seed),0,1,100,300);
  translate(width/2,height/2);
  rotate(theta);
  for(float x = -distance/2; x <= distance/2; x++){
    float y = amp * sin(angle + map(x,location1.x,location2.x,0,TWO_PI));
    ellipse(x,y,10,10);
  }
  //for(float x = location1.x; x <= location2.x; x++){
  //  float y = location2.y + amp * sin(angle + map(x,location1.x,location2.x,0,TWO_PI));
  //  ellipse(x,y,10,10);
  //}
  //seed += 0.1;
  angle += 0.1;
  theta += 0.05;
}

void mousePressed(){
  saveFrame("frame/frame-####.png");
}
