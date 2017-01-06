import processing.opengl.*;

color red = #ff0000;
color green = #00ff00;
color blue = #0000ff;
color yellow = #FFFF69;

// Variable camera positions
PVector eye = new PVector(0.0, 0.0, 0.0);
PVector center = new PVector(0.0, 0.0, 0.0);

// Default camera positions
PVector defaultEye = new PVector(1.0, -350.0, -450.0);
PVector eyeLeft = new PVector(200.0, -100.0, -400.0);
PVector eyeCenter = new PVector(0.0, -100.0, -400.0);
PVector eyeRight = new PVector(-200.0, -100.0, -400.0);
PVector eyeMiddleLeft = new PVector(500.0, -200.0, -75.0);
PVector eyeMiddleRight = new PVector(-500.0, -200.0, -75.0);
PVector eyeTop = new PVector(0.0, -600.0, -1.0);

PVector courtCenter = new PVector(0.0, 0.0, 0.0);
PVector courtPos1 = new PVector(0.0, 0.0, 0.0);

boolean allowMouse = false;
boolean animate = false;
boolean drawAxis = false;

Axis axis = null;
Court court = new Court();
Ball ball = new Ball(3.0);

ArrayList<PVector> trajectoryPoints = new ArrayList<PVector>();
Trajectory trajectory;

void setup() {
  size(800, 600, OPENGL);
  fill(204);
  eye = defaultEye;
  center = courtCenter;
  smooth();
  
  trajectoryPoints.add(new PVector(134, -35, 157));
  trajectoryPoints.add(new PVector(178, 0, 462));
  trajectoryPoints.add(new PVector(216, -20, 607));
  trajectoryPoints.add(new PVector(207, 0, 219));
  trajectoryPoints.add(new PVector(181, -20, 115));
  trajectoryPoints.add(new PVector(132, 0, 532));
  trajectoryPoints.add(new PVector(136, -20, 496));
  trajectoryPoints.add(new PVector(216, 0, 213));

  trajectory = new Trajectory(trajectoryPoints);
  axis = new Axis(100.0);
}

float newTime;

void draw() {

  ambientLight(255, 255, 255);
//    directionalLight(128, 128, 128, 0, 1, 0);
//    lightFalloff(1, 0, 0);
//    lightSpecular(0, 0, 0);
//  lights();

  background(120, 155, 95);
  cameraControl();
  mouseControl();

  if (drawAxis) {
    // When drawing axis, Processing crashes...
    //axis.draw();
  }
      
  pushMatrix();

  court.draw();
  translate(-150.0, 0.0, -384.0);

  ball.draw();
  //trajectory.draw();

  printHelp();
  popMatrix();
}

void printHelp() {
  text("a : animate", 300, -110, 384);  
  text("t : trajectory", 300, -90, 384);
  text("0-6 : views", 300, -70, 384);
}

float kfov = 3.0;
float fov, aspect; 
float cameraZ, cameraY;
float k = 1.0;

void cameraControl() {
  cameraY = height/2.0;
  fov = PI/kfov;
  aspect = k*float(width)/float(height);
  cameraZ = (height/2.0) / tan(fov / 2.0);
  perspective(fov, aspect, cameraZ/10.0, cameraZ*10.0);

  camera(eye.x, eye.y, eye.z,
         center.x, center.y, center.x,
         0.0, 1.0, 0.0); // upX, upY, upZ
}

void mouseControl() {

  if (allowMouse) {
    rotateY((-mouseX+(width/2.0))*0.001);
    rotateX((mouseY-(height/2.0))*0.00075);
    animate = false;

    if (mousePressed == true) {
      //println("kfov:"+kfov);
      if (mouseButton == LEFT && kfov < 25) {
        kfov += 0.1;
      }
      else if (mouseButton == RIGHT && kfov > 1.3) {
        kfov -= 0.1;
      }
    }
  }
  else if (animate) {
    newTime = millis();
    rotateY(newTime*(width/2.0)*0.001*0.0001);
  }
}

void keyPressed() {
  if (key == '0') {
    eye = defaultEye;
    k = 1.0;
    kfov = 3.0;
  }
  if (key == '1') {
    eye = eyeLeft;
  }
  if (key == '2') {
    eye = eyeCenter;
  }
  if (key == '3') {
    eye = eyeRight;
  }
  if (key == '4') {
    eye = eyeMiddleLeft;
  }
  if (key == '5') {
    eye = eyeTop;
  }
  if (key == '6') {
    eye = eyeMiddleRight;
  }

  if (key == ' ') {
    allowMouse = !allowMouse;
  }

  if (key == 'a') {
    animate = !animate;
  }

  if (key == 'x') {
    drawAxis = !drawAxis;
  }
  if (key == 't') {
    ball.setTrajectory(trajectory);
  }

  if (key == CODED) {
    if (keyCode == LEFT) {
      k += 0.01;
    }
    if (keyCode == RIGHT) {
      k -= 0.01;
    }
  }
}
