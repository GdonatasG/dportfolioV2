// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'wrapper_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WrapperEventTearOff {
  const _$WrapperEventTearOff();

  TutorialCheckRequest tutorialCheckRequest() {
    return const TutorialCheckRequest();
  }

  TutorialCompleted tutorialCompleted() {
    return const TutorialCompleted();
  }
}

/// @nodoc
const $WrapperEvent = _$WrapperEventTearOff();

/// @nodoc
mixin _$WrapperEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() tutorialCheckRequest,
    required TResult Function() tutorialCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? tutorialCheckRequest,
    TResult Function()? tutorialCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? tutorialCheckRequest,
    TResult Function()? tutorialCompleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TutorialCheckRequest value) tutorialCheckRequest,
    required TResult Function(TutorialCompleted value) tutorialCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TutorialCheckRequest value)? tutorialCheckRequest,
    TResult Function(TutorialCompleted value)? tutorialCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TutorialCheckRequest value)? tutorialCheckRequest,
    TResult Function(TutorialCompleted value)? tutorialCompleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WrapperEventCopyWith<$Res> {
  factory $WrapperEventCopyWith(
          WrapperEvent value, $Res Function(WrapperEvent) then) =
      _$WrapperEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$WrapperEventCopyWithImpl<$Res> implements $WrapperEventCopyWith<$Res> {
  _$WrapperEventCopyWithImpl(this._value, this._then);

  final WrapperEvent _value;
  // ignore: unused_field
  final $Res Function(WrapperEvent) _then;
}

/// @nodoc
abstract class $TutorialCheckRequestCopyWith<$Res> {
  factory $TutorialCheckRequestCopyWith(TutorialCheckRequest value,
          $Res Function(TutorialCheckRequest) then) =
      _$TutorialCheckRequestCopyWithImpl<$Res>;
}

/// @nodoc
class _$TutorialCheckRequestCopyWithImpl<$Res>
    extends _$WrapperEventCopyWithImpl<$Res>
    implements $TutorialCheckRequestCopyWith<$Res> {
  _$TutorialCheckRequestCopyWithImpl(
      TutorialCheckRequest _value, $Res Function(TutorialCheckRequest) _then)
      : super(_value, (v) => _then(v as TutorialCheckRequest));

  @override
  TutorialCheckRequest get _value => super._value as TutorialCheckRequest;
}

/// @nodoc

class _$TutorialCheckRequest implements TutorialCheckRequest {
  const _$TutorialCheckRequest();

  @override
  String toString() {
    return 'WrapperEvent.tutorialCheckRequest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TutorialCheckRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() tutorialCheckRequest,
    required TResult Function() tutorialCompleted,
  }) {
    return tutorialCheckRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? tutorialCheckRequest,
    TResult Function()? tutorialCompleted,
  }) {
    return tutorialCheckRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? tutorialCheckRequest,
    TResult Function()? tutorialCompleted,
    required TResult orElse(),
  }) {
    if (tutorialCheckRequest != null) {
      return tutorialCheckRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TutorialCheckRequest value) tutorialCheckRequest,
    required TResult Function(TutorialCompleted value) tutorialCompleted,
  }) {
    return tutorialCheckRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TutorialCheckRequest value)? tutorialCheckRequest,
    TResult Function(TutorialCompleted value)? tutorialCompleted,
  }) {
    return tutorialCheckRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TutorialCheckRequest value)? tutorialCheckRequest,
    TResult Function(TutorialCompleted value)? tutorialCompleted,
    required TResult orElse(),
  }) {
    if (tutorialCheckRequest != null) {
      return tutorialCheckRequest(this);
    }
    return orElse();
  }
}

abstract class TutorialCheckRequest implements WrapperEvent {
  const factory TutorialCheckRequest() = _$TutorialCheckRequest;
}

/// @nodoc
abstract class $TutorialCompletedCopyWith<$Res> {
  factory $TutorialCompletedCopyWith(
          TutorialCompleted value, $Res Function(TutorialCompleted) then) =
      _$TutorialCompletedCopyWithImpl<$Res>;
}

/// @nodoc
class _$TutorialCompletedCopyWithImpl<$Res>
    extends _$WrapperEventCopyWithImpl<$Res>
    implements $TutorialCompletedCopyWith<$Res> {
  _$TutorialCompletedCopyWithImpl(
      TutorialCompleted _value, $Res Function(TutorialCompleted) _then)
      : super(_value, (v) => _then(v as TutorialCompleted));

  @override
  TutorialCompleted get _value => super._value as TutorialCompleted;
}

/// @nodoc

class _$TutorialCompleted implements TutorialCompleted {
  const _$TutorialCompleted();

  @override
  String toString() {
    return 'WrapperEvent.tutorialCompleted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TutorialCompleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() tutorialCheckRequest,
    required TResult Function() tutorialCompleted,
  }) {
    return tutorialCompleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? tutorialCheckRequest,
    TResult Function()? tutorialCompleted,
  }) {
    return tutorialCompleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? tutorialCheckRequest,
    TResult Function()? tutorialCompleted,
    required TResult orElse(),
  }) {
    if (tutorialCompleted != null) {
      return tutorialCompleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TutorialCheckRequest value) tutorialCheckRequest,
    required TResult Function(TutorialCompleted value) tutorialCompleted,
  }) {
    return tutorialCompleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TutorialCheckRequest value)? tutorialCheckRequest,
    TResult Function(TutorialCompleted value)? tutorialCompleted,
  }) {
    return tutorialCompleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TutorialCheckRequest value)? tutorialCheckRequest,
    TResult Function(TutorialCompleted value)? tutorialCompleted,
    required TResult orElse(),
  }) {
    if (tutorialCompleted != null) {
      return tutorialCompleted(this);
    }
    return orElse();
  }
}

