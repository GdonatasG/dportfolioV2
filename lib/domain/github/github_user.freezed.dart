// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'github_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GithubUserTearOff {
  const _$GithubUserTearOff();

  _GithubUser call(
      {required String? login,
      required String? avatar_url,
      required String? html_url}) {
    return _GithubUser(
      login: login,
      avatar_url: avatar_url,
      html_url: html_url,
    );
  }
}

/// @nodoc
const $GithubUser = _$GithubUserTearOff();

/// @nodoc
mixin _$GithubUser {
  String? get login => throw _privateConstructorUsedError;
  String? get avatar_url => throw _privateConstructorUsedError;
  String? get html_url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GithubUserCopyWith<GithubUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubUserCopyWith<$Res> {
  factory $GithubUserCopyWith(
          GithubUser value, $Res Function(GithubUser) then) =
      _$GithubUserCopyWithImpl<$Res>;
  $Res call({String? login, String? avatar_url, String? html_url});
}

/// @nodoc
class _$GithubUserCopyWithImpl<$Res> implements $GithubUserCopyWith<$Res> {
  _$GithubUserCopyWithImpl(this._value, this._then);

  final GithubUser _value;
  // ignore: unused_field
  final $Res Function(GithubUser) _then;

  @override
  $Res call({
    Object? login = freezed,
    Object? avatar_url = freezed,
    Object? html_url = freezed,
  }) {
    return _then(_value.copyWith(
      login: login == freezed
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar_url: avatar_url == freezed
          ? _value.avatar_url
          : avatar_url // ignore: cast_nullable_to_non_nullable
              as String?,
      html_url: html_url == freezed
          ? _value.html_url
          : html_url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$GithubUserCopyWith<$Res> implements $GithubUserCopyWith<$Res> {
  factory _$GithubUserCopyWith(
          _GithubUser value, $Res Function(_GithubUser) then) =
      __$GithubUserCopyWithImpl<$Res>;
  @override
  $Res call({String? login, String? avatar_url, String? html_url});
}

/// @nodoc
class __$GithubUserCopyWithImpl<$Res> extends _$GithubUserCopyWithImpl<$Res>
    implements _$GithubUserCopyWith<$Res> {
  __$GithubUserCopyWithImpl(
      _GithubUser _value, $Res Function(_GithubUser) _then)
      : super(_value, (v) => _then(v as _GithubUser));

  @override
  _GithubUser get _value => super._value as _GithubUser;

  @override
  $Res call({
    Object? login = freezed,
    Object? avatar_url = freezed,
    Object? html_url = freezed,
  }) {
    return _then(_GithubUser(
      login: login == freezed
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar_url: avatar_url == freezed
          ? _value.avatar_url
          : avatar_url // ignore: cast_nullable_to_non_nullable
              as String?,
      html_url: html_url == freezed
          ? _value.html_url
          : html_url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_GithubUser extends _GithubUser {
  const _$_GithubUser(
      {required this.login, required this.avatar_url, required this.html_url})
      : super._();

  @override
  final String? login;
  @override
  final String? avatar_url;
  @override
  final String? html_url;

  @override
  String toString() {
    return 'GithubUser(login: $login, avatar_url: $avatar_url, html_url: $html_url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GithubUser &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.avatar_url, avatar_url) ||
                other.avatar_url == avatar_url) &&
            (identical(other.html_url, html_url) ||
                other.html_url == html_url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, login, avatar_url, html_url);

  @JsonKey(ignore: true)
  @override
  _$GithubUserCopyWith<_GithubUser> get copyWith =>
      __$GithubUserCopyWithImpl<_GithubUser>(this, _$identity);
}

abstract class _GithubUser extends GithubUser {
  const factory _GithubUser(
      {required String? login,
      required String? avatar_url,
      required String? html_url}) = _$_GithubUser;
  const _GithubUser._() : super._();

  @override
  String? get login;
  @override
  String? get avatar_url;
  @override
  String? get html_url;
  @override
  @JsonKey(ignore: true)
  _$GithubUserCopyWith<_GithubUser> get copyWith =>
      throw _privateConstructorUsedError;
}
