class DigitMapper {
  Map<String, int> mapper = {
    'zero': 0,
    'one': 1,
    'two': 2,
    'three': 3,
    'four': 4,
    'five': 5,
    'six': 6,
    'seven': 7,
    'eight': 8,
    'nine': 9,
  };

  List<int> mapList(List<String> wordList) {
    List<int> result = [];
    wordList.forEach((element) {
      if (this.mapper.containsKey(element)) {
        if (!result.contains(this.mapper[element])) {
          result.add(this.mapper[element] as int);
        }
      }
    });

    return result;
  }
}

void main() {
  DigitMapper dMapper = DigitMapper();

  List<String> wordList = ['one', 'one', 'two', 'three', 'cat', 'dog'];

  print('${dMapper.mapList(wordList)}');
}
