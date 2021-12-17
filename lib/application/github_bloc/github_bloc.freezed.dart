// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'github_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GithubEventTearOff {
  const _$GithubEventTearOff();

  GetUserAndRepos getUserAndRepos(
      {required String name, bool isRefresh = false}) {
    return GetUserAndRepos(
      name: name,
      isRefresh: isRefresh,
    );
  }

  Paginate paginate() {
    return const Paginate();
  }
}

/// @nodoc
const $GithubEvent = _$GithubEventTearOff();

/// @nodoc
mixin _$GithubEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, bool isRefresh) getUserAndRepos,
    required TResult Function() paginate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, bool isRefresh)? getUserAndRepos,
    TResult Function()? paginate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, bool isRefresh)? getUserAndRepos,
    TResult Function()? paginate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserAndRepos value) getUserAndRepos,
    required TResult Function(Paginate value) paginate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetUserAndRepos value)? getUserAndRepos,
    TResult Function(Paginate value)? paginate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserAndRepos value)? getUserAndRepos,
    TResult Function(Paginate value)? paginate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubEventCopyWith<$Res> {
  factory $GithubEventCopyWith(
          GithubEvent value, $Res Function(GithubEvent) then) =
      _$GithubEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$GithubEventCopyWithImpl<$Res> implements $GithubEventCopyWith<$Res> {
  _$GithubEventCopyWithImpl(this._value, this._then);

  final GithubEvent _value;
  // ignore: unused_field
  final $Res Function(GithubEvent) _then;
}

/// @nodoc
abstract class $GetUserAndReposCopyWith<$Res> {
  factory $GetUserAndReposCopyWith(
          GetUserAndRepos value, $Res Function(GetUserAndRepos) then) =
      _$GetUserAndReposCopyWithImpl<$Res>;
  $Res call({String name, bool isRefresh});
}

/// @nodoc
class _$GetUserAndReposCopyWithImpl<$Res>
    extends _$GithubEventCopyWithImpl<$Res>
    implements $GetUserAndReposCopyWith<$Res> {
  _$GetUserAndReposCopyWithImpl(
      GetUserAndRepos _value, $Res Function(GetUserAndRepos) _then)
      : super(_value, (v) => _then(v as GetUserAndRepos));

  @override
  GetUserAndRepos get _value => super._value as GetUserAndRepos;

  @override
  $Res call({
    Object? name = freezed,
    Object? isRefresh = freezed,
  }) {
    return _then(GetUserAndRepos(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isRefresh: isRefresh == freezed
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetUserAndRepos implements GetUserAndRepos {
  const _$GetUserAndRepos({required this.name, this.isRefresh = false});

  @override
  final String name;
  @JsonKey(defaultValue: false)
  @override
  final bool isRefresh;

  @override
  String toString() {
    return 'GithubEvent.getUserAndRepos(name: $name, isRefresh: $isRefresh)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetUserAndRepos &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, isRefresh);

  @JsonKey(ignore: true)
  @override
  $GetUserAndReposCopyWith<GetUserAndRepos> get copyWith =>
      _$GetUserAndReposCopyWithImpl<GetUserAndRepos>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, bool isRefresh) getUserAndRepos,
    required TResult Function() paginate,
  }) {
    return getUserAndRepos(name, isRefresh);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, bool isRefresh)? getUserAndRepos,
    TResult Function()? paginate,
  }) {
    return getUserAndRepos?.call(name, isRefresh);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, bool isRefresh)? getUserAndRepos,
    TResult Function()? paginate,
    required TResult orElse(),
  }) {
    if (getUserAndRepos != null) {
      return getUserAndRepos(name, isRefresh);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserAndRepos value) getUserAndRepos,
    required TResult Function(Paginate value) paginate,
  }) {
    return getUserAndRepos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetUserAndRepos value)? getUserAndRepos,
    TResult Function(Paginate value)? paginate,
  }) {
    return getUserAndRepos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserAndRepos value)? getUserAndRepos,
    TResult Function(Paginate value)? paginate,
    required TResult orElse(),
  }) {
    if (getUserAndRepos != null) {
      return getUserAndRepos(this);
    }
    return orElse();
  }
}

