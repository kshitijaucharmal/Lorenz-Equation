import peasy.*;

PeasyCam cam;

float x = 0.01;
float y = 0.01;
float z = 0;

float a = 10;
float b = 28;
float c = 8.0/3.3;

ArrayList<PVector> points = new ArrayList<PVector>();

void setup(){
  size(600, 600, P3D);
  colorMode(HSB);
  cam = new PeasyCam(this, 500);
}

void draw(){
  background(0);
  //translate(width/2, height/2);
  scale(5);
  
  float dt = 0.007f;
  float dx = (a * (y - x)) * dt;
  float dy = (x * (b - z) - y) * dt;
  float dz = (x * y - c * z) * dt;
  
  x += dx;
  y += dy;
  z += dz;
  
  points.add(new PVector(x, y, z));
  
  noFill();
  float hu = 0;
  beginShape();
  for(int i = 0; i < points.size(); i++){
    stroke(hu, 255, 255);
    vertex(points.get(i).x, points.get(i).y, points.get(i).z);
    hu += 0.1f;
  }
  endShape();
  
  //saveFrame("output/image_####.jpg");
}
