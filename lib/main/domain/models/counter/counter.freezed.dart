// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Counter {
  int get value => throw _privateConstructorUsedError;
  void Function() get increment => throw _privateConstructorUsedError;
  void Function() get decrement => throw _privateConstructorUsedError;

  /// Create a copy of Counter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CounterCopyWith<Counter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterCopyWith<$Res> {
  factory $CounterCopyWith(Counter value, $Res Function(Counter) then) =
      _$CounterCopyWithImpl<$Res, Counter>;
  @useResult
  $Res call({int value, void Function() increment, void Function() decrement});
}

/// @nodoc
class _$CounterCopyWithImpl<$Res, $Val extends Counter>
    implements $CounterCopyWith<$Res> {
  _$CounterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Counter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? increment = null,
    Object? decrement = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      increment: null == increment
          ? _value.increment
          : increment // ignore: cast_nullable_to_non_nullable
              as void Function(),
      decrement: null == decrement
          ? _value.decrement
          : decrement // ignore: cast_nullable_to_non_nullable
              as void Function(),
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CounterImplCopyWith<$Res> implements $CounterCopyWith<$Res> {
  factory _$$CounterImplCopyWith(
          _$CounterImpl value, $Res Function(_$CounterImpl) then) =
      __$$CounterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value, void Function() increment, void Function() decrement});
}

/// @nodoc
class __$$CounterImplCopyWithImpl<$Res>
    extends _$CounterCopyWithImpl<$Res, _$CounterImpl>
    implements _$$CounterImplCopyWith<$Res> {
  __$$CounterImplCopyWithImpl(
      _$CounterImpl _value, $Res Function(_$CounterImpl) _then)
      : super(_value, _then);

  /// Create a copy of Counter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? increment = null,
    Object? decrement = null,
  }) {
    return _then(_$CounterImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      increment: null == increment
          ? _value.increment
          : increment // ignore: cast_nullable_to_non_nullable
              as void Function(),
      decrement: null == decrement
          ? _value.decrement
          : decrement // ignore: cast_nullable_to_non_nullable
              as void Function(),
    ));
  }
}

/// @nodoc

class _$CounterImpl implements _Counter {
  const _$CounterImpl(
      {required this.value, required this.increment, required this.decrement});

  @override
  final int value;
  @override
  final void Function() increment;
  @override
  final void Function() decrement;

  @override
  String toString() {
    return 'Counter(value: $value, increment: $increment, decrement: $decrement)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.increment, increment) ||
                other.increment == increment) &&
            (identical(other.decrement, decrement) ||
                other.decrement == decrement));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, increment, decrement);

  /// Create a copy of Counter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CounterImplCopyWith<_$CounterImpl> get copyWith =>
      __$$CounterImplCopyWithImpl<_$CounterImpl>(this, _$identity);
}

abstract class _Counter implements Counter {
  const factory _Counter(
      {required final int value,
      required final void Function() increment,
      required final void Function() decrement}) = _$CounterImpl;

  @override
  int get value;
  @override
  void Function() get increment;
  @override
  void Function() get decrement;

  /// Create a copy of Counter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CounterImplCopyWith<_$CounterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
