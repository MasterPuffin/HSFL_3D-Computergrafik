// scalable unit: u equals 1% of the smallest window dimesion
float u;
int distance = 35;
int size = 10;
float rotation = 0.5;
int ShapeCount = 16;

void setup() {
  size(600, 600, P2D);
  surface.setResizable(true);
  println("setup");
}

// draw an Shape at a certain position with a certain orientation

void renderShape(PVector position, float orientation) {
  // It would be better to create one global instance of Shape and reuse it, but we
  // just create a new instance for every Shape to keep the code simple and readable.
  Shape Shape = new Shape();
  Shape.stroke = u/(size*10);
  Shape.strokeColor = color(0);
  Shape.position = position;
  Shape.orientation = orientation;
  Shape.size = new PVector(size*u, size*u);
  Shape.render();
}

void draw() {
  // scalable unit: u equals 1% of the smallest window dimesion
  u = min(width, height) / 100;  
  background(255);

  // set the x,y-offset to the center of the canvas
  // this describes the center of the circle
  float centerX = 50*u;
  float centerY = 50*u;
  translate(centerX, centerY);

  for (int i=0; i < ShapeCount; i++) {      
    // Optimized version
    pushMatrix();
    rotate(radians((360.0/ShapeCount)*i));
    renderShape(new PVector(distance*u, 0), rotation * PI); // 0.5 * PI = radians(90)
    popMatrix();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      distance++;
    } else if (keyCode == DOWN) {
      distance--;
    } else if (keyCode == LEFT) {
      size++;
    } else if (keyCode == RIGHT) {
      size--;
    }
  } else {
    if (key == 'n') {
      rotation -= 0.01;
    } else if (key == 'm') {
      rotation += 0.01;
    } else if (key == 'k') {
      ShapeCount++;
    } else if (key == 'l') {
      ShapeCount--;
    }
    println(ShapeCount);
  }
}
