import processing.opengl.*;

ArrayList allTriangles;
PVector screenCentre;
int triangles;
float startTime;
float currentTime;
float resetTime;


color triangleColour;
color backgroundColour;

void setup() {

  size(1920, 1200, OPENGL);
  noFill();
  background(155);
  stroke(0);

  triangles = 50;
  screenCentre = new PVector(width/2, height/2);

  resetTime = 600000;

  resetTriangles(triangles);

  triangleColour = color(255);
}

void setColours() {

  color tempColour = triangleColour;
  triangleColour = backgroundColour;
  backgroundColour = tempColour;

}

void resetTriangles (int number) {

  startTime = millis();

  setColours();

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
  resetTriangles(triangles);
}

void checkTime() {
  currentTime = millis();
  if (currentTime > (startTime + resetTime)) {
    resetTriangles(triangles);
  }
}

void draw() {

  checkTime();
  noStroke();
  fill(backgroundColour, 50);
  rect(0, 0, width, height);
  noFill();
  stroke(triangleColour);

  for (int i = 0; i < allTriangles.size(); i++) {
    Triangle t = (Triangle) allTriangles.get(i);
    t.rotateTriangle();
    t.display(screenCentre);
  }
}

