//
// draw a free polygon that response the dimensions of the screen
//

void setup() {
  size(600, 600);
  surface.setResizable(true);
}

void draw() {
  background(255);

  float g = min(width, height);
  int border = 10;
  println(g);
  println(width);
  println(height);


  stroke(0, 0, 0);
  strokeWeight(0);

  //center trapez
  fill(255, 255, 0);
  beginShape();
  vertex(0+border, height-border);
  vertex(width-border, height-border);
  vertex(width-width*1/3, height-height*2/3);
  vertex(width-width*2/3, height-height*2/3);
  endShape(CLOSE);

  //left triangle
  fill(255, 0, 0);
  beginShape();
  vertex(0+border, 0+border);
  vertex(0+border, height-border);
  vertex(width/2, 0+border);
  endShape(CLOSE);

  //right triangle
  fill(0, 0, 255);
  beginShape();
  vertex(width-border, 0+border);
  vertex(width-border, height-border);
  vertex(width/2, 0+border);
  endShape(CLOSE);

  //left square
  fill(0, 0, 0);
  rect(0+2*border, 0+2*border, width/4, height/4);

  //right circle  
  circle(width-2*border-g/8, 0+2*border+g/8, g/4);

  //center cross
  rectMode(CORNERS);  // Set rectMode to CORNERS
  rect(height-height*2/3, width-width*2/3, width-width*1/3, height-2*border-g/8);
  rect(height-height*2/3-g/8, width-width*2/3+g/8, width-width*1/3+g/8, height-2*border-2*g/8);
}
