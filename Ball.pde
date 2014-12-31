class Ball {
  
  float radius_;
  //Axis axis;
  int arrayIndex;
  ArrayList p;
  Trajectory trajectory_ = null;
  
  Ball(float radius) {
    radius_ = radius;
    
    //axis = new Axis(radius_*2);
    arrayIndex = 0;
  }
  
  void setTrajectory(Trajectory trajectory) {
    trajectory_ = trajectory;
    p = trajectory_.getPoints();
  }
  
  void draw() {
    if (trajectory_ == null) return;
    
    update();
    PVector pv = (PVector) p.get(arrayIndex);
    
    pushMatrix();  
    translate(pv.x, pv.y, pv.z);
    //axis.draw();

    //stroke(200,200,0);
    noStroke();
    fill(yellow);
    sphereDetail(20,20);
    sphere(radius_);
    popMatrix();  
    trajectory_.draw(arrayIndex);
    
    arrayIndex++;
  }
  
  void update() {
    if (arrayIndex > p.size()-1) {
      arrayIndex = 0;
    }
  }
}
