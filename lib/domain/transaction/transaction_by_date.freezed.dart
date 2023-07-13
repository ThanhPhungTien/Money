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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionByDate _$TransactionByDateFromJson(Map<String, dynamic> json) {
  return _TransactionByDate.fromJson(json);
}

/// @nodoc
mixin _$TransactionByDate {
  String get date => throw _privateConstructorUsedError;
  int get totalValue => throw _privateConstructorUsedError;
  List<TransactionModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_TransactionByDateCopyWith<$Res>
    implements $TransactionByDateCopyWith<$Res> {
  factory _$$_TransactionByDateCopyWith(_$_TransactionByDate value,
          $Res Function(_$_TransactionByDate) then) =
      __$$_TransactionByDateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, int totalValue, List<TransactionModel> data});
}

/// @nodoc
class __$$_TransactionByDateCopyWithImpl<$Res>
    extends _$TransactionByDateCopyWithImpl<$Res, _$_TransactionByDate>
    implements _$$_TransactionByDateCopyWith<$Res> {
  __$$_TransactionByDateCopyWithImpl(
      _$_TransactionByDate _value, $Res Function(_$_TransactionByDate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? totalValue = null,
    Object? data = null,
  }) {
    return _then(_$_TransactionByDate(
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
class _$_TransactionByDate implements _TransactionByDate {
  const _$_TransactionByDate(
      {this.date = '',
      this.totalValue = 0,
      final List<TransactionModel> data = const <TransactionModel>[]})
      : _data = data;

  factory _$_TransactionByDate.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionByDateFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionByDate &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, totalValue,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionByDateCopyWith<_$_TransactionByDate> get copyWith =>
      __$$_TransactionByDateCopyWithImpl<_$_TransactionByDate>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionByDateToJson(
      this,
    );
  }
}

abstract class _TransactionByDate implements TransactionByDate {
  const factory _TransactionByDate(
      {final String date,
      final int totalValue,
      final List<TransactionModel> data}) = _$_TransactionByDate;

  factory _TransactionByDate.fromJson(Map<String, dynamic> json) =
      _$_TransactionByDate.fromJson;

  @override
  String get date;
  @override
  int get totalValue;
  @override
  List<TransactionModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionByDateCopyWith<_$_TransactionByDate> get copyWith =>
      throw _privateConstructorUsedError;
}