abstract class GetUserAndRepos implements GithubEvent {
  const factory GetUserAndRepos({required String name, bool isRefresh}) =
      _$GetUserAndRepos;

  String get name;
  bool get isRefresh;
  @JsonKey(ignore: true)
  $GetUserAndReposCopyWith<GetUserAndRepos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginateCopyWith<$Res> {
  factory $PaginateCopyWith(Paginate value, $Res Function(Paginate) then) =
      _$PaginateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PaginateCopyWithImpl<$Res> extends _$GithubEventCopyWithImpl<$Res>
    implements $PaginateCopyWith<$Res> {
  _$PaginateCopyWithImpl(Paginate _value, $Res Function(Paginate) _then)
      : super(_value, (v) => _then(v as Paginate));

  @override
  Paginate get _value => super._value as Paginate;
}

/// @nodoc

class _$Paginate implements Paginate {
  const _$Paginate();

  @override
  String toString() {
    return 'GithubEvent.paginate()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Paginate);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, bool isRefresh) getUserAndRepos,
    required TResult Function() paginate,
  }) {
    return paginate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, bool isRefresh)? getUserAndRepos,
    TResult Function()? paginate,
  }) {
    return paginate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, bool isRefresh)? getUserAndRepos,
    TResult Function()? paginate,
    required TResult orElse(),
  }) {
    if (paginate != null) {
      return paginate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserAndRepos value) getUserAndRepos,
    required TResult Function(Paginate value) paginate,
  }) {
    return paginate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetUserAndRepos value)? getUserAndRepos,
    TResult Function(Paginate value)? paginate,
  }) {
    return paginate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserAndRepos value)? getUserAndRepos,
    TResult Function(Paginate value)? paginate,
    required TResult orElse(),
  }) {
    if (paginate != null) {
      return paginate(this);
    }
    return orElse();
  }
}

abstract class Paginate implements GithubEvent {
  const factory Paginate() = _$Paginate;
}

/// @nodoc
class _$GithubStateTearOff {
  const _$GithubStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loading loading() {
    return const _Loading();
  }

  _Filtering loadingMore() {
    return const _Filtering();
  }

  _Refreshing refreshing() {
    return const _Refreshing();
  }

  _UserWithReposLoaded userWithReposLoaded(
      GithubUser githubUser, GithubSearchRepos githubSearchRepos,
      {GithubFailure? failure, required bool canLoadMore}) {
    return _UserWithReposLoaded(
      githubUser,
      githubSearchRepos,
      failure: failure,
      canLoadMore: canLoadMore,
    );
  }

  _InitialLoadingError initialLoadingError(GithubFailure failure) {
    return _InitialLoadingError(
      failure,
    );
  }

  _LoadingMoreError loadingMoreError(GithubFailure failure) {
    return _LoadingMoreError(
      failure,
    );
  }
}

/// @nodoc
const $GithubState = _$GithubStateTearOff();

