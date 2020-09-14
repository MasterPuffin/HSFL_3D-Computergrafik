class ShapeMaker {

  final color EDGE_COLOR = color(0);
  final float VERTEX_SIZE = 0.2;
  final float EDGE_WEIGHT = 0.05;
  String type = "cylinder";
  color paint = color(0, 0, 0);

  float shapeRadius = 1;
  float shapeHeight = 2;
  int baseSegments = 6;
  int sideSegments = 3;
  int decks = sideSegments+1;

  // material properties for vertices
  // translucent colors to show internal features
  int[] colors = {
    color(0, 0, 0, 128), // black
    color(200, 0, 0, 128), // red
    color(0, 200, 0, 128), // green
    color(0, 0, 200, 128), // blue
    color(200, 200, 0, 128), //yellow
    color(0, 200, 200, 128), // cyan
    color(200, 0, 200, 128), // magenta
    color(200, 200, 200, 128), // gray
  };

  PVector[][] vertices;
  Triangle[] triangleArray;
  private Triangle[] calcTrianglesCylinder(int baseSegments) {
    Triangle[] triangleArray=new Triangle[baseSegments*2+baseSegments*2*sideSegments]; //Top+Bottom=baseSegments*2 | Seitenflächen*2(Dreiecke)* Unterteilung Seitenflächen
    int index=0;

    //Calc Top New
    for (int i = 1; i < baseSegments; i++) {
      triangleArray[index]=new Triangle(vertices[sideSegments][0], vertices[sideSegments][i], vertices[sideSegments][i+1]);
      index++;
    }

    //letztes Dreieck verbindet sich mit dem ersten Punkt
    triangleArray[index]=new Triangle(vertices[sideSegments][0], vertices[sideSegments][baseSegments], vertices[sideSegments][1]);
    index++;

    //Calc Bottom New    
    for (int i = 1; i < baseSegments; i++) {
      triangleArray[index]=new Triangle(vertices[0][0], vertices[0][i], vertices[0][i+1]);
      index++;
    }
    //letztes Dreieck verbindet sich mit dem ersten Punkt
    triangleArray[index]=new Triangle(vertices[0][0], vertices[0][baseSegments], vertices[0][1]);
    index++;

    //Calc Sides New
    for (int i=0; i<sideSegments; i++) {
      for (int j=1; j<baseSegments; j++) {
        //Ein Durchlauf pro Viereck im Mantel bestehend aus 2 Dreiecken

        //erstes Dreieck
        triangleArray[index]=new Triangle(vertices[i][j], vertices[i+1][j], vertices[i+1][j+1]);
        index++;
        //zweite Dreieck
        triangleArray[index]=new Triangle(vertices[i][j], vertices[i+1][j+1], vertices[i][j+1]);
        index++;
      }
      //Letztes Viereck vebindet sich mit den ersten Punkten
      //erstes Dreieck
      triangleArray[index]=new Triangle(vertices[i][baseSegments], vertices[i+1][baseSegments], vertices[i+1][1]);
      index++;
      //zweite Dreieck
      triangleArray[index]=new Triangle(vertices[i][baseSegments], vertices[i+1][1], vertices[i][1]);
      index++;
    }
    return triangleArray;
  }

  private Triangle[] calcTrianglesCone(int baseSegments) {
    Triangle[] triangleArray=new Triangle[baseSegments*2];
    int index=0;

    //Calc Bottom New    
    for (int i = 1; i < baseSegments; i++) {
      triangleArray[index]=new Triangle(vertices[0][0], vertices[0][i], vertices[0][i+1]);
      index++;
    }
    //letztes Dreieck verbindet sich mit dem ersten Punkt
    triangleArray[index]=new Triangle(vertices[0][0], vertices[0][baseSegments], vertices[0][1]);
    index++;

    //Calc Sides New
    for (int j=1; j<baseSegments; j++) {
      triangleArray[index]=new Triangle(vertices[0][j], vertices[0][j+1], vertices[1][0]);
      index++;
    }
    //Letztes Viereck vebindet sich mit den ersten Punkten
    //erstes Dreieck
    triangleArray[index]=new Triangle(vertices[0][baseSegments], vertices[0][1], vertices[1][0]);
    index++;
    return triangleArray;
  }

  private PVector[][] calcVerticesCylinder(int baseSegments) {
    PVector[][] verticesArray=new PVector[decks][baseSegments+1]; //verticesArray[Ebende][Punkt im Kreis]
    for (int i = 0; i < decks; i++) {
      verticesArray[i][0]=new PVector(0, 0, shapeHeight/sideSegments*i);
    }
    for (int i = 1; i <= baseSegments; i++) {
      float a = radians(360/baseSegments*i); 
      float x = 0 + shapeRadius * cos(a); 
      float y = 0 + shapeRadius * sin(a);
      for (int j = 0; j < decks; j++) {
        verticesArray[j][i]=new PVector(x, y, shapeHeight/sideSegments*j);
      }
    }
    return verticesArray;
  }

  private PVector[][] calcVerticesCone(int baseSegments) {
    PVector[][] verticesArray=new PVector[2][baseSegments+1]; //verticesArray[Ebende][Punkt im Kreis]

    //Nullpunkt
    verticesArray[0][0]=new PVector(0, 0, 5);
    //Spitze der Cone
    verticesArray[1][0]=new PVector(0, 0, shapeHeight+5);

    for (int i = 1; i <= baseSegments; i++) {
      float a = radians(360/baseSegments*i); 
      float x = 0 + shapeRadius * cos(a); 
      float y = 0 + shapeRadius * sin(a);
      verticesArray[0][i]=new PVector(x, y, 5);
    }
    return verticesArray;
  }

  private void renderFaces() {
    // render faces and visable edges
    stroke(EDGE_COLOR);
    strokeWeight(EDGE_WEIGHT);
    int colorIndex = 0;

    for (Triangle t : triangleArray) {
      beginShape(); 
      for (PVector v : t.getPoints()) {

        if (colorIndex >= colors.length) {
          colorIndex = 0;
        }
        fill(paint);
        colorIndex++;
        vertex(v.x, v.y, v.z);
      }
      endShape(CLOSE);
    }
  }

  private void renderEdges() {
    // render hidden edges with thinner line strokes
    noFill();
    stroke(EDGE_COLOR);
    strokeWeight(EDGE_WEIGHT * 0.2);

    // render everything ... not only visable objects
    hint(DISABLE_DEPTH_TEST);
    for (Triangle t : triangleArray) {
      beginShape();
      for (PVector v : t.getPoints()) {
        vertex(v.x, v.y, v.z);
      }
      endShape(CLOSE);
    }
    // reset: render ONLY visable objects
    hint(ENABLE_DEPTH_TEST);
  }

  public void setup() {
    decks = sideSegments + 1;
    if (type == "cylinder") {
      vertices = calcVerticesCylinder(baseSegments);
      triangleArray=calcTrianglesCylinder(baseSegments);
    } else {
      vertices = calcVerticesCone(baseSegments);
      triangleArray = calcTrianglesCone(baseSegments);
    }
  }

  public void render() {
    // true render functionality
    renderFaces();
    // visual debugging methods
    renderEdges();
  }
}
