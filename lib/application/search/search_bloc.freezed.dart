// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) search,
    required TResult Function(DateTime dateTime) updateMonth,
    required TResult Function(int useFor) updateUseFor,
    required TResult Function(Group group) updateGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? search,
    TResult? Function(DateTime dateTime)? updateMonth,
    TResult? Function(int useFor)? updateUseFor,
    TResult? Function(Group group)? updateGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? search,
    TResult Function(DateTime dateTime)? updateMonth,
    TResult Function(int useFor)? updateUseFor,
    TResult Function(Group group)? updateGroup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchEventSearch value) search,
    required TResult Function(SearchEventUpdateMonth value) updateMonth,
    required TResult Function(SearchEventUpdateUseFor value) updateUseFor,
    required TResult Function(SearchEventUpdateGroup value) updateGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchEventSearch value)? search,
    TResult? Function(SearchEventUpdateMonth value)? updateMonth,
    TResult? Function(SearchEventUpdateUseFor value)? updateUseFor,
    TResult? Function(SearchEventUpdateGroup value)? updateGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchEventSearch value)? search,
    TResult Function(SearchEventUpdateMonth value)? updateMonth,
    TResult Function(SearchEventUpdateUseFor value)? updateUseFor,
    TResult Function(SearchEventUpdateGroup value)? updateGroup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res, SearchEvent>;
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res, $Val extends SearchEvent>
    implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SearchEventSearchImplCopyWith<$Res> {
  factory _$$SearchEventSearchImplCopyWith(_$SearchEventSearchImpl value,
          $Res Function(_$SearchEventSearchImpl) then) =
      __$$SearchEventSearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchEventSearchImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SearchEventSearchImpl>
    implements _$$SearchEventSearchImplCopyWith<$Res> {
  __$$SearchEventSearchImplCopyWithImpl(_$SearchEventSearchImpl _value,
      $Res Function(_$SearchEventSearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchEventSearchImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchEventSearchImpl implements SearchEventSearch {
  const _$SearchEventSearchImpl({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'SearchEvent.search(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchEventSearchImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchEventSearchImplCopyWith<_$SearchEventSearchImpl> get copyWith =>
      __$$SearchEventSearchImplCopyWithImpl<_$SearchEventSearchImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) search,
    required TResult Function(DateTime dateTime) updateMonth,
    required TResult Function(int useFor) updateUseFor,
    required TResult Function(Group group) updateGroup,
  }) {
    return search(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? search,
    TResult? Function(DateTime dateTime)? updateMonth,
    TResult? Function(int useFor)? updateUseFor,
    TResult? Function(Group group)? updateGroup,
  }) {
    return search?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? search,
    TResult Function(DateTime dateTime)? updateMonth,
    TResult Function(int useFor)? updateUseFor,
    TResult Function(Group group)? updateGroup,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchEventSearch value) search,
    required TResult Function(SearchEventUpdateMonth value) updateMonth,
    required TResult Function(SearchEventUpdateUseFor value) updateUseFor,
    required TResult Function(SearchEventUpdateGroup value) updateGroup,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchEventSearch value)? search,
    TResult? Function(SearchEventUpdateMonth value)? updateMonth,
    TResult? Function(SearchEventUpdateUseFor value)? updateUseFor,
    TResult? Function(SearchEventUpdateGroup value)? updateGroup,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchEventSearch value)? search,
    TResult Function(SearchEventUpdateMonth value)? updateMonth,
    TResult Function(SearchEventUpdateUseFor value)? updateUseFor,
    TResult Function(SearchEventUpdateGroup value)? updateGroup,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class SearchEventSearch implements SearchEvent {
  const factory SearchEventSearch({required final String query}) =
      _$SearchEventSearchImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$SearchEventSearchImplCopyWith<_$SearchEventSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchEventUpdateMonthImplCopyWith<$Res> {
  factory _$$SearchEventUpdateMonthImplCopyWith(
          _$SearchEventUpdateMonthImpl value,
          $Res Function(_$SearchEventUpdateMonthImpl) then) =
      __$$SearchEventUpdateMonthImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime dateTime});
}

/// @nodoc
class __$$SearchEventUpdateMonthImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SearchEventUpdateMonthImpl>
    implements _$$SearchEventUpdateMonthImplCopyWith<$Res> {
  __$$SearchEventUpdateMonthImplCopyWithImpl(
      _$SearchEventUpdateMonthImpl _value,
      $Res Function(_$SearchEventUpdateMonthImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
  }) {
    return _then(_$SearchEventUpdateMonthImpl(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$SearchEventUpdateMonthImpl implements SearchEventUpdateMonth {
  const _$SearchEventUpdateMonthImpl({required this.dateTime});

  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'SearchEvent.updateMonth(dateTime: $dateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchEventUpdateMonthImpl &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchEventUpdateMonthImplCopyWith<_$SearchEventUpdateMonthImpl>
      get copyWith => __$$SearchEventUpdateMonthImplCopyWithImpl<
          _$SearchEventUpdateMonthImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) search,
    required TResult Function(DateTime dateTime) updateMonth,
    required TResult Function(int useFor) updateUseFor,
    required TResult Function(Group group) updateGroup,
  }) {
    return updateMonth(dateTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? search,
    TResult? Function(DateTime dateTime)? updateMonth,
    TResult? Function(int useFor)? updateUseFor,
    TResult? Function(Group group)? updateGroup,
  }) {
    return updateMonth?.call(dateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? search,
    TResult Function(DateTime dateTime)? updateMonth,
    TResult Function(int useFor)? updateUseFor,
    TResult Function(Group group)? updateGroup,
    required TResult orElse(),
  }) {
    if (updateMonth != null) {
      return updateMonth(dateTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchEventSearch value) search,
    required TResult Function(SearchEventUpdateMonth value) updateMonth,
    required TResult Function(SearchEventUpdateUseFor value) updateUseFor,
    required TResult Function(SearchEventUpdateGroup value) updateGroup,
  }) {
    return updateMonth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchEventSearch value)? search,
    TResult? Function(SearchEventUpdateMonth value)? updateMonth,
    TResult? Function(SearchEventUpdateUseFor value)? updateUseFor,
    TResult? Function(SearchEventUpdateGroup value)? updateGroup,
  }) {
    return updateMonth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchEventSearch value)? search,
    TResult Function(SearchEventUpdateMonth value)? updateMonth,
    TResult Function(SearchEventUpdateUseFor value)? updateUseFor,
    TResult Function(SearchEventUpdateGroup value)? updateGroup,
    required TResult orElse(),
  }) {
    if (updateMonth != null) {
      return updateMonth(this);
    }
    return orElse();
  }
}

