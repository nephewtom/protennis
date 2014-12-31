
class Axis {

  PVector center_;
  float size_;
  PVector x_, y_, z_;

  Axis(float size) {
    center_ = new PVector(0, 0, 0);
    size_ = size;
    PVector x_ = new PVector(size_, 0, 0);
    PVector y_ = new PVector(0, size_, 0);
    PVector z_ = new PVector(0, 0, size_);
    //println("Axis created");
  }

  void printAxis(PVector pvec) {
    println("x:"+pvec.x+"|y:"+pvec.y+"|z:"+pvec.z);
  }
  
  void draw() {

    stroke(0);
    box(size_/15.0);

    drawAxis(x_, blue);
    drawAxis(y_, green);
    drawAxis(z_, red);
  }

  void drawAxis(PVector axisPoint, color c) {  
    strokeWeight(1);
    stroke(c);
    line(center_.x, center_.y, center_.z, 
    center_.x+axisPoint.x, center_.y+axisPoint.y, 
    center_.z+axisPoint.z);

    pushMatrix();
    translate(axisPoint.x, axisPoint.y, axisPoint.z);

    if (axisPoint.x != 0)
      rotateY(PI/2);
    else if (axisPoint.y != 0)
      rotateX(-PI/2);

    noStroke();
    fill(c);
    cone(0, 0, size_/50.0, size_/10.0);
    popMatrix();
  }
}

