void setup() {
  size(1, 1, P3D);
  println("Multipliziere Matrix mit Vector");
  /*
  PMatrix3D p1 = new PMatrix3D(0, -2, 0, 5, 2, 0, 0, 3, 0, 0, 2, 4, 0, 0, 0, 1);
  PVector v1 = new PVector(1, 2, 3);
  PMatrix3D.mult(p1, v1);
  */

  println("Multipliziere Matrix mit Matrix");
  applyMatrix(0, -2, 0, 5, 2, 0, 0, 3, 0, 0, 2, 4, 0, 0, 0, 1);
  applyMatrix(0, 2, 0, 4, -2, 0, 0, 5, 0, 0, 2, 3, 0, 0, 0, 1);
  printMatrix();
}
