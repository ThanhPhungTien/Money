// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_by_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionByDate _$TransactionByDateFromJson(Map<String, dynamic> json) {
  return _TransactionByDate.fromJson(json);
}

/// @nodoc
mixin _$TransactionByDate {
  String get date => throw _privateConstructorUsedError;
  int get totalValue => throw _privateConstructorUsedError;
  List<TransactionModel> get data => throw _privateConstructorUsedError;

  /// Serializes this TransactionByDate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionByDate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionByDateCopyWith<TransactionByDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionByDateCopyWith<$Res> {
  factory $TransactionByDateCopyWith(
          TransactionByDate value, $Res Function(TransactionByDate) then) =
      _$TransactionByDateCopyWithImpl<$Res, TransactionByDate>;
  @useResult
  $Res call({String date, int totalValue, List<TransactionModel> data});
}

/// @nodoc
class _$TransactionByDateCopyWithImpl<$Res, $Val extends TransactionByDate>
    implements $TransactionByDateCopyWith<$Res> {
  _$TransactionByDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionByDate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? totalValue = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionByDateImplCopyWith<$Res>
    implements $TransactionByDateCopyWith<$Res> {
  factory _$$TransactionByDateImplCopyWith(_$TransactionByDateImpl value,
          $Res Function(_$TransactionByDateImpl) then) =
      __$$TransactionByDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, int totalValue, List<TransactionModel> data});
}

/// @nodoc
class __$$TransactionByDateImplCopyWithImpl<$Res>
    extends _$TransactionByDateCopyWithImpl<$Res, _$TransactionByDateImpl>
    implements _$$TransactionByDateImplCopyWith<$Res> {
  __$$TransactionByDateImplCopyWithImpl(_$TransactionByDateImpl _value,
      $Res Function(_$TransactionByDateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionByDate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? totalValue = null,
    Object? data = null,
  }) {
    return _then(_$TransactionByDateImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionByDateImpl implements _TransactionByDate {
  const _$TransactionByDateImpl(
      {this.date = '',
      this.totalValue = 0,
      final List<TransactionModel> data = const <TransactionModel>[]})
      : _data = data;

  factory _$TransactionByDateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionByDateImplFromJson(json);

  @override
  @JsonKey()
  final String date;
  @override
  @JsonKey()
  final int totalValue;
  final List<TransactionModel> _data;
  @override
  @JsonKey()
  List<TransactionModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'TransactionByDate(date: $date, totalValue: $totalValue, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionByDateImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, totalValue,
      const DeepCollectionEquality().hash(_data));

  /// Create a copy of TransactionByDate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionByDateImplCopyWith<_$TransactionByDateImpl> get copyWith =>
      __$$TransactionByDateImplCopyWithImpl<_$TransactionByDateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionByDateImplToJson(
      this,
    );
  }
}

abstract class _TransactionByDate implements TransactionByDate {
  const factory _TransactionByDate(
      {final String date,
      final int totalValue,
      final List<TransactionModel> data}) = _$TransactionByDateImpl;

  factory _TransactionByDate.fromJson(Map<String, dynamic> json) =
      _$TransactionByDateImpl.fromJson;

  @override
  String get date;
  @override
  int get totalValue;
  @override
  List<TransactionModel> get data;

  /// Create a copy of TransactionByDate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionByDateImplCopyWith<_$TransactionByDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