/// @nodoc
mixin _$GithubState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function() refreshing,
    required TResult Function(
            GithubUser githubUser,
            GithubSearchRepos githubSearchRepos,
            GithubFailure? failure,
            bool canLoadMore)
        userWithReposLoaded,
    required TResult Function(GithubFailure failure) initialLoadingError,
    required TResult Function(GithubFailure failure) loadingMoreError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? refreshing,
    TResult Function(GithubUser githubUser, GithubSearchRepos githubSearchRepos,
            GithubFailure? failure, bool canLoadMore)?
        userWithReposLoaded,
    TResult Function(GithubFailure failure)? initialLoadingError,
    TResult Function(GithubFailure failure)? loadingMoreError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? refreshing,
    TResult Function(GithubUser githubUser, GithubSearchRepos githubSearchRepos,
            GithubFailure? failure, bool canLoadMore)?
        userWithReposLoaded,
    TResult Function(GithubFailure failure)? initialLoadingError,
    TResult Function(GithubFailure failure)? loadingMoreError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Filtering value) loadingMore,
    required TResult Function(_Refreshing value) refreshing,
    required TResult Function(_UserWithReposLoaded value) userWithReposLoaded,
    required TResult Function(_InitialLoadingError value) initialLoadingError,
    required TResult Function(_LoadingMoreError value) loadingMoreError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Filtering value)? loadingMore,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_UserWithReposLoaded value)? userWithReposLoaded,
    TResult Function(_InitialLoadingError value)? initialLoadingError,
    TResult Function(_LoadingMoreError value)? loadingMoreError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Filtering value)? loadingMore,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_UserWithReposLoaded value)? userWithReposLoaded,
    TResult Function(_InitialLoadingError value)? initialLoadingError,
    TResult Function(_LoadingMoreError value)? loadingMoreError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubStateCopyWith<$Res> {
  factory $GithubStateCopyWith(
          GithubState value, $Res Function(GithubState) then) =
      _$GithubStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GithubStateCopyWithImpl<$Res> implements $GithubStateCopyWith<$Res> {
  _$GithubStateCopyWithImpl(this._value, this._then);

  final GithubState _value;
  // ignore: unused_field
  final $Res Function(GithubState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$GithubStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'GithubState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function() refreshing,
    required TResult Function(
            GithubUser githubUser,
            GithubSearchRepos githubSearchRepos,
            GithubFailure? failure,
            bool canLoadMore)
        userWithReposLoaded,
    required TResult Function(GithubFailure failure) initialLoadingError,
    required TResult Function(GithubFailure failure) loadingMoreError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? refreshing,
    TResult Function(GithubUser githubUser, GithubSearchRepos githubSearchRepos,
            GithubFailure? failure, bool canLoadMore)?
        userWithReposLoaded,
    TResult Function(GithubFailure failure)? initialLoadingError,
    TResult Function(GithubFailure failure)? loadingMoreError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? refreshing,
    TResult Function(GithubUser githubUser, GithubSearchRepos githubSearchRepos,
            GithubFailure? failure, bool canLoadMore)?
        userWithReposLoaded,
    TResult Function(GithubFailure failure)? initialLoadingError,
    TResult Function(GithubFailure failure)? loadingMoreError,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Filtering value) loadingMore,
    required TResult Function(_Refreshing value) refreshing,
    required TResult Function(_UserWithReposLoaded value) userWithReposLoaded,
    required TResult Function(_InitialLoadingError value) initialLoadingError,
    required TResult Function(_LoadingMoreError value) loadingMoreError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Filtering value)? loadingMore,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_UserWithReposLoaded value)? userWithReposLoaded,
    TResult Function(_InitialLoadingError value)? initialLoadingError,
    TResult Function(_LoadingMoreError value)? loadingMoreError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Filtering value)? loadingMore,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_UserWithReposLoaded value)? userWithReposLoaded,
    TResult Function(_InitialLoadingError value)? initialLoadingError,
    TResult Function(_LoadingMoreError value)? loadingMoreError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GithubState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$GithubStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'GithubState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function() refreshing,
    required TResult Function(
            GithubUser githubUser,
            GithubSearchRepos githubSearchRepos,
            GithubFailure? failure,
            bool canLoadMore)
        userWithReposLoaded,
    required TResult Function(GithubFailure failure) initialLoadingError,
    required TResult Function(GithubFailure failure) loadingMoreError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? refreshing,
    TResult Function(GithubUser githubUser, GithubSearchRepos githubSearchRepos,
            GithubFailure? failure, bool canLoadMore)?
        userWithReposLoaded,
    TResult Function(GithubFailure failure)? initialLoadingError,
    TResult Function(GithubFailure failure)? loadingMoreError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? refreshing,
    TResult Function(GithubUser githubUser, GithubSearchRepos githubSearchRepos,
            GithubFailure? failure, bool canLoadMore)?
        userWithReposLoaded,
    TResult Function(GithubFailure failure)? initialLoadingError,
    TResult Function(GithubFailure failure)? loadingMoreError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Filtering value) loadingMore,
    required TResult Function(_Refreshing value) refreshing,
    required TResult Function(_UserWithReposLoaded value) userWithReposLoaded,
    required TResult Function(_InitialLoadingError value) initialLoadingError,
    required TResult Function(_LoadingMoreError value) loadingMoreError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Filtering value)? loadingMore,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_UserWithReposLoaded value)? userWithReposLoaded,
    TResult Function(_InitialLoadingError value)? initialLoadingError,
    TResult Function(_LoadingMoreError value)? loadingMoreError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Filtering value)? loadingMore,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_UserWithReposLoaded value)? userWithReposLoaded,
    TResult Function(_InitialLoadingError value)? initialLoadingError,
    TResult Function(_LoadingMoreError value)? loadingMoreError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements GithubState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$FilteringCopyWith<$Res> {
  factory _$FilteringCopyWith(
          _Filtering value, $Res Function(_Filtering) then) =
      __$FilteringCopyWithImpl<$Res>;
}

