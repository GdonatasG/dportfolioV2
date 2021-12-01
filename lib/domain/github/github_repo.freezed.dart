// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'github_repo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GithubRepoTearOff {
  const _$GithubRepoTearOff();

  _GithubRepo call(
      {required String? name,
      required String? html_url,
      required String? language}) {
    return _GithubRepo(
      name: name,
      html_url: html_url,
      language: language,
    );
  }
}

/// @nodoc
const $GithubRepo = _$GithubRepoTearOff();

/// @nodoc
mixin _$GithubRepo {
  String? get name => throw _privateConstructorUsedError;
  String? get html_url => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GithubRepoCopyWith<GithubRepo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubRepoCopyWith<$Res> {
  factory $GithubRepoCopyWith(
          GithubRepo value, $Res Function(GithubRepo) then) =
      _$GithubRepoCopyWithImpl<$Res>;
  $Res call({String? name, String? html_url, String? language});
}

/// @nodoc
class _$GithubRepoCopyWithImpl<$Res> implements $GithubRepoCopyWith<$Res> {
  _$GithubRepoCopyWithImpl(this._value, this._then);

  final GithubRepo _value;
  // ignore: unused_field
  final $Res Function(GithubRepo) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? html_url = freezed,
    Object? language = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      html_url: html_url == freezed
          ? _value.html_url
          : html_url // ignore: cast_nullable_to_non_nullable
              as String?,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$GithubRepoCopyWith<$Res> implements $GithubRepoCopyWith<$Res> {
  factory _$GithubRepoCopyWith(
          _GithubRepo value, $Res Function(_GithubRepo) then) =
      __$GithubRepoCopyWithImpl<$Res>;
  @override
  $Res call({String? name, String? html_url, String? language});
}

/// @nodoc
class __$GithubRepoCopyWithImpl<$Res> extends _$GithubRepoCopyWithImpl<$Res>
    implements _$GithubRepoCopyWith<$Res> {
  __$GithubRepoCopyWithImpl(
      _GithubRepo _value, $Res Function(_GithubRepo) _then)
      : super(_value, (v) => _then(v as _GithubRepo));

  @override
  _GithubRepo get _value => super._value as _GithubRepo;

  @override
  $Res call({
    Object? name = freezed,
    Object? html_url = freezed,
    Object? language = freezed,
  }) {
    return _then(_GithubRepo(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      html_url: html_url == freezed
          ? _value.html_url
          : html_url // ignore: cast_nullable_to_non_nullable
              as String?,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_GithubRepo extends _GithubRepo {
  const _$_GithubRepo(
      {required this.name, required this.html_url, required this.language})
      : super._();

  @override
  final String? name;
  @override
  final String? html_url;
  @override
  final String? language;

  @override
  String toString() {
    return 'GithubRepo(name: $name, html_url: $html_url, language: $language)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GithubRepo &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.html_url, html_url) ||
                other.html_url == html_url) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, html_url, language);

  @JsonKey(ignore: true)
  @override
  _$GithubRepoCopyWith<_GithubRepo> get copyWith =>
      __$GithubRepoCopyWithImpl<_GithubRepo>(this, _$identity);
}

abstract class _GithubRepo extends GithubRepo {
  const factory _GithubRepo(
      {required String? name,
      required String? html_url,
      required String? language}) = _$_GithubRepo;
  const _GithubRepo._() : super._();

  @override
  String? get name;
  @override
  String? get html_url;
  @override
  String? get language;
  @override
  @JsonKey(ignore: true)
  _$GithubRepoCopyWith<_GithubRepo> get copyWith =>
      throw _privateConstructorUsedError;
}
