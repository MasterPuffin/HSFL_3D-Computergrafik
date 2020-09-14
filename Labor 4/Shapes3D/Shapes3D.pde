ShapeMaker cube;

float size;
float speed = 0.005;
PVector angle = new PVector(0.5, 0.5);
boolean animated = true;

void setup() {
  size(400, 400, P3D);
  surface.setResizable(true);

  cube = new ShapeMaker();
  size = min(width, height) / 5;
  cube.type = "cylinder";
  cube.setup();
}

void draw() {
  background(255);

  // adjust cube to screen size
  size = min(width, height) / 5;

  pushMatrix();
  translate(width/2, height/2);
  // invert the direction of the y-axis
  scale(1, -1);
  scale(size);
  // angle is represented as declination and azimuth
  rotateX(angle.x);
  rotateY(angle.y);
  if (animated) {
    angle.x += speed;
    angle.y += speed;
  } 
  cube.render();
  popMatrix();
}

void keyPressed() {
  switch (key) {
  case 't':
    animated = !animated;
    break;
  case 'r':
    angle.x = 0;
    angle.y = 0;
    break;
  case 'n':
    cube.shapeRadius+=0.2;
    cube.setup();
    break;
  case 'm':
    cube.shapeRadius-=0.2;
    cube.setup();
    break;
  case 'k':
    cube.sideSegments++;
    cube.setup();
    break;
  case 'l':
    cube.sideSegments--;
    cube.setup();
    break;
  case 'b':
    cube.type=(cube.type=="cylinder")? "cone" : "cylinder";
    cube.setup();
    break;
  case CODED:
    switch (keyCode) {
    case UP:
      cube.shapeHeight+=0.2;
      cube.setup();
      break;
    case DOWN:
      cube.shapeHeight-=0.2;
      cube.setup();
      break;
    case LEFT:
      cube.baseSegments++;
      cube.setup();
      break;
    case RIGHT:
      cube.baseSegments--;
      cube.setup();
      break;
    }
    break;
  }
}
