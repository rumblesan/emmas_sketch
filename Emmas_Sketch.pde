
int numberOfTriangles;
ArrayList allTriangles;
PVector screenCentre;

void setup() {
  
  size(1920, 1200);
  
  numberOfTriangles = 150;
  allTriangles = new ArrayList();
  
  screenCentre = new PVector(width/2, height/2);
  
  PVector centre;
  float distance, angle;
  
  for (int i = 0; i < numberOfTriangles; i++) {
    distance = random(100, height/2);
    angle    = random(360);
    centre = new PVector(sin(angle) * distance, cos(angle) * distance);
    
    centre.add(screenCentre);
    allTriangles.add(new Triangle(centre));
  }
  
  smooth();
  
}


void draw() {
  
  noStroke();
  fill(155, 50);
  rect(0, 0, width, height);
  stroke(0);
  
  fill(255);
  
  for (int i = 0; i < allTriangles.size(); i++) {
    Triangle t = (Triangle) allTriangles.get(i);
    t.rotateTriangle(screenCentre);
    t.display();
  }
  
}