abstract class SearchEventUpdateMonth implements SearchEvent {
  const factory SearchEventUpdateMonth({required final DateTime dateTime}) =
      _$SearchEventUpdateMonthImpl;

  DateTime get dateTime;
  @JsonKey(ignore: true)
  _$$SearchEventUpdateMonthImplCopyWith<_$SearchEventUpdateMonthImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchEventUpdateUseForImplCopyWith<$Res> {
  factory _$$SearchEventUpdateUseForImplCopyWith(
          _$SearchEventUpdateUseForImpl value,
          $Res Function(_$SearchEventUpdateUseForImpl) then) =
      __$$SearchEventUpdateUseForImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int useFor});
}

/// @nodoc
class __$$SearchEventUpdateUseForImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SearchEventUpdateUseForImpl>
    implements _$$SearchEventUpdateUseForImplCopyWith<$Res> {
  __$$SearchEventUpdateUseForImplCopyWithImpl(
      _$SearchEventUpdateUseForImpl _value,
      $Res Function(_$SearchEventUpdateUseForImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useFor = null,
  }) {
    return _then(_$SearchEventUpdateUseForImpl(
      useFor: null == useFor
          ? _value.useFor
          : useFor // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SearchEventUpdateUseForImpl implements SearchEventUpdateUseFor {
  const _$SearchEventUpdateUseForImpl({required this.useFor});

  @override
  final int useFor;

  @override
  String toString() {
    return 'SearchEvent.updateUseFor(useFor: $useFor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchEventUpdateUseForImpl &&
            (identical(other.useFor, useFor) || other.useFor == useFor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, useFor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchEventUpdateUseForImplCopyWith<_$SearchEventUpdateUseForImpl>
      get copyWith => __$$SearchEventUpdateUseForImplCopyWithImpl<
          _$SearchEventUpdateUseForImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) search,
    required TResult Function(DateTime dateTime) updateMonth,
    required TResult Function(int useFor) updateUseFor,
    required TResult Function(Group group) updateGroup,
  }) {
    return updateUseFor(useFor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? search,
    TResult? Function(DateTime dateTime)? updateMonth,
    TResult? Function(int useFor)? updateUseFor,
    TResult? Function(Group group)? updateGroup,
  }) {
    return updateUseFor?.call(useFor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? search,
    TResult Function(DateTime dateTime)? updateMonth,
    TResult Function(int useFor)? updateUseFor,
    TResult Function(Group group)? updateGroup,
    required TResult orElse(),
  }) {
    if (updateUseFor != null) {
      return updateUseFor(useFor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchEventSearch value) search,
    required TResult Function(SearchEventUpdateMonth value) updateMonth,
    required TResult Function(SearchEventUpdateUseFor value) updateUseFor,
    required TResult Function(SearchEventUpdateGroup value) updateGroup,
  }) {
    return updateUseFor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchEventSearch value)? search,
    TResult? Function(SearchEventUpdateMonth value)? updateMonth,
    TResult? Function(SearchEventUpdateUseFor value)? updateUseFor,
    TResult? Function(SearchEventUpdateGroup value)? updateGroup,
  }) {
    return updateUseFor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchEventSearch value)? search,
    TResult Function(SearchEventUpdateMonth value)? updateMonth,
    TResult Function(SearchEventUpdateUseFor value)? updateUseFor,
    TResult Function(SearchEventUpdateGroup value)? updateGroup,
    required TResult orElse(),
  }) {
    if (updateUseFor != null) {
      return updateUseFor(this);
    }
    return orElse();
  }
}

