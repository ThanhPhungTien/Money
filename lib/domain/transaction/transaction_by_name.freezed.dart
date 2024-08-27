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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionByName _$TransactionByNameFromJson(Map<String, dynamic> json) {
  return _TransactionByName.fromJson(json);
}

/// @nodoc
mixin _$TransactionByName {
  String get name => throw _privateConstructorUsedError;
  List<TransactionModel> get data => throw _privateConstructorUsedError;
  int get totalValue => throw _privateConstructorUsedError;
  bool get isOpen => throw _privateConstructorUsedError;

  /// Serializes this TransactionByName to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionByName
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionByNameCopyWith<TransactionByName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionByNameCopyWith<$Res> {
  factory $TransactionByNameCopyWith(
          TransactionByName value, $Res Function(TransactionByName) then) =
      _$TransactionByNameCopyWithImpl<$Res, TransactionByName>;
  @useResult
  $Res call(
      {String name, List<TransactionModel> data, int totalValue, bool isOpen});
}

/// @nodoc
class _$TransactionByNameCopyWithImpl<$Res, $Val extends TransactionByName>
    implements $TransactionByNameCopyWith<$Res> {
  _$TransactionByNameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionByName
  /// with the given fields replaced by the non-null parameter values.
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
              as List<TransactionModel>,
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
abstract class _$$TransactionByNameImplCopyWith<$Res>
    implements $TransactionByNameCopyWith<$Res> {
  factory _$$TransactionByNameImplCopyWith(_$TransactionByNameImpl value,
          $Res Function(_$TransactionByNameImpl) then) =
      __$$TransactionByNameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, List<TransactionModel> data, int totalValue, bool isOpen});
}

/// @nodoc
class __$$TransactionByNameImplCopyWithImpl<$Res>
    extends _$TransactionByNameCopyWithImpl<$Res, _$TransactionByNameImpl>
    implements _$$TransactionByNameImplCopyWith<$Res> {
  __$$TransactionByNameImplCopyWithImpl(_$TransactionByNameImpl _value,
      $Res Function(_$TransactionByNameImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionByName
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? data = null,
    Object? totalValue = null,
    Object? isOpen = null,
  }) {
    return _then(_$TransactionByNameImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
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
class _$TransactionByNameImpl implements _TransactionByName {
  const _$TransactionByNameImpl(
      {this.name = '',
      final List<TransactionModel> data = const <TransactionModel>[],
      this.totalValue = 0,
      this.isOpen = false})
      : _data = data;

  factory _$TransactionByNameImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionByNameImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  final List<TransactionModel> _data;
  @override
  @JsonKey()
  List<TransactionModel> get data {
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionByNameImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name,
      const DeepCollectionEquality().hash(_data), totalValue, isOpen);

  /// Create a copy of TransactionByName
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionByNameImplCopyWith<_$TransactionByNameImpl> get copyWith =>
      __$$TransactionByNameImplCopyWithImpl<_$TransactionByNameImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionByNameImplToJson(
      this,
    );
  }
}

abstract class _TransactionByName implements TransactionByName {
  const factory _TransactionByName(
      {final String name,
      final List<TransactionModel> data,
      final int totalValue,
      final bool isOpen}) = _$TransactionByNameImpl;

  factory _TransactionByName.fromJson(Map<String, dynamic> json) =
      _$TransactionByNameImpl.fromJson;

  @override
  String get name;
  @override
  List<TransactionModel> get data;
  @override
  int get totalValue;
  @override
  bool get isOpen;

  /// Create a copy of TransactionByName
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionByNameImplCopyWith<_$TransactionByNameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
