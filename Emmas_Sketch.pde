import processing.opengl.*;

ArrayList allTriangles;
PVector screenCentre;
int triangles;
float startTime;
float currentTime;
float resetTime;

color triangleColour;

void setup() {

  size(1920, 1200, OPENGL);
  noFill();
  background(155);
  stroke(0);

  triangles = 150;
  screenCentre = new PVector(width/2, height/2);

  resetTime = 60000;

  resetTriangles(triangles);

  triangleColour = color(157);
}

void triangleColor() {

  triangleColour = color(
        int(random(256)),
        int(random(256)),
        int(random(256))
      );

  println("Creating new triangles");
  println("RGB Colour is :");
  println(red(triangleColour));
  println(green(triangleColour));
  println(blue(triangleColour));
  println("\n");

}

void resetTriangles (int number) {

  background(155);
  startTime = millis();

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
  fill(70, 50);
  rect(0, 0, width, height);
  noFill();
  stroke(triangleColour);

  for (int i = 0; i < allTriangles.size(); i++) {
    Triangle t = (Triangle) allTriangles.get(i);
    t.rotateTriangle();
    t.display(screenCentre);
  }
}