/// @nodoc
class __$FilteringCopyWithImpl<$Res> extends _$GithubStateCopyWithImpl<$Res>
    implements _$FilteringCopyWith<$Res> {
  __$FilteringCopyWithImpl(_Filtering _value, $Res Function(_Filtering) _then)
      : super(_value, (v) => _then(v as _Filtering));

  @override
  _Filtering get _value => super._value as _Filtering;
}

/// @nodoc

class _$_Filtering implements _Filtering {
  const _$_Filtering();

  @override
  String toString() {
    return 'GithubState.loadingMore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Filtering);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function() refreshing,
    required TResult Function(
            GithubUser githubUser,
            GithubSearchRepos githubSearchRepos,
            GithubFailure? failure,
            bool canLoadMore)
        userWithReposLoaded,
    required TResult Function(GithubFailure failure) initialLoadingError,
    required TResult Function(GithubFailure failure) loadingMoreError,
  }) {
    return loadingMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? refreshing,
    TResult Function(GithubUser githubUser, GithubSearchRepos githubSearchRepos,
            GithubFailure? failure, bool canLoadMore)?
        userWithReposLoaded,
    TResult Function(GithubFailure failure)? initialLoadingError,
    TResult Function(GithubFailure failure)? loadingMoreError,
  }) {
    return loadingMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? refreshing,
    TResult Function(GithubUser githubUser, GithubSearchRepos githubSearchRepos,
            GithubFailure? failure, bool canLoadMore)?
        userWithReposLoaded,
    TResult Function(GithubFailure failure)? initialLoadingError,
    TResult Function(GithubFailure failure)? loadingMoreError,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Filtering value) loadingMore,
    required TResult Function(_Refreshing value) refreshing,
    required TResult Function(_UserWithReposLoaded value) userWithReposLoaded,
    required TResult Function(_InitialLoadingError value) initialLoadingError,
    required TResult Function(_LoadingMoreError value) loadingMoreError,
  }) {
    return loadingMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Filtering value)? loadingMore,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_UserWithReposLoaded value)? userWithReposLoaded,
    TResult Function(_InitialLoadingError value)? initialLoadingError,
    TResult Function(_LoadingMoreError value)? loadingMoreError,
  }) {
    return loadingMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Filtering value)? loadingMore,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_UserWithReposLoaded value)? userWithReposLoaded,
    TResult Function(_InitialLoadingError value)? initialLoadingError,
    TResult Function(_LoadingMoreError value)? loadingMoreError,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(this);
    }
    return orElse();
  }
}

abstract class _Filtering implements GithubState {
  const factory _Filtering() = _$_Filtering;
}

/// @nodoc
abstract class _$RefreshingCopyWith<$Res> {
  factory _$RefreshingCopyWith(
          _Refreshing value, $Res Function(_Refreshing) then) =
      __$RefreshingCopyWithImpl<$Res>;
}

/// @nodoc
class __$RefreshingCopyWithImpl<$Res> extends _$GithubStateCopyWithImpl<$Res>
    implements _$RefreshingCopyWith<$Res> {
  __$RefreshingCopyWithImpl(
      _Refreshing _value, $Res Function(_Refreshing) _then)
      : super(_value, (v) => _then(v as _Refreshing));

  @override
  _Refreshing get _value => super._value as _Refreshing;
}

/// @nodoc

class _$_Refreshing implements _Refreshing {
  const _$_Refreshing();

