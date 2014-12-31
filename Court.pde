class Court {
  
  Net net;
  
  Court() {
    net = new Net();
  }

  PVector corner1 = new PVector(50.0, 0.0, 150.0);
  PVector corner2 = new PVector(50.0, 0.0, 618.0);
  PVector corner3 = new PVector(266.0, 0.0, 618.0);
  PVector corner4 = new PVector(266.0, 0.0, 150.0);
  PVector leftSingleLineEndPoint1 = new PVector(77.0, 0.0, 150.0);
  PVector leftSingleLineEndPoint2 = new PVector(77.0, 0.0, 618.0);
  PVector rightSingleLineEndPoint1 = new PVector(239.0, 0.0, 150.0);
  PVector rightSingleLineEndPoint2 = new PVector(239.0, 0.0, 618.0);
  PVector middleLineEndPoint1 = new PVector(50.0, 0.0, 384.0);
  PVector middleLineEndPoint2 = new PVector(266.0, 0.0, 384.0);
  PVector upperServiceLineEndPoint1 = new PVector(77.0, 0.0, 258.0);
  PVector upperServiceLineEndPoint2 = new PVector(239.0, 0.0, 258.0);
  PVector lowerServiceLineEndPoint1 = new PVector(77.0, 0.0, 510.0);
  PVector lowerServiceLineEndPoint2 = new PVector(239.0, 0.0, 510.0);
  PVector serviceLineTPoint1 = new PVector(158.0, 0.0, 258.0);
  PVector serviceLineTPoint2 = new PVector(158.0, 0.0, 510.0);
  
  void draw() {
   
    pushMatrix();
    
    // The center of the court is in (158, 0, 384), so we need to translate it
    translate(-158.0, 0.0, -384.0);
    
    strokeWeight(3);
    stroke(255);
    fill(115, 75, 150);

    beginShape(QUADS);
      vertex(corner1.x, corner1.y, corner1.z);
      vertex(corner2.x, corner2.y, corner2.z);
      vertex(corner3.x, corner3.y, corner3.z);
      vertex(corner4.x, corner4.y, corner4.z);
      normal(0,1,0);
    endShape(CLOSE);

    line(rightSingleLineEndPoint1.x, rightSingleLineEndPoint1.y, rightSingleLineEndPoint1.z, 
         rightSingleLineEndPoint2.x, rightSingleLineEndPoint2.y, rightSingleLineEndPoint2.z);
    line(leftSingleLineEndPoint1.x, leftSingleLineEndPoint1.y, leftSingleLineEndPoint1.z,
         leftSingleLineEndPoint2.x, leftSingleLineEndPoint2.y, leftSingleLineEndPoint2.z);
    line(upperServiceLineEndPoint1.x, upperServiceLineEndPoint1.y, upperServiceLineEndPoint1.z,
         upperServiceLineEndPoint2.x, upperServiceLineEndPoint2.y, upperServiceLineEndPoint2.z);
    line(lowerServiceLineEndPoint1.x, lowerServiceLineEndPoint1.y, lowerServiceLineEndPoint1.z,
         lowerServiceLineEndPoint2.x, lowerServiceLineEndPoint2.y, lowerServiceLineEndPoint2.z);
    line(serviceLineTPoint1.x, serviceLineTPoint1.y, serviceLineTPoint1.z,
         serviceLineTPoint2.x, serviceLineTPoint2.y, serviceLineTPoint2.z);

//    beginShape(LINES);
//      vertex(leftSingleLineEndPoint1.x, leftSingleLineEndPoint1.y);
//      vertex(rightSingleLineEndPoint1.x, rightSingleLineEndPoint1.y);
//    endShape(CLOSE);

    net.draw();
    popMatrix();
  }
}
