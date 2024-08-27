// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupTransaction _$GroupTransactionFromJson(Map<String, dynamic> json) {
  return _GroupTransaction.fromJson(json);
}

/// @nodoc
mixin _$GroupTransaction {
  String get dateTime => throw _privateConstructorUsedError;
  List<TransactionModel> get data => throw _privateConstructorUsedError;
  int get totalValue => throw _privateConstructorUsedError;

  /// Serializes this GroupTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupTransactionCopyWith<GroupTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupTransactionCopyWith<$Res> {
  factory $GroupTransactionCopyWith(
          GroupTransaction value, $Res Function(GroupTransaction) then) =
      _$GroupTransactionCopyWithImpl<$Res, GroupTransaction>;
  @useResult
  $Res call({String dateTime, List<TransactionModel> data, int totalValue});
}

/// @nodoc
class _$GroupTransactionCopyWithImpl<$Res, $Val extends GroupTransaction>
    implements $GroupTransactionCopyWith<$Res> {
  _$GroupTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? data = null,
    Object? totalValue = null,
  }) {
    return _then(_value.copyWith(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupTransactionImplCopyWith<$Res>
    implements $GroupTransactionCopyWith<$Res> {
  factory _$$GroupTransactionImplCopyWith(_$GroupTransactionImpl value,
          $Res Function(_$GroupTransactionImpl) then) =
      __$$GroupTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String dateTime, List<TransactionModel> data, int totalValue});
}

/// @nodoc
class __$$GroupTransactionImplCopyWithImpl<$Res>
    extends _$GroupTransactionCopyWithImpl<$Res, _$GroupTransactionImpl>
    implements _$$GroupTransactionImplCopyWith<$Res> {
  __$$GroupTransactionImplCopyWithImpl(_$GroupTransactionImpl _value,
      $Res Function(_$GroupTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? data = null,
    Object? totalValue = null,
  }) {
    return _then(_$GroupTransactionImpl(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupTransactionImpl implements _GroupTransaction {
  const _$GroupTransactionImpl(
      {this.dateTime = '',
      final List<TransactionModel> data = const [],
      this.totalValue = 0})
      : _data = data;

  factory _$GroupTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupTransactionImplFromJson(json);

  @override
  @JsonKey()
  final String dateTime;
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
  String toString() {
    return 'GroupTransaction(dateTime: $dateTime, data: $data, totalValue: $totalValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupTransactionImpl &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dateTime,
      const DeepCollectionEquality().hash(_data), totalValue);

  /// Create a copy of GroupTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupTransactionImplCopyWith<_$GroupTransactionImpl> get copyWith =>
      __$$GroupTransactionImplCopyWithImpl<_$GroupTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupTransactionImplToJson(
      this,
    );
  }
}

abstract class _GroupTransaction implements GroupTransaction {
  const factory _GroupTransaction(
      {final String dateTime,
      final List<TransactionModel> data,
      final int totalValue}) = _$GroupTransactionImpl;

  factory _GroupTransaction.fromJson(Map<String, dynamic> json) =
      _$GroupTransactionImpl.fromJson;

  @override
  String get dateTime;
  @override
  List<TransactionModel> get data;
  @override
  int get totalValue;

  /// Create a copy of GroupTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupTransactionImplCopyWith<_$GroupTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
