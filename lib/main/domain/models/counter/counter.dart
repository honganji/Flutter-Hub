import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter.freezed.dart';

@freezed
class Counter with _$Counter {
  const factory Counter({
    required int value,
    required void Function() increment,
    required void Function() decrement,
  }) = _Counter;
}
