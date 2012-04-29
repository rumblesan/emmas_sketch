
class Triangle {
   
  PVector centre;
  ArrayList p;
  
  int sMin = 20;
  int sMax = 100;
  
  float rotValue;
  
  float sizeChange;
  float sizeChangeCount = 0;
  
  Triangle(PVector c) {
    
    centre = c;
    
    p = new ArrayList();
    
    float distance;
    float sAngle, cAngle;
    
    sizeChange = round(random(1000, 4000))/360;
    
    rotValue = random(2);
    
    for (int i = 0; i < 3; i++) {
      sAngle = sin(radians(120 * i));
      cAngle = cos(radians(120 * i));
      distance = random(sMin, sMax);
      p.add(new PVector(sAngle * distance, cAngle * distance));
    }
  
  }
  
  float sizeChange() {
    
    float num = sizeChangeCount * sizeChange;
    float cVal = cos(radians(num));
    float sizeDiff = (cVal / 100) + 1;
    //println(sizeChangeCount + " " +  sizeChange + " " + num + " " + cVal + " " + sizeDiff);
    sizeChangeCount++;
    if (sizeChangeCount >= 360) {
      sizeChangeCount = 0;
    }
    return sizeDiff;
  }
  
  void display() {
    beginShape();
    
    PVector pos;
    float x, y;

    for (int i = 0; i < 3; i++) {
      pos = (PVector) p.get(i);
      
      pos.mult(sizeChange());
      
      x = pos.x + centre.x;
      y = pos.y + centre.y;
      vertex(x, y);
    }
    endShape(CLOSE);
  }


  void rotatePoints() {

    float xTemp;
    float theta = radians(rotValue);

    PVector pos;

    for (int i = 0; i < 3; i++) {
      pos = (PVector) p.get(i);
      xTemp = pos.x;
      pos.x = pos.x * cos(theta) - pos.y * sin(theta);
      pos.y = xTemp * sin(theta) + pos.y * cos(theta);
    }
  
  }


  void rotateTriangle(PVector c) {
    
    centre.sub(c);
    
    float xTemp = centre.x;
    float theta = radians(rotValue);

    centre.x = centre.x * cos(theta) - centre.y * sin(theta);
    centre.y = xTemp * sin(theta) + centre.y * cos(theta);
    
    centre.add(c);
    
    rotatePoints();
    
  }

}
