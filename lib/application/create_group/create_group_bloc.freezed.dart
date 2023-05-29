// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_group_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateGroupEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool paid) updateCheck,
    required TResult Function(Group group) save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool paid)? updateCheck,
    TResult? Function(Group group)? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool paid)? updateCheck,
    TResult Function(Group group)? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGroupEventInit value) init,
    required TResult Function(CreateGroupEventUpdateCheck value) updateCheck,
    required TResult Function(CreateGroupEventSave value) save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateGroupEventInit value)? init,
    TResult? Function(CreateGroupEventUpdateCheck value)? updateCheck,
    TResult? Function(CreateGroupEventSave value)? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateGroupEventInit value)? init,
    TResult Function(CreateGroupEventUpdateCheck value)? updateCheck,
    TResult Function(CreateGroupEventSave value)? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateGroupEventCopyWith<$Res> {
  factory $CreateGroupEventCopyWith(
          CreateGroupEvent value, $Res Function(CreateGroupEvent) then) =
      _$CreateGroupEventCopyWithImpl<$Res, CreateGroupEvent>;
}

/// @nodoc
class _$CreateGroupEventCopyWithImpl<$Res, $Val extends CreateGroupEvent>
    implements $CreateGroupEventCopyWith<$Res> {
  _$CreateGroupEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CreateGroupEventInitCopyWith<$Res> {
  factory _$$CreateGroupEventInitCopyWith(_$CreateGroupEventInit value,
          $Res Function(_$CreateGroupEventInit) then) =
      __$$CreateGroupEventInitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateGroupEventInitCopyWithImpl<$Res>
    extends _$CreateGroupEventCopyWithImpl<$Res, _$CreateGroupEventInit>
    implements _$$CreateGroupEventInitCopyWith<$Res> {
  __$$CreateGroupEventInitCopyWithImpl(_$CreateGroupEventInit _value,
      $Res Function(_$CreateGroupEventInit) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateGroupEventInit implements CreateGroupEventInit {
  const _$CreateGroupEventInit();

  @override
  String toString() {
    return 'CreateGroupEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreateGroupEventInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool paid) updateCheck,
    required TResult Function(Group group) save,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool paid)? updateCheck,
    TResult? Function(Group group)? save,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool paid)? updateCheck,
    TResult Function(Group group)? save,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGroupEventInit value) init,
    required TResult Function(CreateGroupEventUpdateCheck value) updateCheck,
    required TResult Function(CreateGroupEventSave value) save,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateGroupEventInit value)? init,
    TResult? Function(CreateGroupEventUpdateCheck value)? updateCheck,
    TResult? Function(CreateGroupEventSave value)? save,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateGroupEventInit value)? init,
    TResult Function(CreateGroupEventUpdateCheck value)? updateCheck,
    TResult Function(CreateGroupEventSave value)? save,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class CreateGroupEventInit implements CreateGroupEvent {
  const factory CreateGroupEventInit() = _$CreateGroupEventInit;
}

/// @nodoc
abstract class _$$CreateGroupEventUpdateCheckCopyWith<$Res> {
  factory _$$CreateGroupEventUpdateCheckCopyWith(
          _$CreateGroupEventUpdateCheck value,
          $Res Function(_$CreateGroupEventUpdateCheck) then) =
      __$$CreateGroupEventUpdateCheckCopyWithImpl<$Res>;
  @useResult
  $Res call({bool paid});
}

/// @nodoc
class __$$CreateGroupEventUpdateCheckCopyWithImpl<$Res>
    extends _$CreateGroupEventCopyWithImpl<$Res, _$CreateGroupEventUpdateCheck>
    implements _$$CreateGroupEventUpdateCheckCopyWith<$Res> {
  __$$CreateGroupEventUpdateCheckCopyWithImpl(
      _$CreateGroupEventUpdateCheck _value,
      $Res Function(_$CreateGroupEventUpdateCheck) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paid = null,
  }) {
    return _then(_$CreateGroupEventUpdateCheck(
      null == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CreateGroupEventUpdateCheck implements CreateGroupEventUpdateCheck {
  const _$CreateGroupEventUpdateCheck(this.paid);

  @override
  final bool paid;

  @override
  String toString() {
    return 'CreateGroupEvent.updateCheck(paid: $paid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateGroupEventUpdateCheck &&
            (identical(other.paid, paid) || other.paid == paid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateGroupEventUpdateCheckCopyWith<_$CreateGroupEventUpdateCheck>
      get copyWith => __$$CreateGroupEventUpdateCheckCopyWithImpl<
          _$CreateGroupEventUpdateCheck>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool paid) updateCheck,
    required TResult Function(Group group) save,
  }) {
    return updateCheck(paid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool paid)? updateCheck,
    TResult? Function(Group group)? save,
  }) {
    return updateCheck?.call(paid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool paid)? updateCheck,
    TResult Function(Group group)? save,
    required TResult orElse(),
  }) {
    if (updateCheck != null) {
      return updateCheck(paid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGroupEventInit value) init,
    required TResult Function(CreateGroupEventUpdateCheck value) updateCheck,
    required TResult Function(CreateGroupEventSave value) save,
  }) {
    return updateCheck(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateGroupEventInit value)? init,
    TResult? Function(CreateGroupEventUpdateCheck value)? updateCheck,
    TResult? Function(CreateGroupEventSave value)? save,
  }) {
    return updateCheck?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateGroupEventInit value)? init,
    TResult Function(CreateGroupEventUpdateCheck value)? updateCheck,
    TResult Function(CreateGroupEventSave value)? save,
    required TResult orElse(),
  }) {
    if (updateCheck != null) {
      return updateCheck(this);
    }
    return orElse();
  }
}

