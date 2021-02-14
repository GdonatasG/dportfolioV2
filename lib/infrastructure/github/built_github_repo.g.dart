// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'built_github_repo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuiltGithubRepo> _$builtGithubRepoSerializer =
    new _$BuiltGithubRepoSerializer();

class _$BuiltGithubRepoSerializer
    implements StructuredSerializer<BuiltGithubRepo> {
  @override
  final Iterable<Type> types = const [BuiltGithubRepo, _$BuiltGithubRepo];
  @override
  final String wireName = 'BuiltGithubRepo';

  @override
  Iterable<Object> serialize(Serializers serializers, BuiltGithubRepo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'html_url',
      serializers.serialize(object.html_url,
          specifiedType: const FullType(String)),
      'language',
      serializers.serialize(object.language,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  BuiltGithubRepo deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuiltGithubRepoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'html_url':
          result.html_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'language':
          result.language = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$BuiltGithubRepo extends BuiltGithubRepo {
  @override
  final String name;
  @override
  final String html_url;
  @override
  final String language;

  factory _$BuiltGithubRepo([void Function(BuiltGithubRepoBuilder) updates]) =>
      (new BuiltGithubRepoBuilder()..update(updates)).build();

  _$BuiltGithubRepo._({this.name, this.html_url, this.language}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('BuiltGithubRepo', 'name');
    }
    if (html_url == null) {
      throw new BuiltValueNullFieldError('BuiltGithubRepo', 'html_url');
    }
    if (language == null) {
      throw new BuiltValueNullFieldError('BuiltGithubRepo', 'language');
    }
  }

  @override
  BuiltGithubRepo rebuild(void Function(BuiltGithubRepoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltGithubRepoBuilder toBuilder() =>
      new BuiltGithubRepoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltGithubRepo &&
        name == other.name &&
        html_url == other.html_url &&
        language == other.language;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, name.hashCode), html_url.hashCode), language.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuiltGithubRepo')
          ..add('name', name)
          ..add('html_url', html_url)
          ..add('language', language))
        .toString();
  }
}

class BuiltGithubRepoBuilder
    implements Builder<BuiltGithubRepo, BuiltGithubRepoBuilder> {
  _$BuiltGithubRepo _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _html_url;
  String get html_url => _$this._html_url;
  set html_url(String html_url) => _$this._html_url = html_url;

  String _language;
  String get language => _$this._language;
  set language(String language) => _$this._language = language;

  BuiltGithubRepoBuilder();

  BuiltGithubRepoBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _html_url = _$v.html_url;
      _language = _$v.language;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltGithubRepo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BuiltGithubRepo;
  }

  @override
  void update(void Function(BuiltGithubRepoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuiltGithubRepo build() {
    final _$result = _$v ??
        new _$BuiltGithubRepo._(
            name: name, html_url: html_url, language: language);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
