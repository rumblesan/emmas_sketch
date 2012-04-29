
ArrayList allTriangles;
PVector screenCentre;

void setup() {

  size(1920, 1200);
  noFill();
  smooth();
  background(155);

  screenCentre = new PVector(width/2, height/2);

  createTriangles(150);
}

void createTriangles (int number) {

  allTriangles = new ArrayList();

  float distance, angle;

  for (int i = 0; i < number; i++) {
    distance = random(100, height/2);
    angle    = random(360);

    allTriangles.add(
      new Triangle(
        new PVector(
          sin(angle) * distance,
          cos(angle) * distance
        )
      )
    );
  }

}

void mouseClicked() {
  background(155);
  createTriangles();
}

void draw() {

  noStroke();
  fill(155, 30);
  rect(0, 0, width, height);
  noFill();
  stroke(0);

  for (int i = 0; i < allTriangles.size(); i++) {
    Triangle t = (Triangle) allTriangles.get(i);
    t.rotateTriangle();
    t.display(screenCentre);
  }

}

