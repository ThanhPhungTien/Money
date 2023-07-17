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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$SearchEventSearchCopyWith<$Res> {
  factory _$$SearchEventSearchCopyWith(
          _$SearchEventSearch value, $Res Function(_$SearchEventSearch) then) =
      __$$SearchEventSearchCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchEventSearchCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SearchEventSearch>
    implements _$$SearchEventSearchCopyWith<$Res> {
  __$$SearchEventSearchCopyWithImpl(
      _$SearchEventSearch _value, $Res Function(_$SearchEventSearch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchEventSearch(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchEventSearch implements SearchEventSearch {
  const _$SearchEventSearch({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'SearchEvent.search(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchEventSearch &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchEventSearchCopyWith<_$SearchEventSearch> get copyWith =>
      __$$SearchEventSearchCopyWithImpl<_$SearchEventSearch>(this, _$identity);

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
      _$SearchEventSearch;

  String get query;
  @JsonKey(ignore: true)
  _$$SearchEventSearchCopyWith<_$SearchEventSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchEventUpdateMonthCopyWith<$Res> {
  factory _$$SearchEventUpdateMonthCopyWith(_$SearchEventUpdateMonth value,
          $Res Function(_$SearchEventUpdateMonth) then) =
      __$$SearchEventUpdateMonthCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime dateTime});
}

/// @nodoc
class __$$SearchEventUpdateMonthCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SearchEventUpdateMonth>
    implements _$$SearchEventUpdateMonthCopyWith<$Res> {
  __$$SearchEventUpdateMonthCopyWithImpl(_$SearchEventUpdateMonth _value,
      $Res Function(_$SearchEventUpdateMonth) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
  }) {
    return _then(_$SearchEventUpdateMonth(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$SearchEventUpdateMonth implements SearchEventUpdateMonth {
  const _$SearchEventUpdateMonth({required this.dateTime});

  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'SearchEvent.updateMonth(dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchEventUpdateMonth &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchEventUpdateMonthCopyWith<_$SearchEventUpdateMonth> get copyWith =>
      __$$SearchEventUpdateMonthCopyWithImpl<_$SearchEventUpdateMonth>(
          this, _$identity);

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
      _$SearchEventUpdateMonth;

  DateTime get dateTime;
  @JsonKey(ignore: true)
  _$$SearchEventUpdateMonthCopyWith<_$SearchEventUpdateMonth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchEventUpdateUseForCopyWith<$Res> {
  factory _$$SearchEventUpdateUseForCopyWith(_$SearchEventUpdateUseFor value,
          $Res Function(_$SearchEventUpdateUseFor) then) =
      __$$SearchEventUpdateUseForCopyWithImpl<$Res>;
  @useResult
  $Res call({int useFor});
}

/// @nodoc
class __$$SearchEventUpdateUseForCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SearchEventUpdateUseFor>
    implements _$$SearchEventUpdateUseForCopyWith<$Res> {
  __$$SearchEventUpdateUseForCopyWithImpl(_$SearchEventUpdateUseFor _value,
      $Res Function(_$SearchEventUpdateUseFor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useFor = null,
  }) {
    return _then(_$SearchEventUpdateUseFor(
      useFor: null == useFor
          ? _value.useFor
          : useFor // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SearchEventUpdateUseFor implements SearchEventUpdateUseFor {
  const _$SearchEventUpdateUseFor({required this.useFor});

  @override
  final int useFor;

  @override
  String toString() {
    return 'SearchEvent.updateUseFor(useFor: $useFor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchEventUpdateUseFor &&
            (identical(other.useFor, useFor) || other.useFor == useFor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, useFor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchEventUpdateUseForCopyWith<_$SearchEventUpdateUseFor> get copyWith =>
      __$$SearchEventUpdateUseForCopyWithImpl<_$SearchEventUpdateUseFor>(
          this, _$identity);

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
      _$SearchEventUpdateUseFor;

  int get useFor;
  @JsonKey(ignore: true)
  _$$SearchEventUpdateUseForCopyWith<_$SearchEventUpdateUseFor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchEventUpdateGroupCopyWith<$Res> {
  factory _$$SearchEventUpdateGroupCopyWith(_$SearchEventUpdateGroup value,
          $Res Function(_$SearchEventUpdateGroup) then) =
      __$$SearchEventUpdateGroupCopyWithImpl<$Res>;
  @useResult
  $Res call({Group group});

  $GroupCopyWith<$Res> get group;
}

/// @nodoc
class __$$SearchEventUpdateGroupCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SearchEventUpdateGroup>
    implements _$$SearchEventUpdateGroupCopyWith<$Res> {
  __$$SearchEventUpdateGroupCopyWithImpl(_$SearchEventUpdateGroup _value,
      $Res Function(_$SearchEventUpdateGroup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = null,
  }) {
    return _then(_$SearchEventUpdateGroup(
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

class _$SearchEventUpdateGroup implements SearchEventUpdateGroup {
  const _$SearchEventUpdateGroup({required this.group});

  @override
  final Group group;

  @override
  String toString() {
    return 'SearchEvent.updateGroup(group: $group)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchEventUpdateGroup &&
            (identical(other.group, group) || other.group == group));
  }

  @override
  int get hashCode => Object.hash(runtimeType, group);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchEventUpdateGroupCopyWith<_$SearchEventUpdateGroup> get copyWith =>
      __$$SearchEventUpdateGroupCopyWithImpl<_$SearchEventUpdateGroup>(
          this, _$identity);

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
      _$SearchEventUpdateGroup;

  Group get group;
  @JsonKey(ignore: true)
  _$$SearchEventUpdateGroupCopyWith<_$SearchEventUpdateGroup> get copyWith =>
      throw _privateConstructorUsedError;
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
abstract class _$$SearchStateNormalCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$SearchStateNormalCopyWith(
          _$SearchStateNormal value, $Res Function(_$SearchStateNormal) then) =
      __$$SearchStateNormalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TransactionModel> data, int month, Group group, int useFor});

  @override
  $GroupCopyWith<$Res> get group;
}

/// @nodoc
class __$$SearchStateNormalCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateNormal>
    implements _$$SearchStateNormalCopyWith<$Res> {
  __$$SearchStateNormalCopyWithImpl(
      _$SearchStateNormal _value, $Res Function(_$SearchStateNormal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? month = null,
    Object? group = null,
    Object? useFor = null,
  }) {
    return _then(_$SearchStateNormal(
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

class _$SearchStateNormal implements SearchStateNormal {
  const _$SearchStateNormal(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateNormal &&
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
  _$$SearchStateNormalCopyWith<_$SearchStateNormal> get copyWith =>
      __$$SearchStateNormalCopyWithImpl<_$SearchStateNormal>(this, _$identity);

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
      final int useFor}) = _$SearchStateNormal;

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
  _$$SearchStateNormalCopyWith<_$SearchStateNormal> get copyWith =>
      throw _privateConstructorUsedError;
}
