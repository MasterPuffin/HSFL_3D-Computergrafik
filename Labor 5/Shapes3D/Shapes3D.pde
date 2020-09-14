ShapeMaker cube;
ShapeMaker cube2;
ShapeMaker cube3;

float size;
PVector angle = new PVector(1, 1);
int zoom = 5;
//Normierter Richtungsvektor zur korrekten Berechnung der Kameradistanz im Raum (Richtungsvektor / eigene Länge)
float zoomfactor = 0.58;
float explosionpos = 0;
float explosionheight = 0;
float explosionforce = 100.0;
boolean explode = false;

float eyeX;
float eyeY;
float eyeZ;
float centerX;
float centerY;
float centerZ;
float upX;
float upY;
float upZ;

int cstate = 1;
boolean setup = false;

void setup() {
  size(400, 400, P3D);
  surface.setResizable(true);

  cube = new ShapeMaker();
  cube.type = "cylinder";
  cube.setup();

  cube2 = new ShapeMaker();
  cube2.type = "cylinder";
  cube2.setup();

  cube3 = new ShapeMaker();
  cube3.type = "cone";
  cube3.setup();
}

void draw() {
  background(255);

  // adjust cube to screen size
  size = min(width, height) / 10;

  pushMatrix();
  translate(width/2+100+explosionpos, height/2-explosionheight, 0+explosionpos);
  scale(size);
  rotateX(radians(90));
  cube.render();
  popMatrix();

  pushMatrix();
  translate(width/2-100-explosionpos, height/2-explosionheight, -20-explosionpos);
  scale(size);
  cube2.render();
  popMatrix();

  pushMatrix();
  translate(width/2+100+explosionpos, height/2-explosionheight, -150-explosionpos);
  scale(size);
  rotateX(radians(90));
  cube3.render();
  popMatrix();

  strokeWeight(3);
  drawAxes(100);

  if (explode) {
    explosionpos += explosionforce/8;
    explosionforce = explosionforce - explosionforce / 10;
    explosionheight = explosionforce*1.5;
  }
  if (!setup) {
    camera(width/2.0, height/2.0, height/2.0+zoom*10, width/2.0, height/2.0, 0, 0, 1, 0);
    setup = true;
  }
}

void drawAxes(float size) {
  //Source: https://stackoverflow.com/questions/41969905/3-axis-coordinate-system-in-processing-3-2-4
  //X  - red
  stroke(192, 0, 0);
  line(width/2+0, height/2+0, 0, width/2+size, height/2+0, 0);
  //Y - green
  stroke(0, 192, 0);
  line(width/2+0, height/2+0, 0, width/2+0, height/2+size, 0);
  //Z - blue
  stroke(0, 0, 192);
  line(width/2+0, height/2+0, 0, width/2+0, height/2+0, size);
}

void keyPressed() {
  switch (key) {
  case '1':    
    cstate = 1;
    break;
  case '2':
    cstate = 2;
    break;
  case '3':
    cstate = 3;
    break;
  case '4':
    cstate = 4;
    break;
  case ' ':
    explode = !explode;
    explosionpos = 0;
    explosionforce = 100.0;
    break;
  case CODED:
    switch (keyCode) {
    case UP:
      zoom++;
      break;
    case DOWN:
      zoom--;
      break;
    }
    break;
  }
  switch (cstate) {
  case 1:    
    //camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0)+zoom*100, width/2.0, height/2.0, 0, 0, 1, 0);
    eyeX = width/2.0;
    eyeY = height/2.0;
    eyeZ = height/2.0+zoom*10;
    centerX = width/2.0;
    centerY = height/2.0;
    centerZ = 0;
    upX = 0;
    upY = 1;
    upZ = 0;
    break;
  case 2:
    //camera(width/2.0, 0, (height/2.0) / tan(PI*30.0 / 45), width/2.0, height/2.0, 0, 0, 1, 0);
    eyeX = width/2.0;
    eyeY = height+zoom*10;
    // Processing won't render if Z is exactly 0
    eyeZ = 0.0001;
    centerX = width/2.0;
    centerY = height/2.0;
    centerZ = 0;
    upX = 0;
    upY = -1;
    upZ = 0;    
    break;
  case 3:
    //camera(0, height/2.0+zoom*100, 0, width/2.0, height/2.0, 0, 0, 1, 0);
    eyeX = 0-zoom*10;
    eyeY = height/2.0;
    eyeZ = 0;
    centerX = width/2.0;
    centerY = height/2.0;
    centerZ = 0;
    upX = 0;
    upY = 1;
    upZ = 0;
    break;
  case 4:
    //camera(0, 0, (height/2.0) / tan(PI*30.0 / 180.0)+zoom*100, width/2.0, height/2.0, 0, 0, 1, 0);
    eyeX = (height/2.0+zoom*10*zoomfactor)+(height/2.0)*zoomfactor;
    eyeY = (width/2.0-zoom*10*0.58)-(width/2.0)*zoomfactor;
    eyeZ = (0+zoom*10*0.58)+(height/2.0)*zoomfactor;
    centerX = width/2.0;
    centerY = height/2.0;
    centerZ = 0;
    upX = 0;
    upY = 1;
    upZ = 0;
    break;
  }
  println(zoom);
  camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ);
}
