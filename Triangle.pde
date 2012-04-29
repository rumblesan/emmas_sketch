
class Triangle {

  PVector centre;
  ArrayList points;

  float rotateSpeed;
  float sizeChangeValue;
  float sizeChangeAmount;

  float cTheta;
  float sTheta;


  Triangle(PVector c) {

    centre = c;
    points = new ArrayList();

    sizeChangeValue  = random(10, 3600) / 10000;
    sizeChangeAmount = 0;

    rotateSpeed = random(2);
    cTheta = cos(radians(rotateSpeed));
    sTheta = sin(radians(rotateSpeed));


    float distance, xVal, yVal;
    for (int i = 0; i < 3; i++) {

      distance = random(20, 100);

      xVal     = sin(radians(120 * i)) * distance;
      yVal     = cos(radians(120 * i)) * distance;

      points.add(new PVector(xVal, yVal));
    }
  }

  float sizeChange() {

    float sizeDiff = cos(radians(sizeChangeAmount)) / 2;

    //45 is a magic number, chosen through trial and error
    sizeDiff /= 45;
    sizeDiff += 1;

    sizeChangeAmount += sizeChangeValue;
    if (sizeChangeAmount >= 360) {
      sizeChangeAmount -= 360;
    }

    return sizeDiff;
  }


  void display(PVector sC) {
    PVector pos;

    beginShape();
    for (int i = 0; i < 3; i++) {
      pos = (PVector) points.get(i);

      pos.mult(sizeChange());

      vertex(pos.x + centre.x + sC.x, pos.y + centre.y + sC.y);
    }
    endShape(CLOSE);

  }


  void rotateTriangle() {

    PVector pos;
    float xTemp = centre.x;

    centre.x = centre.x * cTheta - centre.y * sTheta;
    centre.y = xTemp    * sTheta + centre.y * cTheta;

    for (int i = 0; i < 3; i++) {
      pos = (PVector) points.get(i);
      xTemp = pos.x;
      pos.x = pos.x * cTheta - pos.y * sTheta;
      pos.y = xTemp * sTheta + pos.y * cTheta;
    }

  }

}