  @override
  String toString() {
    return 'GithubState.refreshing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Refreshing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function() refreshing,
    required TResult Function(
            GithubUser githubUser,
            GithubSearchRepos githubSearchRepos,
            GithubFailure? failure,
            bool canLoadMore)
        userWithReposLoaded,
    required TResult Function(GithubFailure failure) initialLoadingError,
    required TResult Function(GithubFailure failure) loadingMoreError,
  }) {
    return refreshing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? refreshing,
    TResult Function(GithubUser githubUser, GithubSearchRepos githubSearchRepos,
            GithubFailure? failure, bool canLoadMore)?
        userWithReposLoaded,
    TResult Function(GithubFailure failure)? initialLoadingError,
    TResult Function(GithubFailure failure)? loadingMoreError,
  }) {
    return refreshing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? refreshing,
    TResult Function(GithubUser githubUser, GithubSearchRepos githubSearchRepos,
            GithubFailure? failure, bool canLoadMore)?
        userWithReposLoaded,
    TResult Function(GithubFailure failure)? initialLoadingError,
    TResult Function(GithubFailure failure)? loadingMoreError,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Filtering value) loadingMore,
    required TResult Function(_Refreshing value) refreshing,
    required TResult Function(_UserWithReposLoaded value) userWithReposLoaded,
    required TResult Function(_InitialLoadingError value) initialLoadingError,
    required TResult Function(_LoadingMoreError value) loadingMoreError,
  }) {
    return refreshing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Filtering value)? loadingMore,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_UserWithReposLoaded value)? userWithReposLoaded,
    TResult Function(_InitialLoadingError value)? initialLoadingError,
    TResult Function(_LoadingMoreError value)? loadingMoreError,
  }) {
    return refreshing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Filtering value)? loadingMore,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_UserWithReposLoaded value)? userWithReposLoaded,
    TResult Function(_InitialLoadingError value)? initialLoadingError,
    TResult Function(_LoadingMoreError value)? loadingMoreError,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(this);
    }
    return orElse();
  }
}

abstract class _Refreshing implements GithubState {
  const factory _Refreshing() = _$_Refreshing;
}

/// @nodoc
abstract class _$UserWithReposLoadedCopyWith<$Res> {
  factory _$UserWithReposLoadedCopyWith(_UserWithReposLoaded value,
          $Res Function(_UserWithReposLoaded) then) =
      __$UserWithReposLoadedCopyWithImpl<$Res>;
  $Res call(
      {GithubUser githubUser,
      GithubSearchRepos githubSearchRepos,
      GithubFailure? failure,
      bool canLoadMore});

  $GithubUserCopyWith<$Res> get githubUser;
  $GithubSearchReposCopyWith<$Res> get githubSearchRepos;
  $GithubFailureCopyWith<$Res>? get failure;
}

