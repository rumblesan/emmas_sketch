
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

    allTriangles.add(new Triangle(centre));
  }

  noFill();
  smooth();
}


void draw() {

  noStroke();
  fill(155, 10);
  rect(0, 0, width, height);
  noFill();
  stroke(0);

  for (int i = 0; i < allTriangles.size(); i++) {
    Triangle t = (Triangle) allTriangles.get(i);
    t.rotateTriangle();
    t.display(screenCentre);
  }

}

