class Net {

  Net() {
  }

  float netHeight_ = 22.0;
  float netCenterHeight_ = 18.0;

  float postSide_ = 4.0;
  float postHeight_ = netHeight_ + 2.0;


  // TODO: Do not repeat values here and in Court. Tip: Create static  class Coordinates
 
  PVector leftPost = new PVector(32.0, -netHeight_, 384.0);
  PVector rightPost = new PVector(284.0, -netHeight_, 384.0);

  PVector leftGround = new PVector(32.0, 0.0, 384.0);
  PVector rightGround = new PVector(284.0, 0.0, 384.0);

  PVector center = new PVector(158.0, -netCenterHeight_, 384.0);
  PVector centerGround = new PVector(158.0, 0.0, 384.0);

  void draw() {
    drawStripes();
    drawBands();
    drawPosts();
  }

  void drawBands() {
    stroke(255);

    strokeWeight(4.0);
    line(leftPost.x, leftPost.y, leftPost.z, center.x, center.y, center.z);
    line(center.x, center.y, center.z, rightPost.x, rightPost.y, rightPost.z);

    line(center.x, center.y, center.z, centerGround.x, centerGround.y, centerGround.z);
  }

  void drawStripes() {

    stroke(40);
    strokeWeight(2.0);
    line(leftGround.x, leftGround.y, leftGround.z, rightGround.x, rightGround.y, rightGround.z);

    // TODO: Ajustar mejor la red y hacer codigo mas comprensible
    stroke(0);
    strokeWeight(1.0);
    // Horizontal stripes
    for (float y = -netHeight_+2.0; y < -2.0; y += 2.0) {
      line(leftPost.x, y, leftPost.z, center.x, y+4.0, center.z);
      line(center.x, y+4.0, center.z, rightPost.x, y, rightPost.z);
    }
    line(leftPost.x, -2.0, leftPost.z, center.x, 0.0, center.z);
    line(center.x, 0.0, center.z, rightPost.x, -2.0, rightPost.z);
    
    // Vertical stripes
    for (float x = leftPost.x; x <rightPost.x; x += 2.0) {
      line(x, (-netHeight_+3.5)+(1-(abs(x-center.x)/center.x)*5.0), leftPost.z, x, 0.0, rightPost.z);
    }
  }

  void drawPosts() {

    fill(20);
    noStroke();

    pushMatrix();
    translate(34.0 - postSide_, -postHeight_/2.0, 384.0);
    box(postSide_, postHeight_, postSide_ );
    popMatrix();

    pushMatrix();
    translate(282.0 + postSide_, -postHeight_/2.0, 384.0);
    box(postSide_, postHeight_, postSide_);
    popMatrix();
  }
}

