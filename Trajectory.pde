
class Trajectory {
  
  ArrayList<Spline> splines = null;
  ArrayList<PVector> pointsInCurve = null;
  
  Trajectory(ArrayList<PVector> positions) {
    
    pointsInCurve = new ArrayList<PVector>();
    splines = new ArrayList<Spline>();
    for (int i=0; i<positions.size()-1; i++) {
      Spline spline = new Spline(positions.get(i), positions.get(i+1));
      splines.add(spline);
      pointsInCurve.addAll(spline.getPoints());
    }
  }
  
  void draw() {
    for (Spline spline : splines) { 
      spline.draw();
    }
  }
  
  void draw(int index) {
    stroke(red);
    strokeWeight(2.5);
    noFill();
    for (int i=index-1; i>index-50; i--) {
      if (i == -1 || i ==0) break;
      PVector p1 = pointsInCurve.get(i);
      PVector p2 = pointsInCurve.get(i-1);
      line(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z);
    }
  }
  
  ArrayList getPoints() {
    return pointsInCurve;
  }
}
