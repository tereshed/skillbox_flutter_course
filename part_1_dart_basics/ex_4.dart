Map<String, int> countWords(List<String> words) {
  Map<String, int> result = {};
  words.forEach((element) {
    if (!result.containsKey(element)) {
      result[element] = 1;
    } else {
      result.update(element, (value) => value + 1);
    }
  });
  return result;
}

void main() {
  List<String> words = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '3',
    '4',
    '8',
    '9',
    '3'
  ];
  print('${countWords(words)}');
}