/// @nodoc
class __$UserWithReposLoadedCopyWithImpl<$Res>
    extends _$GithubStateCopyWithImpl<$Res>
    implements _$UserWithReposLoadedCopyWith<$Res> {
  __$UserWithReposLoadedCopyWithImpl(
      _UserWithReposLoaded _value, $Res Function(_UserWithReposLoaded) _then)
      : super(_value, (v) => _then(v as _UserWithReposLoaded));

  @override
  _UserWithReposLoaded get _value => super._value as _UserWithReposLoaded;

  @override
  $Res call({
    Object? githubUser = freezed,
    Object? githubSearchRepos = freezed,
    Object? failure = freezed,
    Object? canLoadMore = freezed,
  }) {
    return _then(_UserWithReposLoaded(
      githubUser == freezed
          ? _value.githubUser
          : githubUser // ignore: cast_nullable_to_non_nullable
              as GithubUser,
      githubSearchRepos == freezed
          ? _value.githubSearchRepos
          : githubSearchRepos // ignore: cast_nullable_to_non_nullable
              as GithubSearchRepos,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as GithubFailure?,
      canLoadMore: canLoadMore == freezed
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $GithubUserCopyWith<$Res> get githubUser {
    return $GithubUserCopyWith<$Res>(_value.githubUser, (value) {
      return _then(_value.copyWith(githubUser: value));
    });
  }

  @override
  $GithubSearchReposCopyWith<$Res> get githubSearchRepos {
    return $GithubSearchReposCopyWith<$Res>(_value.githubSearchRepos, (value) {
      return _then(_value.copyWith(githubSearchRepos: value));
    });
  }

  @override
  $GithubFailureCopyWith<$Res>? get failure {
    if (_value.failure == null) {
      return null;
    }

    return $GithubFailureCopyWith<$Res>(_value.failure!, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_UserWithReposLoaded implements _UserWithReposLoaded {
  const _$_UserWithReposLoaded(this.githubUser, this.githubSearchRepos,
      {this.failure, required this.canLoadMore});

  @override
  final GithubUser githubUser;
  @override
  final GithubSearchRepos githubSearchRepos;
  @override
  final GithubFailure? failure;
  @override
  final bool canLoadMore;

  @override
  String toString() {
    return 'GithubState.userWithReposLoaded(githubUser: $githubUser, githubSearchRepos: $githubSearchRepos, failure: $failure, canLoadMore: $canLoadMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserWithReposLoaded &&
            (identical(other.githubUser, githubUser) ||
                other.githubUser == githubUser) &&
            (identical(other.githubSearchRepos, githubSearchRepos) ||
                other.githubSearchRepos == githubSearchRepos) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, githubUser, githubSearchRepos, failure, canLoadMore);

  @JsonKey(ignore: true)
  @override
  _$UserWithReposLoadedCopyWith<_UserWithReposLoaded> get copyWith =>
      __$UserWithReposLoadedCopyWithImpl<_UserWithReposLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function() refreshing,
    required TResult Function(
            GithubUser githubUser,
            GithubSearchRepos githubSearchRepos,
            GithubFailure? failure,
            bool canLoadMore)
        userWithReposLoaded,
    required TResult Function(GithubFailure failure) initialLoadingError,
    required TResult Function(GithubFailure failure) loadingMoreError,
  }) {
    return userWithReposLoaded(
        githubUser, githubSearchRepos, failure, canLoadMore);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? refreshing,
    TResult Function(GithubUser githubUser, GithubSearchRepos githubSearchRepos,
            GithubFailure? failure, bool canLoadMore)?
        userWithReposLoaded,
    TResult Function(GithubFailure failure)? initialLoadingError,
    TResult Function(GithubFailure failure)? loadingMoreError,
  }) {
    return userWithReposLoaded?.call(
        githubUser, githubSearchRepos, failure, canLoadMore);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? refreshing,
    TResult Function(GithubUser githubUser, GithubSearchRepos githubSearchRepos,
            GithubFailure? failure, bool canLoadMore)?
        userWithReposLoaded,
    TResult Function(GithubFailure failure)? initialLoadingError,
    TResult Function(GithubFailure failure)? loadingMoreError,
    required TResult orElse(),
  }) {
    if (userWithReposLoaded != null) {
      return userWithReposLoaded(
          githubUser, githubSearchRepos, failure, canLoadMore);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Filtering value) loadingMore,
    required TResult Function(_Refreshing value) refreshing,
    required TResult Function(_UserWithReposLoaded value) userWithReposLoaded,
    required TResult Function(_InitialLoadingError value) initialLoadingError,
    required TResult Function(_LoadingMoreError value) loadingMoreError,
  }) {
    return userWithReposLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Filtering value)? loadingMore,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_UserWithReposLoaded value)? userWithReposLoaded,
    TResult Function(_InitialLoadingError value)? initialLoadingError,
    TResult Function(_LoadingMoreError value)? loadingMoreError,
  }) {
    return userWithReposLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Filtering value)? loadingMore,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_UserWithReposLoaded value)? userWithReposLoaded,
    TResult Function(_InitialLoadingError value)? initialLoadingError,
    TResult Function(_LoadingMoreError value)? loadingMoreError,
    required TResult orElse(),
  }) {
    if (userWithReposLoaded != null) {
      return userWithReposLoaded(this);
    }
    return orElse();
  }
}

