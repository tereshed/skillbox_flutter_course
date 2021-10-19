import 'dart:math';

List<int> decimalToBinary(int number) {
  int remainder = number;
  int mod = number;
  List<int> result = [];
  while (mod > 1) {
    remainder = mod % 2;
    mod = mod ~/ 2;
    result.add(remainder);
  }
  result.add(mod % 2);
  return List.from(result.reversed);
}

num binaryToDecimal(List<int> list) {
  num result = 0;
  int list_len = list.length - 1;
  for (int i = list_len; i >= 0; i--) {
    if (list[i] > 1 || list[i] < 0) {
      throw Exception("List should contains only 0 or 1");
    }
    result += pow(2, list_len - i) * list[i];
  }
  return result;
}

void main() {
  int init_value = 10;
  print('Init Value: $init_value');
  print('decimalToBinary(${init_value}): ${decimalToBinary(init_value)}');
  print(
      'binaryToDecimal(${decimalToBinary(init_value)}): ${binaryToDecimal(decimalToBinary(init_value))}');
}
