// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'github_user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GithubUserDataTearOff {
  const _$GithubUserDataTearOff();

  _GithubUserData call(
      {required GithubUser user, required List<GithubRepo> repos}) {
    return _GithubUserData(
      user: user,
      repos: repos,
    );
  }
}

/// @nodoc
const $GithubUserData = _$GithubUserDataTearOff();

/// @nodoc
mixin _$GithubUserData {
  GithubUser get user => throw _privateConstructorUsedError;
  List<GithubRepo> get repos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GithubUserDataCopyWith<GithubUserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubUserDataCopyWith<$Res> {
  factory $GithubUserDataCopyWith(
          GithubUserData value, $Res Function(GithubUserData) then) =
      _$GithubUserDataCopyWithImpl<$Res>;
  $Res call({GithubUser user, List<GithubRepo> repos});

  $GithubUserCopyWith<$Res> get user;
}

/// @nodoc
class _$GithubUserDataCopyWithImpl<$Res>
    implements $GithubUserDataCopyWith<$Res> {
  _$GithubUserDataCopyWithImpl(this._value, this._then);

  final GithubUserData _value;
  // ignore: unused_field
  final $Res Function(GithubUserData) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? repos = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as GithubUser,
      repos: repos == freezed
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as List<GithubRepo>,
    ));
  }

  @override
  $GithubUserCopyWith<$Res> get user {
    return $GithubUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$GithubUserDataCopyWith<$Res>
    implements $GithubUserDataCopyWith<$Res> {
  factory _$GithubUserDataCopyWith(
          _GithubUserData value, $Res Function(_GithubUserData) then) =
      __$GithubUserDataCopyWithImpl<$Res>;
  @override
  $Res call({GithubUser user, List<GithubRepo> repos});

  @override
  $GithubUserCopyWith<$Res> get user;
}

/// @nodoc
class __$GithubUserDataCopyWithImpl<$Res>
    extends _$GithubUserDataCopyWithImpl<$Res>
    implements _$GithubUserDataCopyWith<$Res> {
  __$GithubUserDataCopyWithImpl(
      _GithubUserData _value, $Res Function(_GithubUserData) _then)
      : super(_value, (v) => _then(v as _GithubUserData));

  @override
  _GithubUserData get _value => super._value as _GithubUserData;

  @override
  $Res call({
    Object? user = freezed,
    Object? repos = freezed,
  }) {
    return _then(_GithubUserData(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as GithubUser,
      repos: repos == freezed
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as List<GithubRepo>,
    ));
  }
}

/// @nodoc

class _$_GithubUserData extends _GithubUserData {
  const _$_GithubUserData({required this.user, required this.repos})
      : super._();

  @override
  final GithubUser user;
  @override
  final List<GithubRepo> repos;

  @override
  String toString() {
    return 'GithubUserData(user: $user, repos: $repos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GithubUserData &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other.repos, repos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, user, const DeepCollectionEquality().hash(repos));

  @JsonKey(ignore: true)
  @override
  _$GithubUserDataCopyWith<_GithubUserData> get copyWith =>
      __$GithubUserDataCopyWithImpl<_GithubUserData>(this, _$identity);
}

abstract class _GithubUserData extends GithubUserData {
  const factory _GithubUserData(
      {required GithubUser user,
      required List<GithubRepo> repos}) = _$_GithubUserData;
  const _GithubUserData._() : super._();

  @override
  GithubUser get user;
  @override
  List<GithubRepo> get repos;
  @override
  @JsonKey(ignore: true)
  _$GithubUserDataCopyWith<_GithubUserData> get copyWith =>
      throw _privateConstructorUsedError;
}
