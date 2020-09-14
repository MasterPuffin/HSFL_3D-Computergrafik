PVector p1 = new PVector(2, 3);
PVector p2 = new PVector(-4, -1);
PVector p3 = new PVector(3, -3);


void setup() {
  //a) Konstruiere Vektoren
  println("Konstruiere Vektoren");
  PVector v1 = construct(p1, p2);
  println(v1);
  PVector v2 = construct(p1, p3);
  println(v2);

  //b) Berechne Länge
  println("Berechne Länge");
  println(calc_length(v1));
  println(calc_length(v2));

  //c) Berechne Abstände
  println("Berechne Abstände");
  println(calc_distance(p2, p3));

  //d) Skaliere
  println("Skaliere");
  println(scale(v1, -2));
  println(scale(v1, 3));

  //e) Normalisiere
  println("Normalisiere");
  println(normalize(v1));
  println(normalize(v2));

  //f) Berechne Winkel
  println("Berechne Winkel");
  println(calc_angle(v1, v2));

  //h) Berechne Schwerpunkt
  println("Berechne Schwerpunkt");
  println(calc_gravitypoint(p1, p2, p3));

  //i) Berechne Position über Zeit
  println("Berechne Position über Zeit");
  println(calc_distance_over_time(p1, v1, 2));
  println(calc_distance_over_time(p1, v1, -1));

  //j) Prüfe Orthogonalität
  println("Prüfe Orthogonalität");
  println(is_orthogonal(v1, v2));
}

PVector construct(PVector p1, PVector p2) {
  return new PVector(p2.x - p1.x, p2.y - p1.y);
}

float calc_length(PVector v) {
  return sqrt(pow(v.x, 2)+pow(v.y, 2));
}

float calc_distance(PVector x, PVector y) {
  return sqrt(pow(x.y-x.x, 2)+pow(y.y-y.x, 2));
}

float calc_angle(PVector v1, PVector v2) {
  return acos(scalar_product(v1, v2) / (calc_length(v1) * calc_length(v2)));
}

PVector calc_gravitypoint(PVector p1, PVector p2, PVector p3) {
  return new PVector((p1.x+p2.x+p3.x) / 3.0, (p1.y+p2.y+p3.y) / 3.0);
}

PVector calc_distance_over_time(PVector p, PVector v, int time) {
  PVector scalev = scale(v, 2);
  return new PVector((p.x+scalev.x)*time, (p.y+scalev.y)*time);
}

float scalar_product(PVector v1, PVector v2) {
  return v1.x*v2.x+v1.y*v2.y;
}

PVector scale(PVector v, int factor) {
  return new PVector(v.x*factor, v.y*factor);
}

PVector normalize(PVector v) {
  float vlength = calc_length(v);
  return new PVector((1/vlength)*v.x, (1/vlength)*v.y);
}

boolean is_orthogonal(PVector v1, PVector v2) {
  if (scalar_product(v1, v2) == 0) {
    return true;
  } else {
    return false;
  }
}
