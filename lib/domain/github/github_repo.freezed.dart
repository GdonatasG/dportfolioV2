// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'github_repo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GithubRepoTearOff {
  const _$GithubRepoTearOff();

// ignore: unused_element
  _GithubRepo call(
      {@required String name,
      @required String html_url,
      @required String language}) {
    return _GithubRepo(
      name: name,
      html_url: html_url,
      language: language,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GithubRepo = _$GithubRepoTearOff();

/// @nodoc
mixin _$GithubRepo {
  String get name;
  String get html_url;
  String get language;

  $GithubRepoCopyWith<GithubRepo> get copyWith;
}

/// @nodoc
abstract class $GithubRepoCopyWith<$Res> {
  factory $GithubRepoCopyWith(
          GithubRepo value, $Res Function(GithubRepo) then) =
      _$GithubRepoCopyWithImpl<$Res>;
  $Res call({String name, String html_url, String language});
}

/// @nodoc
class _$GithubRepoCopyWithImpl<$Res> implements $GithubRepoCopyWith<$Res> {
  _$GithubRepoCopyWithImpl(this._value, this._then);

  final GithubRepo _value;
  // ignore: unused_field
  final $Res Function(GithubRepo) _then;

  @override
  $Res call({
    Object name = freezed,
    Object html_url = freezed,
    Object language = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      html_url: html_url == freezed ? _value.html_url : html_url as String,
      language: language == freezed ? _value.language : language as String,
    ));
  }
}

/// @nodoc
abstract class _$GithubRepoCopyWith<$Res> implements $GithubRepoCopyWith<$Res> {
  factory _$GithubRepoCopyWith(
          _GithubRepo value, $Res Function(_GithubRepo) then) =
      __$GithubRepoCopyWithImpl<$Res>;
  @override
  $Res call({String name, String html_url, String language});
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
    Object name = freezed,
    Object html_url = freezed,
    Object language = freezed,
  }) {
    return _then(_GithubRepo(
      name: name == freezed ? _value.name : name as String,
      html_url: html_url == freezed ? _value.html_url : html_url as String,
      language: language == freezed ? _value.language : language as String,
    ));
  }
}

/// @nodoc
class _$_GithubRepo extends _GithubRepo {
  const _$_GithubRepo(
      {@required this.name, @required this.html_url, @required this.language})
      : assert(name != null),
        assert(html_url != null),
        assert(language != null),
        super._();

  @override
  final String name;
  @override
  final String html_url;
  @override
  final String language;

  @override
  String toString() {
    return 'GithubRepo(name: $name, html_url: $html_url, language: $language)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GithubRepo &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.html_url, html_url) ||
                const DeepCollectionEquality()
                    .equals(other.html_url, html_url)) &&
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(html_url) ^
      const DeepCollectionEquality().hash(language);

  @override
  _$GithubRepoCopyWith<_GithubRepo> get copyWith =>
      __$GithubRepoCopyWithImpl<_GithubRepo>(this, _$identity);
}

abstract class _GithubRepo extends GithubRepo {
  const _GithubRepo._() : super._();
  const factory _GithubRepo(
      {@required String name,
      @required String html_url,
      @required String language}) = _$_GithubRepo;

  @override
  String get name;
  @override
  String get html_url;
  @override
  String get language;
  @override
  _$GithubRepoCopyWith<_GithubRepo> get copyWith;
}