abstract class SearchEventUpdateUseFor implements SearchEvent {
  const factory SearchEventUpdateUseFor({required final int useFor}) =
      _$SearchEventUpdateUseForImpl;

  int get useFor;
  @JsonKey(ignore: true)
  _$$SearchEventUpdateUseForImplCopyWith<_$SearchEventUpdateUseForImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchEventUpdateGroupImplCopyWith<$Res> {
  factory _$$SearchEventUpdateGroupImplCopyWith(
          _$SearchEventUpdateGroupImpl value,
          $Res Function(_$SearchEventUpdateGroupImpl) then) =
      __$$SearchEventUpdateGroupImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Group group});

  $GroupCopyWith<$Res> get group;
}

/// @nodoc
class __$$SearchEventUpdateGroupImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SearchEventUpdateGroupImpl>
    implements _$$SearchEventUpdateGroupImplCopyWith<$Res> {
  __$$SearchEventUpdateGroupImplCopyWithImpl(
      _$SearchEventUpdateGroupImpl _value,
      $Res Function(_$SearchEventUpdateGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = null,
  }) {
    return _then(_$SearchEventUpdateGroupImpl(
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $GroupCopyWith<$Res> get group {
    return $GroupCopyWith<$Res>(_value.group, (value) {
      return _then(_value.copyWith(group: value));
    });
  }
}

/// @nodoc

class _$SearchEventUpdateGroupImpl implements SearchEventUpdateGroup {
  const _$SearchEventUpdateGroupImpl({required this.group});

  @override
  final Group group;

  @override
  String toString() {
    return 'SearchEvent.updateGroup(group: $group)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchEventUpdateGroupImpl &&
            (identical(other.group, group) || other.group == group));
  }

  @override
  int get hashCode => Object.hash(runtimeType, group);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchEventUpdateGroupImplCopyWith<_$SearchEventUpdateGroupImpl>
      get copyWith => __$$SearchEventUpdateGroupImplCopyWithImpl<
          _$SearchEventUpdateGroupImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) search,
    required TResult Function(DateTime dateTime) updateMonth,
    required TResult Function(int useFor) updateUseFor,
    required TResult Function(Group group) updateGroup,
  }) {
    return updateGroup(group);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? search,
    TResult? Function(DateTime dateTime)? updateMonth,
    TResult? Function(int useFor)? updateUseFor,
    TResult? Function(Group group)? updateGroup,
  }) {
    return updateGroup?.call(group);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? search,
    TResult Function(DateTime dateTime)? updateMonth,
    TResult Function(int useFor)? updateUseFor,
    TResult Function(Group group)? updateGroup,
    required TResult orElse(),
  }) {
    if (updateGroup != null) {
      return updateGroup(group);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchEventSearch value) search,
    required TResult Function(SearchEventUpdateMonth value) updateMonth,
    required TResult Function(SearchEventUpdateUseFor value) updateUseFor,
    required TResult Function(SearchEventUpdateGroup value) updateGroup,
  }) {
    return updateGroup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchEventSearch value)? search,
    TResult? Function(SearchEventUpdateMonth value)? updateMonth,
    TResult? Function(SearchEventUpdateUseFor value)? updateUseFor,
    TResult? Function(SearchEventUpdateGroup value)? updateGroup,
  }) {
    return updateGroup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchEventSearch value)? search,
    TResult Function(SearchEventUpdateMonth value)? updateMonth,
    TResult Function(SearchEventUpdateUseFor value)? updateUseFor,
    TResult Function(SearchEventUpdateGroup value)? updateGroup,
    required TResult orElse(),
  }) {
    if (updateGroup != null) {
      return updateGroup(this);
    }
    return orElse();
  }
}

