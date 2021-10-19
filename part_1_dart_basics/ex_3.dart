List<num> parseDigits(String str) {
  List<num> result = [];
  List<String> splitedStr = str.split(' ');
  splitedStr.forEach((element) {
    try {
      result.add(num.parse(element));
    } catch (e) {
      //print(e);
    }
  });
  return result;
}

void main() {
  String str = '1 sc 23.4 12 wdc edv c c 3 0.1 .9 f.12 1e10';
  print('${parseDigits(str)}');
}