abstract class CreateGroupEventUpdateCheck implements CreateGroupEvent {
  const factory CreateGroupEventUpdateCheck(final bool paid) =
      _$CreateGroupEventUpdateCheck;

  bool get paid;
  @JsonKey(ignore: true)
  _$$CreateGroupEventUpdateCheckCopyWith<_$CreateGroupEventUpdateCheck>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateGroupEventSaveCopyWith<$Res> {
  factory _$$CreateGroupEventSaveCopyWith(_$CreateGroupEventSave value,
          $Res Function(_$CreateGroupEventSave) then) =
      __$$CreateGroupEventSaveCopyWithImpl<$Res>;
  @useResult
  $Res call({Group group});

  $GroupCopyWith<$Res> get group;
}

/// @nodoc
class __$$CreateGroupEventSaveCopyWithImpl<$Res>
    extends _$CreateGroupEventCopyWithImpl<$Res, _$CreateGroupEventSave>
    implements _$$CreateGroupEventSaveCopyWith<$Res> {
  __$$CreateGroupEventSaveCopyWithImpl(_$CreateGroupEventSave _value,
      $Res Function(_$CreateGroupEventSave) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = null,
  }) {
    return _then(_$CreateGroupEventSave(
      null == group
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

class _$CreateGroupEventSave implements CreateGroupEventSave {
  const _$CreateGroupEventSave(this.group);

  @override
  final Group group;

  @override
  String toString() {
    return 'CreateGroupEvent.save(group: $group)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateGroupEventSave &&
            (identical(other.group, group) || other.group == group));
  }

  @override
  int get hashCode => Object.hash(runtimeType, group);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateGroupEventSaveCopyWith<_$CreateGroupEventSave> get copyWith =>
      __$$CreateGroupEventSaveCopyWithImpl<_$CreateGroupEventSave>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool paid) updateCheck,
    required TResult Function(Group group) save,
  }) {
    return save(group);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool paid)? updateCheck,
    TResult? Function(Group group)? save,
  }) {
    return save?.call(group);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool paid)? updateCheck,
    TResult Function(Group group)? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(group);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGroupEventInit value) init,
    required TResult Function(CreateGroupEventUpdateCheck value) updateCheck,
    required TResult Function(CreateGroupEventSave value) save,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateGroupEventInit value)? init,
    TResult? Function(CreateGroupEventUpdateCheck value)? updateCheck,
    TResult? Function(CreateGroupEventSave value)? save,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateGroupEventInit value)? init,
    TResult Function(CreateGroupEventUpdateCheck value)? updateCheck,
    TResult Function(CreateGroupEventSave value)? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class CreateGroupEventSave implements CreateGroupEvent {
  const factory CreateGroupEventSave(final Group group) =
      _$CreateGroupEventSave;

  Group get group;
  @JsonKey(ignore: true)
  _$$CreateGroupEventSaveCopyWith<_$CreateGroupEventSave> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateGroupState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool paid) normal,
    required TResult Function() done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool paid)? normal,
    TResult? Function()? done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool paid)? normal,
    TResult Function()? done,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGroupStateInitial value) initial,
    required TResult Function(CreateGroupStateNormal value) normal,
    required TResult Function(CreateGroupStateDone value) done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateGroupStateInitial value)? initial,
    TResult? Function(CreateGroupStateNormal value)? normal,
    TResult? Function(CreateGroupStateDone value)? done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateGroupStateInitial value)? initial,
    TResult Function(CreateGroupStateNormal value)? normal,
    TResult Function(CreateGroupStateDone value)? done,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateGroupStateCopyWith<$Res> {
  factory $CreateGroupStateCopyWith(
          CreateGroupState value, $Res Function(CreateGroupState) then) =
      _$CreateGroupStateCopyWithImpl<$Res, CreateGroupState>;
}

