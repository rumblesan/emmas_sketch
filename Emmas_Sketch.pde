import processing.opengl.*;

ArrayList allTriangles;
PVector screenCentre;
int triangles;

void setup() {

  size(1920, 1200, OPENGL);
  noFill();
  background(155);
  stroke(0);

  triangles = 150;
  screenCentre = new PVector(width/2, height/2);

  createTriangles(triangles);
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
  createTriangles(triangles);
}

void draw() {

  noStroke();
  fill(155, 50);
  rect(0, 0, width, height);
  noFill();
  stroke(0);

  for (int i = 0; i < allTriangles.size(); i++) {
    Triangle t = (Triangle) allTriangles.get(i);
    t.rotateTriangle();
    t.display(screenCentre);
  }

  println(frameRate);
}

