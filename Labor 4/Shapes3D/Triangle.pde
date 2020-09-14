class Triangle {
  private PVector[] cornerPoints = new PVector[3];

  public Triangle(PVector[] cornerPoints) {
    setPoints(cornerPoints);
  }
  public Triangle(PVector cornerPoint1, PVector cornerPoint2, PVector cornerPoint3) {
    setPoints(cornerPoint1, cornerPoint2, cornerPoint3);
  }
  public void setPoints(PVector[] cornerPoints) {
    this.cornerPoints=cornerPoints;
  }
  public void setPoints(PVector cornerPoint1, PVector cornerPoint2, PVector cornerPoint3) {
    this.cornerPoints[0]=cornerPoint1;
    this.cornerPoints[1]=cornerPoint2;
    this.cornerPoints[2]=cornerPoint3;
  }
  public PVector[] getPoints() {
    return cornerPoints;
  }
}