abstract class _UserWithReposLoaded implements GithubState {
  const factory _UserWithReposLoaded(
      GithubUser githubUser, GithubSearchRepos githubSearchRepos,
      {GithubFailure? failure,
      required bool canLoadMore}) = _$_UserWithReposLoaded;

  GithubUser get githubUser;
  GithubSearchRepos get githubSearchRepos;
  GithubFailure? get failure;
  bool get canLoadMore;
  @JsonKey(ignore: true)
  _$UserWithReposLoadedCopyWith<_UserWithReposLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$InitialLoadingErrorCopyWith<$Res> {
  factory _$InitialLoadingErrorCopyWith(_InitialLoadingError value,
          $Res Function(_InitialLoadingError) then) =
      __$InitialLoadingErrorCopyWithImpl<$Res>;
  $Res call({GithubFailure failure});

  $GithubFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$InitialLoadingErrorCopyWithImpl<$Res>
    extends _$GithubStateCopyWithImpl<$Res>
    implements _$InitialLoadingErrorCopyWith<$Res> {
  __$InitialLoadingErrorCopyWithImpl(
      _InitialLoadingError _value, $Res Function(_InitialLoadingError) _then)
      : super(_value, (v) => _then(v as _InitialLoadingError));

  @override
  _InitialLoadingError get _value => super._value as _InitialLoadingError;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_InitialLoadingError(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as GithubFailure,
    ));
  }

  @override
  $GithubFailureCopyWith<$Res> get failure {
    return $GithubFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_InitialLoadingError implements _InitialLoadingError {
  const _$_InitialLoadingError(this.failure);

  @override
  final GithubFailure failure;

  @override
  String toString() {
    return 'GithubState.initialLoadingError(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InitialLoadingError &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  _$InitialLoadingErrorCopyWith<_InitialLoadingError> get copyWith =>
      __$InitialLoadingErrorCopyWithImpl<_InitialLoadingError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function() refreshing,
    required TResult Function(
            GithubUser githubUser,
            GithubSearchRepos githubSearchRepos,
            GithubFailure? failure,
            bool canLoadMore)
        userWithReposLoaded,
    required TResult Function(GithubFailure failure) initialLoadingError,
    required TResult Function(GithubFailure failure) loadingMoreError,
  }) {
    return initialLoadingError(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? refreshing,
    TResult Function(GithubUser githubUser, GithubSearchRepos githubSearchRepos,
            GithubFailure? failure, bool canLoadMore)?
        userWithReposLoaded,
    TResult Function(GithubFailure failure)? initialLoadingError,
    TResult Function(GithubFailure failure)? loadingMoreError,
  }) {
    return initialLoadingError?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? refreshing,
    TResult Function(GithubUser githubUser, GithubSearchRepos githubSearchRepos,
            GithubFailure? failure, bool canLoadMore)?
        userWithReposLoaded,
    TResult Function(GithubFailure failure)? initialLoadingError,
    TResult Function(GithubFailure failure)? loadingMoreError,
    required TResult orElse(),
  }) {
    if (initialLoadingError != null) {
      return initialLoadingError(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Filtering value) loadingMore,
    required TResult Function(_Refreshing value) refreshing,
    required TResult Function(_UserWithReposLoaded value) userWithReposLoaded,
    required TResult Function(_InitialLoadingError value) initialLoadingError,
    required TResult Function(_LoadingMoreError value) loadingMoreError,
  }) {
    return initialLoadingError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Filtering value)? loadingMore,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_UserWithReposLoaded value)? userWithReposLoaded,
    TResult Function(_InitialLoadingError value)? initialLoadingError,
    TResult Function(_LoadingMoreError value)? loadingMoreError,
  }) {
    return initialLoadingError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Filtering value)? loadingMore,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_UserWithReposLoaded value)? userWithReposLoaded,
    TResult Function(_InitialLoadingError value)? initialLoadingError,
    TResult Function(_LoadingMoreError value)? loadingMoreError,
    required TResult orElse(),
  }) {
    if (initialLoadingError != null) {
      return initialLoadingError(this);
    }
    return orElse();
  }
}

abstract class _InitialLoadingError implements GithubState {
  const factory _InitialLoadingError(GithubFailure failure) =
      _$_InitialLoadingError;

