ShapeMaker cubeX, cubeY, cubeZ, coneX, coneY, coneZ;

float size;
PVector angle = new PVector(1, 1);
PVector angleC = new PVector(-1, 1);

void setup() {
  size(400, 400, P3D);
  surface.setResizable(true);

  cubeX = new ShapeMaker();
  cubeX.type = "cylinder";
  cubeX.shapeHeight = 5;
  cubeX.shapeRadius = 0.2;
  cubeX.paint = color(255, 0, 0);
  cubeX.setup();

  coneX = new ShapeMaker();
  coneX.type = "cone";
  coneX.shapeHeight = 2;
  coneX.shapeRadius = 0.5;
  coneX.paint = color(255, 0, 0);
  coneX.setup();

  cubeY = new ShapeMaker();
  cubeY.type = "cylinder";
  cubeY.shapeHeight = 5;
  cubeY.shapeRadius = 0.2;
  cubeY.paint = color(0, 255, 0);
  cubeY.setup();

  coneY = new ShapeMaker();
  coneY.type = "cone";
  coneY.shapeHeight = 2;
  coneY.shapeRadius = 0.5;
  coneY.paint = color(0, 255, 0);
  coneY.setup();

  cubeZ = new ShapeMaker();
  cubeZ.type = "cylinder";
  cubeZ.shapeHeight = 5;
  cubeZ.shapeRadius = 0.2;
  cubeZ.paint = color(0, 0, 255);
  cubeZ.setup();

  coneZ = new ShapeMaker();
  coneZ.type = "cone";
  coneZ.shapeHeight = 2;
  coneZ.shapeRadius = 0.5;
  coneZ.paint = color(0, 0, 255);
  coneZ.setup();
}

void draw() {
  background(255);

  // adjust cube to screen size
  size = min(width, height) / 20;

  pushMatrix();
  translate(width/2, height/2);
  // invert the direction of the y-axis
  scale(1, -1);
  scale(size);
  // angle is represented as declination and azimuth
  rotateX(angle.x);
  rotateY(angle.y);
  cubeX.render();
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  // invert the direction of the y-axis
  scale(1, -1);
  scale(size);
  // angle is represented as declination and azimuth
  rotateX(angle.x);
  rotateY(angle.y);
  coneX.render();
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  // invert the direction of the y-axis
  scale(-1, 1);
  scale(size);
  // angle is represented as declination and azimuth
  rotateX(angle.x/2);
  rotateY(angle.y-1);
  cubeY.render();
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  // invert the direction of the y-axis
  scale(-1, 1);
  scale(size);
  // angle is represented as declination and azimuth
  rotateX(angle.x/2);
  rotateY(angle.y-1);
  coneY.render();
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  // invert the direction of the y-axis
  scale(-1, -1);
  scale(size);
  // angle is represented as declination and azimuth
  rotateX(angle.x);
  rotateY(angle.y);
  cubeZ.render();
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  // invert the direction of the y-axis
  scale(-1, -1);
  scale(size);
  // angle is represented as declination and azimuth
  rotateX(angle.x);
  rotateY(angle.y);
  coneZ.render();
  popMatrix();
}
