import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../domain/models/counter/counter.dart';

/// カスタムhook生成のためのメソッド
///
/// Counterクラスに対して、useCounterメソッドを生成する。
Counter useCounter() {
  final counter = useState<int>(0);

  void increment() => counter.value++;
  void decrement() => counter.value--;

  return Counter(
    value: counter.value,
    increment: increment,
    decrement: decrement,
  );
}
