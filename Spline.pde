
class Spline {
  PVector start_;
  PVector end_;
  PVector cp1;
  PVector cp2;
  ArrayList points;
  
  Spline(PVector start, PVector end) {

    start_ = start;
    end_ = end;
    calcControlPoints();
    points = new ArrayList();
    calcPoints();
  }
  
  ArrayList getPoints() {
    return points;
  }
  
  void draw() {
    stroke(red);
    strokeWeight(1.0);
    noFill();    
    bezier(start_.x, start_.y, start_.z, cp1.x, cp1.y, cp1.z,
           cp2.x, cp2.y, cp2.z, end_.x, end_.y, end_.z);
  }
  
  void calcPoints() {
    strokeWeight(5);
    int steps = 50;
    for (int i = 0; i <= steps; i++) {
      float t = i / float(steps);
      PVector p = new PVector();
      p.x = bezierPoint(start_.x, cp1.x, cp2.x, end_.x, t);
      p.y = bezierPoint(start_.y, cp1.y, cp2.y, end_.y, t);
      p.z = bezierPoint(start_.z, cp1.z, cp2.z, end_.z, t);

      points.add(p);
    }
  }
  
  void calcControlPoints() {
      cp1 = getControlPoint(0.1);
      cp1.y = -35.0;
      cp2 = getControlPoint(0.8000001);
      cp2.y = -30.0;
  }
  
  PVector getControlPoint(float t) {
    PVector cp = new PVector(); 
    cp.x = (1.0-t)*start_.x+t*end_.x;
    cp.z = (1.0-t)*start_.z+t*end_.z;
    return cp;
  }
}
