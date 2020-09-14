//
// draw a free polygon that response the dimensions of the screen
//

color randomColor = color(random(255), random(255), random(255));
int speed = 5;
int border = 10;
float g;

color squareColor = color(249, 173, 42);
color circleColor = color(249, 173, 42);

int pos_square_x = 0+2*border;
int pos_square_y;
float pos_circle_x;

void setup() {
  size(600, 600);
  surface.setResizable(true);
  g = min(width, height);
  pos_square_y = width/4;
  pos_circle_x = width-2*border-g/8;
}

void draw() {
  background(255);

  println(g);
  println(width);
  println(height);


  stroke(0, 0, 0);
  strokeWeight(0);

  //center trapez
  fill(224, 205, 152);
  beginShape();
  vertex(0+border, height-border);
  vertex(width-border, height-border);
  vertex(width-width*1/3, height-height*2/3);
  vertex(width-width*2/3, height-height*2/3);
  endShape(CLOSE);

  //left triangle
  fill(60, 196, 29);
  beginShape();
  vertex(0+border, 0+border);
  vertex(0+border, height-border);
  vertex(width/2, 0+border);
  endShape(CLOSE);

  //right triangle
  fill(130, 196, 221);
  beginShape();
  vertex(width-border, 0+border);
  vertex(width-border, height-border);
  vertex(width/2, 0+border);
  endShape(CLOSE);

  //left square
  fill(squareColor);
  if (pos_square_y > width-2*border) {
    squareColor = color(random(255), random(255), random(255));
    circleColor = color(random(255), random(255), random(255));
    speed = speed*-1;
  } else if (pos_square_x < 2*border) {
    squareColor = color(random(255), random(255), random(255));
    circleColor = color(random(255), random(255), random(255));
    speed = speed*-1;
  }
  pos_square_x += speed;
  pos_square_y += speed;
  rect(pos_square_x, 0+2*border, pos_square_y, height/4);

  //right circle
  fill(circleColor);
  pos_circle_x += speed*-1;
  circle(pos_circle_x, 0+2*border+g/8, g/4);

  fill(randomColor);
  //center cross
  rectMode(CORNERS);  // Set rectMode to CORNERS
  rect(height-height*2/3, width-width*2/3, width-width*1/3, height-2*border-g/8);
  rect(height-height*2/3-g/8, width-width*2/3+g/8, width-width*1/3+g/8, height-2*border-2*g/8);
}

void mouseClicked() {
    randomColor = color(random(255), random(255), random(255));
}