abstract class TutorialCompleted implements WrapperEvent {
  const factory TutorialCompleted() = _$TutorialCompleted;
}

/// @nodoc
class _$WrapperStateTearOff {
  const _$WrapperStateTearOff();

  Initial initial() {
    return const Initial();
  }

  Tutorial tutorial() {
    return const Tutorial();
  }

  AfterTutorial afterTutorial() {
    return const AfterTutorial();
  }
}

/// @nodoc
const $WrapperState = _$WrapperStateTearOff();

/// @nodoc
mixin _$WrapperState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() tutorial,
    required TResult Function() afterTutorial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? tutorial,
    TResult Function()? afterTutorial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? tutorial,
    TResult Function()? afterTutorial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Tutorial value) tutorial,
    required TResult Function(AfterTutorial value) afterTutorial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Tutorial value)? tutorial,
    TResult Function(AfterTutorial value)? afterTutorial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Tutorial value)? tutorial,
    TResult Function(AfterTutorial value)? afterTutorial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WrapperStateCopyWith<$Res> {
  factory $WrapperStateCopyWith(
          WrapperState value, $Res Function(WrapperState) then) =
      _$WrapperStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$WrapperStateCopyWithImpl<$Res> implements $WrapperStateCopyWith<$Res> {
  _$WrapperStateCopyWithImpl(this._value, this._then);

  final WrapperState _value;
  // ignore: unused_field
  final $Res Function(WrapperState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$WrapperStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'WrapperState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() tutorial,
    required TResult Function() afterTutorial,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? tutorial,
    TResult Function()? afterTutorial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? tutorial,
    TResult Function()? afterTutorial,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Tutorial value) tutorial,
    required TResult Function(AfterTutorial value) afterTutorial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Tutorial value)? tutorial,
    TResult Function(AfterTutorial value)? afterTutorial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Tutorial value)? tutorial,
    TResult Function(AfterTutorial value)? afterTutorial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements WrapperState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $TutorialCopyWith<$Res> {
  factory $TutorialCopyWith(Tutorial value, $Res Function(Tutorial) then) =
      _$TutorialCopyWithImpl<$Res>;
}

/// @nodoc
class _$TutorialCopyWithImpl<$Res> extends _$WrapperStateCopyWithImpl<$Res>
    implements $TutorialCopyWith<$Res> {
  _$TutorialCopyWithImpl(Tutorial _value, $Res Function(Tutorial) _then)
      : super(_value, (v) => _then(v as Tutorial));

  @override
  Tutorial get _value => super._value as Tutorial;
}

/// @nodoc

class _$Tutorial implements Tutorial {
  const _$Tutorial();

  @override
  String toString() {
    return 'WrapperState.tutorial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Tutorial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() tutorial,
    required TResult Function() afterTutorial,
  }) {
    return tutorial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? tutorial,
    TResult Function()? afterTutorial,
  }) {
    return tutorial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? tutorial,
    TResult Function()? afterTutorial,
    required TResult orElse(),
  }) {
    if (tutorial != null) {
      return tutorial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Tutorial value) tutorial,
    required TResult Function(AfterTutorial value) afterTutorial,
  }) {
    return tutorial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Tutorial value)? tutorial,
    TResult Function(AfterTutorial value)? afterTutorial,
  }) {
    return tutorial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Tutorial value)? tutorial,
    TResult Function(AfterTutorial value)? afterTutorial,
    required TResult orElse(),
  }) {
    if (tutorial != null) {
      return tutorial(this);
    }
    return orElse();
  }
}

abstract class Tutorial implements WrapperState {
  const factory Tutorial() = _$Tutorial;
}

/// @nodoc
abstract class $AfterTutorialCopyWith<$Res> {
  factory $AfterTutorialCopyWith(
          AfterTutorial value, $Res Function(AfterTutorial) then) =
      _$AfterTutorialCopyWithImpl<$Res>;
}

/// @nodoc
class _$AfterTutorialCopyWithImpl<$Res> extends _$WrapperStateCopyWithImpl<$Res>
    implements $AfterTutorialCopyWith<$Res> {
  _$AfterTutorialCopyWithImpl(
      AfterTutorial _value, $Res Function(AfterTutorial) _then)
      : super(_value, (v) => _then(v as AfterTutorial));

  @override
  AfterTutorial get _value => super._value as AfterTutorial;
}

/// @nodoc

class _$AfterTutorial implements AfterTutorial {
  const _$AfterTutorial();

  @override
  String toString() {
    return 'WrapperState.afterTutorial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AfterTutorial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() tutorial,
    required TResult Function() afterTutorial,
  }) {
    return afterTutorial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? tutorial,
    TResult Function()? afterTutorial,
  }) {
    return afterTutorial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? tutorial,
    TResult Function()? afterTutorial,
    required TResult orElse(),
  }) {
    if (afterTutorial != null) {
      return afterTutorial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Tutorial value) tutorial,
    required TResult Function(AfterTutorial value) afterTutorial,
  }) {
    return afterTutorial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Tutorial value)? tutorial,
    TResult Function(AfterTutorial value)? afterTutorial,
  }) {
    return afterTutorial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Tutorial value)? tutorial,
    TResult Function(AfterTutorial value)? afterTutorial,
    required TResult orElse(),
  }) {
    if (afterTutorial != null) {
      return afterTutorial(this);
    }
    return orElse();
  }
}

abstract class AfterTutorial implements WrapperState {
  const factory AfterTutorial() = _$AfterTutorial;
}
