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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$CreateGroupEventInitImplCopyWith<$Res> {
  factory _$$CreateGroupEventInitImplCopyWith(_$CreateGroupEventInitImpl value,
          $Res Function(_$CreateGroupEventInitImpl) then) =
      __$$CreateGroupEventInitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateGroupEventInitImplCopyWithImpl<$Res>
    extends _$CreateGroupEventCopyWithImpl<$Res, _$CreateGroupEventInitImpl>
    implements _$$CreateGroupEventInitImplCopyWith<$Res> {
  __$$CreateGroupEventInitImplCopyWithImpl(_$CreateGroupEventInitImpl _value,
      $Res Function(_$CreateGroupEventInitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateGroupEventInitImpl implements CreateGroupEventInit {
  const _$CreateGroupEventInitImpl();

  @override
  String toString() {
    return 'CreateGroupEvent.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateGroupEventInitImpl);
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
  const factory CreateGroupEventInit() = _$CreateGroupEventInitImpl;
}

/// @nodoc
abstract class _$$CreateGroupEventUpdateCheckImplCopyWith<$Res> {
  factory _$$CreateGroupEventUpdateCheckImplCopyWith(
          _$CreateGroupEventUpdateCheckImpl value,
          $Res Function(_$CreateGroupEventUpdateCheckImpl) then) =
      __$$CreateGroupEventUpdateCheckImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool paid});
}

/// @nodoc
class __$$CreateGroupEventUpdateCheckImplCopyWithImpl<$Res>
    extends _$CreateGroupEventCopyWithImpl<$Res,
        _$CreateGroupEventUpdateCheckImpl>
    implements _$$CreateGroupEventUpdateCheckImplCopyWith<$Res> {
  __$$CreateGroupEventUpdateCheckImplCopyWithImpl(
      _$CreateGroupEventUpdateCheckImpl _value,
      $Res Function(_$CreateGroupEventUpdateCheckImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paid = null,
  }) {
    return _then(_$CreateGroupEventUpdateCheckImpl(
      null == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CreateGroupEventUpdateCheckImpl implements CreateGroupEventUpdateCheck {
  const _$CreateGroupEventUpdateCheckImpl(this.paid);

  @override
  final bool paid;

  @override
  String toString() {
    return 'CreateGroupEvent.updateCheck(paid: $paid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateGroupEventUpdateCheckImpl &&
            (identical(other.paid, paid) || other.paid == paid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateGroupEventUpdateCheckImplCopyWith<_$CreateGroupEventUpdateCheckImpl>
      get copyWith => __$$CreateGroupEventUpdateCheckImplCopyWithImpl<
          _$CreateGroupEventUpdateCheckImpl>(this, _$identity);

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
      _$CreateGroupEventUpdateCheckImpl;

  bool get paid;
  @JsonKey(ignore: true)
  _$$CreateGroupEventUpdateCheckImplCopyWith<_$CreateGroupEventUpdateCheckImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateGroupEventSaveImplCopyWith<$Res> {
  factory _$$CreateGroupEventSaveImplCopyWith(_$CreateGroupEventSaveImpl value,
          $Res Function(_$CreateGroupEventSaveImpl) then) =
      __$$CreateGroupEventSaveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Group group});

  $GroupCopyWith<$Res> get group;
}

/// @nodoc
class __$$CreateGroupEventSaveImplCopyWithImpl<$Res>
    extends _$CreateGroupEventCopyWithImpl<$Res, _$CreateGroupEventSaveImpl>
    implements _$$CreateGroupEventSaveImplCopyWith<$Res> {
  __$$CreateGroupEventSaveImplCopyWithImpl(_$CreateGroupEventSaveImpl _value,
      $Res Function(_$CreateGroupEventSaveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = null,
  }) {
    return _then(_$CreateGroupEventSaveImpl(
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

class _$CreateGroupEventSaveImpl implements CreateGroupEventSave {
  const _$CreateGroupEventSaveImpl(this.group);

  @override
  final Group group;

  @override
  String toString() {
    return 'CreateGroupEvent.save(group: $group)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateGroupEventSaveImpl &&
            (identical(other.group, group) || other.group == group));
  }

  @override
  int get hashCode => Object.hash(runtimeType, group);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateGroupEventSaveImplCopyWith<_$CreateGroupEventSaveImpl>
      get copyWith =>
          __$$CreateGroupEventSaveImplCopyWithImpl<_$CreateGroupEventSaveImpl>(
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
      _$CreateGroupEventSaveImpl;

  Group get group;
  @JsonKey(ignore: true)
  _$$CreateGroupEventSaveImplCopyWith<_$CreateGroupEventSaveImpl>
      get copyWith => throw _privateConstructorUsedError;
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
abstract class _$$CreateGroupStateInitialImplCopyWith<$Res> {
  factory _$$CreateGroupStateInitialImplCopyWith(
          _$CreateGroupStateInitialImpl value,
          $Res Function(_$CreateGroupStateInitialImpl) then) =
      __$$CreateGroupStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateGroupStateInitialImplCopyWithImpl<$Res>
    extends _$CreateGroupStateCopyWithImpl<$Res, _$CreateGroupStateInitialImpl>
    implements _$$CreateGroupStateInitialImplCopyWith<$Res> {
  __$$CreateGroupStateInitialImplCopyWithImpl(
      _$CreateGroupStateInitialImpl _value,
      $Res Function(_$CreateGroupStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateGroupStateInitialImpl implements CreateGroupStateInitial {
  const _$CreateGroupStateInitialImpl();

  @override
  String toString() {
    return 'CreateGroupState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateGroupStateInitialImpl);
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
  const factory CreateGroupStateInitial() = _$CreateGroupStateInitialImpl;
}

/// @nodoc
abstract class _$$CreateGroupStateNormalImplCopyWith<$Res> {
  factory _$$CreateGroupStateNormalImplCopyWith(
          _$CreateGroupStateNormalImpl value,
          $Res Function(_$CreateGroupStateNormalImpl) then) =
      __$$CreateGroupStateNormalImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool paid});
}

/// @nodoc
class __$$CreateGroupStateNormalImplCopyWithImpl<$Res>
    extends _$CreateGroupStateCopyWithImpl<$Res, _$CreateGroupStateNormalImpl>
    implements _$$CreateGroupStateNormalImplCopyWith<$Res> {
  __$$CreateGroupStateNormalImplCopyWithImpl(
      _$CreateGroupStateNormalImpl _value,
      $Res Function(_$CreateGroupStateNormalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paid = null,
  }) {
    return _then(_$CreateGroupStateNormalImpl(
      null == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CreateGroupStateNormalImpl implements CreateGroupStateNormal {
  const _$CreateGroupStateNormalImpl(this.paid);

  @override
  final bool paid;

  @override
  String toString() {
    return 'CreateGroupState.normal(paid: $paid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateGroupStateNormalImpl &&
            (identical(other.paid, paid) || other.paid == paid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateGroupStateNormalImplCopyWith<_$CreateGroupStateNormalImpl>
      get copyWith => __$$CreateGroupStateNormalImplCopyWithImpl<
          _$CreateGroupStateNormalImpl>(this, _$identity);

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
      _$CreateGroupStateNormalImpl;

  bool get paid;
  @JsonKey(ignore: true)
  _$$CreateGroupStateNormalImplCopyWith<_$CreateGroupStateNormalImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateGroupStateDoneImplCopyWith<$Res> {
  factory _$$CreateGroupStateDoneImplCopyWith(_$CreateGroupStateDoneImpl value,
          $Res Function(_$CreateGroupStateDoneImpl) then) =
      __$$CreateGroupStateDoneImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateGroupStateDoneImplCopyWithImpl<$Res>
    extends _$CreateGroupStateCopyWithImpl<$Res, _$CreateGroupStateDoneImpl>
    implements _$$CreateGroupStateDoneImplCopyWith<$Res> {
  __$$CreateGroupStateDoneImplCopyWithImpl(_$CreateGroupStateDoneImpl _value,
      $Res Function(_$CreateGroupStateDoneImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateGroupStateDoneImpl implements CreateGroupStateDone {
  const _$CreateGroupStateDoneImpl();

  @override
  String toString() {
    return 'CreateGroupState.done()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateGroupStateDoneImpl);
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
  const factory CreateGroupStateDone() = _$CreateGroupStateDoneImpl;
}
