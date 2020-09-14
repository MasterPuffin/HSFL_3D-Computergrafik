class Shape {

  // class attributes
  private ArrayList<PVector> vertices = new ArrayList<PVector>();
  public PVector position = new PVector(0, 0); // position in pixels
  public float orientation = 0.0; // rotation angle in radians
  public PVector size = new PVector(1, 1); // scaling factor
  public color strokeColor = color(0); 
  public float stroke = 0.2;

  // constructor
  Shape() {
    // set up verticies to define the contour of the shape in model coordinates
    
    vertices.add(new PVector(1, 0));
    vertices.add(new PVector(0.5, -1));
    vertices.add(new PVector(-0.5, -1));
    vertices.add(new PVector(-1, 0));
    vertices.add(new PVector(-0.5, 1));
    vertices.add(new PVector(0.5, 1));
    
    /*
    vertices.add(new PVector(0.5, 0.5));
    vertices.add(new PVector(0.5, -0.5));
    vertices.add(new PVector(-0.5, -0.5));
    vertices.add(new PVector(-0.5, 0.5));
    */
  }

  // connect all vertices to a ploygon, draw and fill it
  private void drawShape() {
    strokeWeight(stroke);
    stroke(strokeColor);
    noFill();      
    beginShape();
    for (PVector v : vertices) {
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
  }

  // move the model coordinate system in place and call the drawing methods
  public void render() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(orientation);
    scale(size.x, size.y);
    drawShape();
    popMatrix();
  }
}