/// @nodoc
class _$CreateGroupStateCopyWithImpl<$Res, $Val extends CreateGroupState>
    implements $CreateGroupStateCopyWith<$Res> {
  _$CreateGroupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CreateGroupStateInitialCopyWith<$Res> {
  factory _$$CreateGroupStateInitialCopyWith(_$CreateGroupStateInitial value,
          $Res Function(_$CreateGroupStateInitial) then) =
      __$$CreateGroupStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateGroupStateInitialCopyWithImpl<$Res>
    extends _$CreateGroupStateCopyWithImpl<$Res, _$CreateGroupStateInitial>
    implements _$$CreateGroupStateInitialCopyWith<$Res> {
  __$$CreateGroupStateInitialCopyWithImpl(_$CreateGroupStateInitial _value,
      $Res Function(_$CreateGroupStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateGroupStateInitial implements CreateGroupStateInitial {
  const _$CreateGroupStateInitial();

  @override
  String toString() {
    return 'CreateGroupState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateGroupStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool paid) normal,
    required TResult Function() done,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool paid)? normal,
    TResult? Function()? done,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool paid)? normal,
    TResult Function()? done,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGroupStateInitial value) initial,
    required TResult Function(CreateGroupStateNormal value) normal,
    required TResult Function(CreateGroupStateDone value) done,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateGroupStateInitial value)? initial,
    TResult? Function(CreateGroupStateNormal value)? normal,
    TResult? Function(CreateGroupStateDone value)? done,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateGroupStateInitial value)? initial,
    TResult Function(CreateGroupStateNormal value)? normal,
    TResult Function(CreateGroupStateDone value)? done,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CreateGroupStateInitial implements CreateGroupState {
  const factory CreateGroupStateInitial() = _$CreateGroupStateInitial;
}

/// @nodoc
abstract class _$$CreateGroupStateNormalCopyWith<$Res> {
  factory _$$CreateGroupStateNormalCopyWith(_$CreateGroupStateNormal value,
          $Res Function(_$CreateGroupStateNormal) then) =
      __$$CreateGroupStateNormalCopyWithImpl<$Res>;
  @useResult
  $Res call({bool paid});
}

/// @nodoc
class __$$CreateGroupStateNormalCopyWithImpl<$Res>
    extends _$CreateGroupStateCopyWithImpl<$Res, _$CreateGroupStateNormal>
    implements _$$CreateGroupStateNormalCopyWith<$Res> {
  __$$CreateGroupStateNormalCopyWithImpl(_$CreateGroupStateNormal _value,
      $Res Function(_$CreateGroupStateNormal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paid = null,
  }) {
    return _then(_$CreateGroupStateNormal(
      null == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CreateGroupStateNormal implements CreateGroupStateNormal {
  const _$CreateGroupStateNormal(this.paid);

  @override
  final bool paid;

  @override
  String toString() {
    return 'CreateGroupState.normal(paid: $paid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateGroupStateNormal &&
            (identical(other.paid, paid) || other.paid == paid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateGroupStateNormalCopyWith<_$CreateGroupStateNormal> get copyWith =>
      __$$CreateGroupStateNormalCopyWithImpl<_$CreateGroupStateNormal>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool paid) normal,
    required TResult Function() done,
  }) {
    return normal(paid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool paid)? normal,
    TResult? Function()? done,
  }) {
    return normal?.call(paid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool paid)? normal,
    TResult Function()? done,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal(paid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGroupStateInitial value) initial,
    required TResult Function(CreateGroupStateNormal value) normal,
    required TResult Function(CreateGroupStateDone value) done,
  }) {
    return normal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateGroupStateInitial value)? initial,
    TResult? Function(CreateGroupStateNormal value)? normal,
    TResult? Function(CreateGroupStateDone value)? done,
  }) {
    return normal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateGroupStateInitial value)? initial,
    TResult Function(CreateGroupStateNormal value)? normal,
    TResult Function(CreateGroupStateDone value)? done,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal(this);
    }
    return orElse();
  }
}

