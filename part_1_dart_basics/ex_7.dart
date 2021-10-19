extension on num {
  num pow(int power) {
    if (power == 0) {
      return 1;
    }
    if (power == 1) {
      return this;
    }

    num result = this;

    if (power < 0) {
      result = 1 / result;
      for (int i = power; i < 0; i++) {
        result *= result;
      }
      return result;
    }

    for (int i = 1; i < power; i++) {
      result *= result;
    }
    return result;
  }

  num getNRoot(int power, num eps) {
    num start = this;
    num next =
        (1 / power) * ((power - 1) * start + this / (this.pow(power - 1)));
    while (start - next > eps) {
      start = next;
      next =
          (1 / power) * ((power - 1) * start + this / (start.pow(power - 1)));
    }
    return start;
  }
}

void main() {
  num x = 9;
  print('${x.pow(-2)}');
  print('${x.getNRoot(2, .0000001)}');
}
