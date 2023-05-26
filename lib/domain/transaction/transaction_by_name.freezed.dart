// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_by_name.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionByName _$TransactionByNameFromJson(Map<String, dynamic> json) {
  return _TransactionByName.fromJson(json);
}

/// @nodoc
mixin _$TransactionByName {
  String get name => throw _privateConstructorUsedError;
  List<Transaction> get data => throw _privateConstructorUsedError;
  int get totalValue => throw _privateConstructorUsedError;
  bool get isOpen => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionByNameCopyWith<TransactionByName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionByNameCopyWith<$Res> {
  factory $TransactionByNameCopyWith(
          TransactionByName value, $Res Function(TransactionByName) then) =
      _$TransactionByNameCopyWithImpl<$Res, TransactionByName>;
  @useResult
  $Res call({String name, List<Transaction> data, int totalValue, bool isOpen});
}

/// @nodoc
class _$TransactionByNameCopyWithImpl<$Res, $Val extends TransactionByName>
    implements $TransactionByNameCopyWith<$Res> {
  _$TransactionByNameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? data = null,
    Object? totalValue = null,
    Object? isOpen = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as int,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionByNameCopyWith<$Res>
    implements $TransactionByNameCopyWith<$Res> {
  factory _$$_TransactionByNameCopyWith(_$_TransactionByName value,
          $Res Function(_$_TransactionByName) then) =
      __$$_TransactionByNameCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<Transaction> data, int totalValue, bool isOpen});
}

/// @nodoc
class __$$_TransactionByNameCopyWithImpl<$Res>
    extends _$TransactionByNameCopyWithImpl<$Res, _$_TransactionByName>
    implements _$$_TransactionByNameCopyWith<$Res> {
  __$$_TransactionByNameCopyWithImpl(
      _$_TransactionByName _value, $Res Function(_$_TransactionByName) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? data = null,
    Object? totalValue = null,
    Object? isOpen = null,
  }) {
    return _then(_$_TransactionByName(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as int,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionByName implements _TransactionByName {
  const _$_TransactionByName(
      {this.name = '',
      final List<Transaction> data = const <Transaction>[],
      this.totalValue = 0,
      this.isOpen = false})
      : _data = data;

  factory _$_TransactionByName.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionByNameFromJson(json);

  @override
  @JsonKey()
  final String name;
  final List<Transaction> _data;
  @override
  @JsonKey()
  List<Transaction> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final int totalValue;
  @override
  @JsonKey()
  final bool isOpen;

  @override
  String toString() {
    return 'TransactionByName(name: $name, data: $data, totalValue: $totalValue, isOpen: $isOpen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionByName &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name,
      const DeepCollectionEquality().hash(_data), totalValue, isOpen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionByNameCopyWith<_$_TransactionByName> get copyWith =>
      __$$_TransactionByNameCopyWithImpl<_$_TransactionByName>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionByNameToJson(
      this,
    );
  }
}

abstract class _TransactionByName implements TransactionByName {
  const factory _TransactionByName(
      {final String name,
      final List<Transaction> data,
      final int totalValue,
      final bool isOpen}) = _$_TransactionByName;

  factory _TransactionByName.fromJson(Map<String, dynamic> json) =
      _$_TransactionByName.fromJson;

  @override
  String get name;
  @override
  List<Transaction> get data;
  @override
  int get totalValue;
  @override
  bool get isOpen;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionByNameCopyWith<_$_TransactionByName> get copyWith =>
      throw _privateConstructorUsedError;
}
