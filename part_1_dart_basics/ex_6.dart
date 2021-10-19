import 'dart:math';

class Point {
  int x, y, z;
  Point(this.x, this.y, this.z);

  double getEuclidianDistance(Point another) {
    return sqrt(pow(2, another.x - this.x) +
        pow(2, another.y - this.y) +
        pow(2, another.z - this.z));
  }

  factory Point.zero() {
    return Point(0, 0, 0);
  }

  factory Point.ones() {
    return Point(1, 1, 1);
  }
}

void main() {
  Point p1 = Point(0, 0, 0);
  Point p2 = Point(2, 2, 2);
  Point ones = Point.ones();
  print('${p1.getEuclidianDistance(p2)}');
  print('${ones}');
}