abstract class CreateGroupStateNormal implements CreateGroupState {
  const factory CreateGroupStateNormal(final bool paid) =
      _$CreateGroupStateNormal;

  bool get paid;
  @JsonKey(ignore: true)
  _$$CreateGroupStateNormalCopyWith<_$CreateGroupStateNormal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateGroupStateDoneCopyWith<$Res> {
  factory _$$CreateGroupStateDoneCopyWith(_$CreateGroupStateDone value,
          $Res Function(_$CreateGroupStateDone) then) =
      __$$CreateGroupStateDoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateGroupStateDoneCopyWithImpl<$Res>
    extends _$CreateGroupStateCopyWithImpl<$Res, _$CreateGroupStateDone>
    implements _$$CreateGroupStateDoneCopyWith<$Res> {
  __$$CreateGroupStateDoneCopyWithImpl(_$CreateGroupStateDone _value,
      $Res Function(_$CreateGroupStateDone) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateGroupStateDone implements CreateGroupStateDone {
  const _$CreateGroupStateDone();

  @override
  String toString() {
    return 'CreateGroupState.done()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreateGroupStateDone);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool paid) normal,
    required TResult Function() done,
  }) {
    return done();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool paid)? normal,
    TResult? Function()? done,
  }) {
    return done?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool paid)? normal,
    TResult Function()? done,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGroupStateInitial value) initial,
    required TResult Function(CreateGroupStateNormal value) normal,
    required TResult Function(CreateGroupStateDone value) done,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateGroupStateInitial value)? initial,
    TResult? Function(CreateGroupStateNormal value)? normal,
    TResult? Function(CreateGroupStateDone value)? done,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateGroupStateInitial value)? initial,
    TResult Function(CreateGroupStateNormal value)? normal,
    TResult Function(CreateGroupStateDone value)? done,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class CreateGroupStateDone implements CreateGroupState {
  const factory CreateGroupStateDone() = _$CreateGroupStateDone;
}
