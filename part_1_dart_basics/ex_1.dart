//1. НОД/НОК/разложение на простые множители
int getNod(int a, int b) {
  int start = a > b ? a : b;
  int end = a <= b ? a : b;
  late int c;
  late int result;

  while (true) {
    c = start % end;
    if (c == 0) {
      result = end;
      break;
    }
    start = end;
    end = c;
  }
  return result;
}

num getNok(int num_1, int num_2) {
  return (num_1 * num_2) / getNod(num_1, num_2);
}

bool isPrimeNumber(int number) {
  bool result = true;
  int counter = 2;
  if (number == 1 || number == 2) {
    return true;
  }

  while (counter < number) {
    if (number % counter == 0) {
      result = false;
    }
    counter += 1;
  }
  return result;
}

List<int> toPrimeNumbers(int num) {
  List<int> result = [];
  int counter = 2;

  if (num == 1) {
    return [1];
  }
  if (num == 2) {
    return [1, 2];
  }
  while (counter <= num) {
    if (isPrimeNumber(counter)) {
      if (num % counter == 0) {
        result.add(counter);
        if (isPrimeNumber(num ~/ counter)) {
          result.add(num ~/ counter);
          return result;
        }
      }
    }
    counter += 1;
  }
  return result;
}

////////////////////////////////

void main() {
  print('${getNod(7, 21)}');
  print('${getNok(7, 21)}');
}