abstract class SearchEventUpdateGroup implements SearchEvent {
  const factory SearchEventUpdateGroup({required final Group group}) =
      _$SearchEventUpdateGroupImpl;

  Group get group;
  @JsonKey(ignore: true)
  _$$SearchEventUpdateGroupImplCopyWith<_$SearchEventUpdateGroupImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchState {
  List<TransactionModel> get data => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  Group get group => throw _privateConstructorUsedError;
  int get useFor => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<TransactionModel> data, int month, Group group, int useFor)
        normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<TransactionModel> data, int month, Group group, int useFor)?
        normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<TransactionModel> data, int month, Group group, int useFor)?
        normal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchStateNormal value) normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchStateNormal value)? normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchStateNormal value)? normal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call({List<TransactionModel> data, int month, Group group, int useFor});

  $GroupCopyWith<$Res> get group;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? month = null,
    Object? group = null,
    Object? useFor = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group,
      useFor: null == useFor
          ? _value.useFor
          : useFor // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GroupCopyWith<$Res> get group {
    return $GroupCopyWith<$Res>(_value.group, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchStateNormalImplCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$SearchStateNormalImplCopyWith(_$SearchStateNormalImpl value,
          $Res Function(_$SearchStateNormalImpl) then) =
      __$$SearchStateNormalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TransactionModel> data, int month, Group group, int useFor});

  @override
  $GroupCopyWith<$Res> get group;
}

/// @nodoc
class __$$SearchStateNormalImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateNormalImpl>
    implements _$$SearchStateNormalImplCopyWith<$Res> {
  __$$SearchStateNormalImplCopyWithImpl(_$SearchStateNormalImpl _value,
      $Res Function(_$SearchStateNormalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? month = null,
    Object? group = null,
    Object? useFor = null,
  }) {
    return _then(_$SearchStateNormalImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group,
      useFor: null == useFor
          ? _value.useFor
          : useFor // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SearchStateNormalImpl implements SearchStateNormal {
  const _$SearchStateNormalImpl(
      {final List<TransactionModel> data = const [],
      this.month = 0,
      this.group = const Group(),
      this.useFor = 0})
      : _data = data;

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
  final int month;
  @override
  @JsonKey()
  final Group group;
  @override
  @JsonKey()
  final int useFor;

  @override
  String toString() {
    return 'SearchState.normal(data: $data, month: $month, group: $group, useFor: $useFor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateNormalImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.useFor, useFor) || other.useFor == useFor));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_data), month, group, useFor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateNormalImplCopyWith<_$SearchStateNormalImpl> get copyWith =>
      __$$SearchStateNormalImplCopyWithImpl<_$SearchStateNormalImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<TransactionModel> data, int month, Group group, int useFor)
        normal,
  }) {
    return normal(data, month, group, useFor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<TransactionModel> data, int month, Group group, int useFor)?
        normal,
  }) {
    return normal?.call(data, month, group, useFor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<TransactionModel> data, int month, Group group, int useFor)?
        normal,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal(data, month, group, useFor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchStateNormal value) normal,
  }) {
    return normal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchStateNormal value)? normal,
  }) {
    return normal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchStateNormal value)? normal,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal(this);
    }
    return orElse();
  }
}

abstract class SearchStateNormal implements SearchState {
  const factory SearchStateNormal(
      {final List<TransactionModel> data,
      final int month,
      final Group group,
      final int useFor}) = _$SearchStateNormalImpl;

  @override
  List<TransactionModel> get data;
  @override
  int get month;
  @override
  Group get group;
  @override
  int get useFor;
  @override
  @JsonKey(ignore: true)
  _$$SearchStateNormalImplCopyWith<_$SearchStateNormalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
