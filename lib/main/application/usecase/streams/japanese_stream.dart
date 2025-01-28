final List<String> hiraganaList = List.generate(
  'ん'.codeUnitAt(0) - 'あ'.codeUnitAt(0) + 1,
  (index) => String.fromCharCode('あ'.codeUnitAt(0) + index),
);

final Stream<String> hiraganaStream = Stream<String>.periodic(
  const Duration(seconds: 1),
  (index) => hiraganaList[index % hiraganaList.length],
);