  GithubFailure get failure;
  @JsonKey(ignore: true)
  _$InitialLoadingErrorCopyWith<_InitialLoadingError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadingMoreErrorCopyWith<$Res> {
  factory _$LoadingMoreErrorCopyWith(
          _LoadingMoreError value, $Res Function(_LoadingMoreError) then) =
      __$LoadingMoreErrorCopyWithImpl<$Res>;
  $Res call({GithubFailure failure});

  $GithubFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$LoadingMoreErrorCopyWithImpl<$Res>
    extends _$GithubStateCopyWithImpl<$Res>
    implements _$LoadingMoreErrorCopyWith<$Res> {
  __$LoadingMoreErrorCopyWithImpl(
      _LoadingMoreError _value, $Res Function(_LoadingMoreError) _then)
      : super(_value, (v) => _then(v as _LoadingMoreError));

  @override
  _LoadingMoreError get _value => super._value as _LoadingMoreError;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_LoadingMoreError(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as GithubFailure,
    ));
  }

  @override
  $GithubFailureCopyWith<$Res> get failure {
    return $GithubFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_LoadingMoreError implements _LoadingMoreError {
  const _$_LoadingMoreError(this.failure);

  @override
  final GithubFailure failure;

  @override
  String toString() {
    return 'GithubState.loadingMoreError(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadingMoreError &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  _$LoadingMoreErrorCopyWith<_LoadingMoreError> get copyWith =>
      __$LoadingMoreErrorCopyWithImpl<_LoadingMoreError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function() refreshing,
    required TResult Function(
            GithubUser githubUser,
            GithubSearchRepos githubSearchRepos,
            GithubFailure? failure,
            bool canLoadMore)
        userWithReposLoaded,
    required TResult Function(GithubFailure failure) initialLoadingError,
    required TResult Function(GithubFailure failure) loadingMoreError,
  }) {
    return loadingMoreError(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? refreshing,
    TResult Function(GithubUser githubUser, GithubSearchRepos githubSearchRepos,
            GithubFailure? failure, bool canLoadMore)?
        userWithReposLoaded,
    TResult Function(GithubFailure failure)? initialLoadingError,
    TResult Function(GithubFailure failure)? loadingMoreError,
  }) {
    return loadingMoreError?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? refreshing,
    TResult Function(GithubUser githubUser, GithubSearchRepos githubSearchRepos,
            GithubFailure? failure, bool canLoadMore)?
        userWithReposLoaded,
    TResult Function(GithubFailure failure)? initialLoadingError,
    TResult Function(GithubFailure failure)? loadingMoreError,
    required TResult orElse(),
  }) {
    if (loadingMoreError != null) {
      return loadingMoreError(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Filtering value) loadingMore,
    required TResult Function(_Refreshing value) refreshing,
    required TResult Function(_UserWithReposLoaded value) userWithReposLoaded,
    required TResult Function(_InitialLoadingError value) initialLoadingError,
    required TResult Function(_LoadingMoreError value) loadingMoreError,
  }) {
    return loadingMoreError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Filtering value)? loadingMore,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_UserWithReposLoaded value)? userWithReposLoaded,
    TResult Function(_InitialLoadingError value)? initialLoadingError,
    TResult Function(_LoadingMoreError value)? loadingMoreError,
  }) {
    return loadingMoreError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Filtering value)? loadingMore,
    TResult Function(_Refreshing value)? refreshing,
    TResult Function(_UserWithReposLoaded value)? userWithReposLoaded,
    TResult Function(_InitialLoadingError value)? initialLoadingError,
    TResult Function(_LoadingMoreError value)? loadingMoreError,
    required TResult orElse(),
  }) {
    if (loadingMoreError != null) {
      return loadingMoreError(this);
    }
    return orElse();
  }
}

abstract class _LoadingMoreError implements GithubState {
  const factory _LoadingMoreError(GithubFailure failure) = _$_LoadingMoreError;

  GithubFailure get failure;
  @JsonKey(ignore: true)
  _$LoadingMoreErrorCopyWith<_LoadingMoreError> get copyWith =>
      throw _privateConstructorUsedError;
}
