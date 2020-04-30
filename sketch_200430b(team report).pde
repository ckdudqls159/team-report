import processing.net.*;
Server s;
Client c;
int n;
int s_num = 250;
Star myStar[] = new Star[s_num];

void setup()
{
  size(800, 600, P3D);
  s = new Server(this, 1234);
  for(int i = 0; i < s_num; i++){
    myStar[i] = new Star();
  }
  smooth(8);
}

void draw()
{
  c = s.available();
  if(c!=null){
    String m = c.readString();
    n = m.indexOf("\r\n\r\n")+4;
    m = m.substring(n);
    println(m);
    n = int(m.trim()); 
    
    
  }
  
  background(0);
  
  for(int i = 0; i < s_num; i++){
    myStar[i].display();
    myStar[i].move();
  }
}

class Star
{
  float xpos, ypos, zpos, speed, w;
  
  Star(){
    xpos = random(width);
    ypos = random(height);
    zpos = random(-200, 400);
    speed = random(3, 5);
    w = random(3, 5);
}
void display(){

  noStroke();
  fill(n,n+50,n+100);
  pushMatrix();
  translate(xpos, ypos, zpos);
  ellipse(0, 0, w, w);
  popMatrix();
}
void move(){
  zpos += speed;
  if(zpos > 500)
  {
    zpos = -200;
  }
}
}
