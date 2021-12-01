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

  GetUserDataByName getUserDataByName(String name, bool isRefresh) {
    return GetUserDataByName(
      name,
      isRefresh,
    );
  }

  FilterList filterList(Map<String, bool> filterOptions) {
    return FilterList(
      filterOptions,
    );
  }

  LoadFilterOptions loadFilterOptions() {
    return const LoadFilterOptions();
  }

  FilterCheckRequest filterCheckRequest() {
    return const FilterCheckRequest();
  }
}

/// @nodoc
const $GithubEvent = _$GithubEventTearOff();

/// @nodoc
mixin _$GithubEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, bool isRefresh) getUserDataByName,
    required TResult Function(Map<String, bool> filterOptions) filterList,
    required TResult Function() loadFilterOptions,
    required TResult Function() filterCheckRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, bool isRefresh)? getUserDataByName,
    TResult Function(Map<String, bool> filterOptions)? filterList,
    TResult Function()? loadFilterOptions,
    TResult Function()? filterCheckRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, bool isRefresh)? getUserDataByName,
    TResult Function(Map<String, bool> filterOptions)? filterList,
    TResult Function()? loadFilterOptions,
    TResult Function()? filterCheckRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserDataByName value) getUserDataByName,
    required TResult Function(FilterList value) filterList,
    required TResult Function(LoadFilterOptions value) loadFilterOptions,
    required TResult Function(FilterCheckRequest value) filterCheckRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetUserDataByName value)? getUserDataByName,
    TResult Function(FilterList value)? filterList,
    TResult Function(LoadFilterOptions value)? loadFilterOptions,
    TResult Function(FilterCheckRequest value)? filterCheckRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserDataByName value)? getUserDataByName,
    TResult Function(FilterList value)? filterList,
    TResult Function(LoadFilterOptions value)? loadFilterOptions,
    TResult Function(FilterCheckRequest value)? filterCheckRequest,
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
abstract class $GetUserDataByNameCopyWith<$Res> {
  factory $GetUserDataByNameCopyWith(
          GetUserDataByName value, $Res Function(GetUserDataByName) then) =
      _$GetUserDataByNameCopyWithImpl<$Res>;
  $Res call({String name, bool isRefresh});
}

/// @nodoc
class _$GetUserDataByNameCopyWithImpl<$Res>
    extends _$GithubEventCopyWithImpl<$Res>
    implements $GetUserDataByNameCopyWith<$Res> {
  _$GetUserDataByNameCopyWithImpl(
      GetUserDataByName _value, $Res Function(GetUserDataByName) _then)
      : super(_value, (v) => _then(v as GetUserDataByName));

  @override
  GetUserDataByName get _value => super._value as GetUserDataByName;

  @override
  $Res call({
    Object? name = freezed,
    Object? isRefresh = freezed,
  }) {
    return _then(GetUserDataByName(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isRefresh == freezed
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetUserDataByName implements GetUserDataByName {
  const _$GetUserDataByName(this.name, this.isRefresh);

  @override
  final String name;
  @override
  final bool isRefresh;

  @override
  String toString() {
    return 'GithubEvent.getUserDataByName(name: $name, isRefresh: $isRefresh)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetUserDataByName &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, isRefresh);

  @JsonKey(ignore: true)
  @override
  $GetUserDataByNameCopyWith<GetUserDataByName> get copyWith =>
      _$GetUserDataByNameCopyWithImpl<GetUserDataByName>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, bool isRefresh) getUserDataByName,
    required TResult Function(Map<String, bool> filterOptions) filterList,
    required TResult Function() loadFilterOptions,
    required TResult Function() filterCheckRequest,
  }) {
    return getUserDataByName(name, isRefresh);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, bool isRefresh)? getUserDataByName,
    TResult Function(Map<String, bool> filterOptions)? filterList,
    TResult Function()? loadFilterOptions,
    TResult Function()? filterCheckRequest,
  }) {
    return getUserDataByName?.call(name, isRefresh);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, bool isRefresh)? getUserDataByName,
    TResult Function(Map<String, bool> filterOptions)? filterList,
    TResult Function()? loadFilterOptions,
    TResult Function()? filterCheckRequest,
    required TResult orElse(),
  }) {
    if (getUserDataByName != null) {
      return getUserDataByName(name, isRefresh);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserDataByName value) getUserDataByName,
    required TResult Function(FilterList value) filterList,
    required TResult Function(LoadFilterOptions value) loadFilterOptions,
    required TResult Function(FilterCheckRequest value) filterCheckRequest,
  }) {
    return getUserDataByName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetUserDataByName value)? getUserDataByName,
    TResult Function(FilterList value)? filterList,
    TResult Function(LoadFilterOptions value)? loadFilterOptions,
    TResult Function(FilterCheckRequest value)? filterCheckRequest,
  }) {
    return getUserDataByName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserDataByName value)? getUserDataByName,
    TResult Function(FilterList value)? filterList,
    TResult Function(LoadFilterOptions value)? loadFilterOptions,
    TResult Function(FilterCheckRequest value)? filterCheckRequest,
    required TResult orElse(),
  }) {
    if (getUserDataByName != null) {
      return getUserDataByName(this);
    }
    return orElse();
  }
}

abstract class GetUserDataByName implements GithubEvent {
  const factory GetUserDataByName(String name, bool isRefresh) =
      _$GetUserDataByName;

  String get name;
  bool get isRefresh;
  @JsonKey(ignore: true)
  $GetUserDataByNameCopyWith<GetUserDataByName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterListCopyWith<$Res> {
  factory $FilterListCopyWith(
          FilterList value, $Res Function(FilterList) then) =
      _$FilterListCopyWithImpl<$Res>;
  $Res call({Map<String, bool> filterOptions});
}

/// @nodoc
class _$FilterListCopyWithImpl<$Res> extends _$GithubEventCopyWithImpl<$Res>
    implements $FilterListCopyWith<$Res> {
  _$FilterListCopyWithImpl(FilterList _value, $Res Function(FilterList) _then)
      : super(_value, (v) => _then(v as FilterList));

  @override
  FilterList get _value => super._value as FilterList;

  @override
  $Res call({
    Object? filterOptions = freezed,
  }) {
    return _then(FilterList(
      filterOptions == freezed
          ? _value.filterOptions
          : filterOptions // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ));
  }
}

/// @nodoc

class _$FilterList implements FilterList {
  const _$FilterList(this.filterOptions);

  @override
  final Map<String, bool> filterOptions;

  @override
  String toString() {
    return 'GithubEvent.filterList(filterOptions: $filterOptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FilterList &&
            const DeepCollectionEquality()
                .equals(other.filterOptions, filterOptions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(filterOptions));

  @JsonKey(ignore: true)
  @override
  $FilterListCopyWith<FilterList> get copyWith =>
      _$FilterListCopyWithImpl<FilterList>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, bool isRefresh) getUserDataByName,
    required TResult Function(Map<String, bool> filterOptions) filterList,
    required TResult Function() loadFilterOptions,
    required TResult Function() filterCheckRequest,
  }) {
    return filterList(filterOptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, bool isRefresh)? getUserDataByName,
    TResult Function(Map<String, bool> filterOptions)? filterList,
    TResult Function()? loadFilterOptions,
    TResult Function()? filterCheckRequest,
  }) {
    return filterList?.call(filterOptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, bool isRefresh)? getUserDataByName,
    TResult Function(Map<String, bool> filterOptions)? filterList,
    TResult Function()? loadFilterOptions,
    TResult Function()? filterCheckRequest,
    required TResult orElse(),
  }) {
    if (filterList != null) {
      return filterList(filterOptions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserDataByName value) getUserDataByName,
    required TResult Function(FilterList value) filterList,
    required TResult Function(LoadFilterOptions value) loadFilterOptions,
    required TResult Function(FilterCheckRequest value) filterCheckRequest,
  }) {
    return filterList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetUserDataByName value)? getUserDataByName,
    TResult Function(FilterList value)? filterList,
    TResult Function(LoadFilterOptions value)? loadFilterOptions,
    TResult Function(FilterCheckRequest value)? filterCheckRequest,
  }) {
    return filterList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserDataByName value)? getUserDataByName,
    TResult Function(FilterList value)? filterList,
    TResult Function(LoadFilterOptions value)? loadFilterOptions,
    TResult Function(FilterCheckRequest value)? filterCheckRequest,
    required TResult orElse(),
  }) {
    if (filterList != null) {
      return filterList(this);
    }
    return orElse();
  }
}

abstract class FilterList implements GithubEvent {
  const factory FilterList(Map<String, bool> filterOptions) = _$FilterList;

  Map<String, bool> get filterOptions;
  @JsonKey(ignore: true)
  $FilterListCopyWith<FilterList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadFilterOptionsCopyWith<$Res> {
  factory $LoadFilterOptionsCopyWith(
          LoadFilterOptions value, $Res Function(LoadFilterOptions) then) =
      _$LoadFilterOptionsCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadFilterOptionsCopyWithImpl<$Res>
    extends _$GithubEventCopyWithImpl<$Res>
    implements $LoadFilterOptionsCopyWith<$Res> {
  _$LoadFilterOptionsCopyWithImpl(
      LoadFilterOptions _value, $Res Function(LoadFilterOptions) _then)
      : super(_value, (v) => _then(v as LoadFilterOptions));

  @override
  LoadFilterOptions get _value => super._value as LoadFilterOptions;
}

/// @nodoc

class _$LoadFilterOptions implements LoadFilterOptions {
  const _$LoadFilterOptions();

  @override
  String toString() {
    return 'GithubEvent.loadFilterOptions()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadFilterOptions);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, bool isRefresh) getUserDataByName,
    required TResult Function(Map<String, bool> filterOptions) filterList,
    required TResult Function() loadFilterOptions,
    required TResult Function() filterCheckRequest,
  }) {
    return loadFilterOptions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, bool isRefresh)? getUserDataByName,
    TResult Function(Map<String, bool> filterOptions)? filterList,
    TResult Function()? loadFilterOptions,
    TResult Function()? filterCheckRequest,
  }) {
    return loadFilterOptions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, bool isRefresh)? getUserDataByName,
    TResult Function(Map<String, bool> filterOptions)? filterList,
    TResult Function()? loadFilterOptions,
    TResult Function()? filterCheckRequest,
    required TResult orElse(),
  }) {
    if (loadFilterOptions != null) {
      return loadFilterOptions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserDataByName value) getUserDataByName,
    required TResult Function(FilterList value) filterList,
    required TResult Function(LoadFilterOptions value) loadFilterOptions,
    required TResult Function(FilterCheckRequest value) filterCheckRequest,
  }) {
    return loadFilterOptions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetUserDataByName value)? getUserDataByName,
    TResult Function(FilterList value)? filterList,
    TResult Function(LoadFilterOptions value)? loadFilterOptions,
    TResult Function(FilterCheckRequest value)? filterCheckRequest,
  }) {
    return loadFilterOptions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserDataByName value)? getUserDataByName,
    TResult Function(FilterList value)? filterList,
    TResult Function(LoadFilterOptions value)? loadFilterOptions,
    TResult Function(FilterCheckRequest value)? filterCheckRequest,
    required TResult orElse(),
  }) {
    if (loadFilterOptions != null) {
      return loadFilterOptions(this);
    }
    return orElse();
  }
}

abstract class LoadFilterOptions implements GithubEvent {
  const factory LoadFilterOptions() = _$LoadFilterOptions;
}

/// @nodoc
abstract class $FilterCheckRequestCopyWith<$Res> {
  factory $FilterCheckRequestCopyWith(
          FilterCheckRequest value, $Res Function(FilterCheckRequest) then) =
      _$FilterCheckRequestCopyWithImpl<$Res>;
}

/// @nodoc
class _$FilterCheckRequestCopyWithImpl<$Res>
    extends _$GithubEventCopyWithImpl<$Res>
    implements $FilterCheckRequestCopyWith<$Res> {
  _$FilterCheckRequestCopyWithImpl(
      FilterCheckRequest _value, $Res Function(FilterCheckRequest) _then)
      : super(_value, (v) => _then(v as FilterCheckRequest));

  @override
  FilterCheckRequest get _value => super._value as FilterCheckRequest;
}

/// @nodoc

class _$FilterCheckRequest implements FilterCheckRequest {
  const _$FilterCheckRequest();

  @override
  String toString() {
    return 'GithubEvent.filterCheckRequest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FilterCheckRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, bool isRefresh) getUserDataByName,
    required TResult Function(Map<String, bool> filterOptions) filterList,
    required TResult Function() loadFilterOptions,
    required TResult Function() filterCheckRequest,
  }) {
    return filterCheckRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, bool isRefresh)? getUserDataByName,
    TResult Function(Map<String, bool> filterOptions)? filterList,
    TResult Function()? loadFilterOptions,
    TResult Function()? filterCheckRequest,
  }) {
    return filterCheckRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, bool isRefresh)? getUserDataByName,
    TResult Function(Map<String, bool> filterOptions)? filterList,
    TResult Function()? loadFilterOptions,
    TResult Function()? filterCheckRequest,
    required TResult orElse(),
  }) {
    if (filterCheckRequest != null) {
      return filterCheckRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserDataByName value) getUserDataByName,
    required TResult Function(FilterList value) filterList,
    required TResult Function(LoadFilterOptions value) loadFilterOptions,
    required TResult Function(FilterCheckRequest value) filterCheckRequest,
  }) {
    return filterCheckRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetUserDataByName value)? getUserDataByName,
    TResult Function(FilterList value)? filterList,
    TResult Function(LoadFilterOptions value)? loadFilterOptions,
    TResult Function(FilterCheckRequest value)? filterCheckRequest,
  }) {
    return filterCheckRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserDataByName value)? getUserDataByName,
    TResult Function(FilterList value)? filterList,
    TResult Function(LoadFilterOptions value)? loadFilterOptions,
    TResult Function(FilterCheckRequest value)? filterCheckRequest,
    required TResult orElse(),
  }) {
    if (filterCheckRequest != null) {
      return filterCheckRequest(this);
    }
    return orElse();
  }
}

abstract class FilterCheckRequest implements GithubEvent {
  const factory FilterCheckRequest() = _$FilterCheckRequest;
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

  _UserDataLoaded userDataLoaded(GithubUserData githubUserData) {
    return _UserDataLoaded(
      githubUserData,
    );
  }

  _UserDataLoadingError userDataLoadingError(GithubFailure githubFailure) {
    return _UserDataLoadingError(
      githubFailure,
    );
  }

  _ListFiltered listFiltered(List<GithubRepo> listOfFilteredRepos) {
    return _ListFiltered(
      listOfFilteredRepos,
    );
  }

  _FilterOptionsLoaded filterOptionsLoaded(Map<String, bool> filterOptions) {
    return _FilterOptionsLoaded(
      filterOptions,
    );
  }

  _RefreshError refreshError(GithubFailure githubFailure) {
    return _RefreshError(
      githubFailure,
    );
  }

  _Refreshing refreshing() {
    return const _Refreshing();
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
    required TResult Function(GithubUserData githubUserData) userDataLoaded,
    required TResult Function(GithubFailure githubFailure) userDataLoadingError,
    required TResult Function(List<GithubRepo> listOfFilteredRepos)
        listFiltered,
    required TResult Function(Map<String, bool> filterOptions)
        filterOptionsLoaded,
    required TResult Function(GithubFailure githubFailure) refreshError,
    required TResult Function() refreshing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GithubUserData githubUserData)? userDataLoaded,
    TResult Function(GithubFailure githubFailure)? userDataLoadingError,
    TResult Function(List<GithubRepo> listOfFilteredRepos)? listFiltered,
    TResult Function(Map<String, bool> filterOptions)? filterOptionsLoaded,
    TResult Function(GithubFailure githubFailure)? refreshError,
    TResult Function()? refreshing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GithubUserData githubUserData)? userDataLoaded,
    TResult Function(GithubFailure githubFailure)? userDataLoadingError,
    TResult Function(List<GithubRepo> listOfFilteredRepos)? listFiltered,
    TResult Function(Map<String, bool> filterOptions)? filterOptionsLoaded,
    TResult Function(GithubFailure githubFailure)? refreshError,
    TResult Function()? refreshing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UserDataLoaded value) userDataLoaded,
    required TResult Function(_UserDataLoadingError value) userDataLoadingError,
    required TResult Function(_ListFiltered value) listFiltered,
    required TResult Function(_FilterOptionsLoaded value) filterOptionsLoaded,
    required TResult Function(_RefreshError value) refreshError,
    required TResult Function(_Refreshing value) refreshing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserDataLoaded value)? userDataLoaded,
    TResult Function(_UserDataLoadingError value)? userDataLoadingError,
    TResult Function(_ListFiltered value)? listFiltered,
    TResult Function(_FilterOptionsLoaded value)? filterOptionsLoaded,
    TResult Function(_RefreshError value)? refreshError,
    TResult Function(_Refreshing value)? refreshing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserDataLoaded value)? userDataLoaded,
    TResult Function(_UserDataLoadingError value)? userDataLoadingError,
    TResult Function(_ListFiltered value)? listFiltered,
    TResult Function(_FilterOptionsLoaded value)? filterOptionsLoaded,
    TResult Function(_RefreshError value)? refreshError,
    TResult Function(_Refreshing value)? refreshing,
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
    required TResult Function(GithubUserData githubUserData) userDataLoaded,
    required TResult Function(GithubFailure githubFailure) userDataLoadingError,
    required TResult Function(List<GithubRepo> listOfFilteredRepos)
        listFiltered,
    required TResult Function(Map<String, bool> filterOptions)
        filterOptionsLoaded,
    required TResult Function(GithubFailure githubFailure) refreshError,
    required TResult Function() refreshing,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GithubUserData githubUserData)? userDataLoaded,
    TResult Function(GithubFailure githubFailure)? userDataLoadingError,
    TResult Function(List<GithubRepo> listOfFilteredRepos)? listFiltered,
    TResult Function(Map<String, bool> filterOptions)? filterOptionsLoaded,
    TResult Function(GithubFailure githubFailure)? refreshError,
    TResult Function()? refreshing,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GithubUserData githubUserData)? userDataLoaded,
    TResult Function(GithubFailure githubFailure)? userDataLoadingError,
    TResult Function(List<GithubRepo> listOfFilteredRepos)? listFiltered,
    TResult Function(Map<String, bool> filterOptions)? filterOptionsLoaded,
    TResult Function(GithubFailure githubFailure)? refreshError,
    TResult Function()? refreshing,
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
    required TResult Function(_UserDataLoaded value) userDataLoaded,
    required TResult Function(_UserDataLoadingError value) userDataLoadingError,
    required TResult Function(_ListFiltered value) listFiltered,
    required TResult Function(_FilterOptionsLoaded value) filterOptionsLoaded,
    required TResult Function(_RefreshError value) refreshError,
    required TResult Function(_Refreshing value) refreshing,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserDataLoaded value)? userDataLoaded,
    TResult Function(_UserDataLoadingError value)? userDataLoadingError,
    TResult Function(_ListFiltered value)? listFiltered,
    TResult Function(_FilterOptionsLoaded value)? filterOptionsLoaded,
    TResult Function(_RefreshError value)? refreshError,
    TResult Function(_Refreshing value)? refreshing,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserDataLoaded value)? userDataLoaded,
    TResult Function(_UserDataLoadingError value)? userDataLoadingError,
    TResult Function(_ListFiltered value)? listFiltered,
    TResult Function(_FilterOptionsLoaded value)? filterOptionsLoaded,
    TResult Function(_RefreshError value)? refreshError,
    TResult Function(_Refreshing value)? refreshing,
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
    required TResult Function(GithubUserData githubUserData) userDataLoaded,
    required TResult Function(GithubFailure githubFailure) userDataLoadingError,
    required TResult Function(List<GithubRepo> listOfFilteredRepos)
        listFiltered,
    required TResult Function(Map<String, bool> filterOptions)
        filterOptionsLoaded,
    required TResult Function(GithubFailure githubFailure) refreshError,
    required TResult Function() refreshing,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GithubUserData githubUserData)? userDataLoaded,
    TResult Function(GithubFailure githubFailure)? userDataLoadingError,
    TResult Function(List<GithubRepo> listOfFilteredRepos)? listFiltered,
    TResult Function(Map<String, bool> filterOptions)? filterOptionsLoaded,
    TResult Function(GithubFailure githubFailure)? refreshError,
    TResult Function()? refreshing,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GithubUserData githubUserData)? userDataLoaded,
    TResult Function(GithubFailure githubFailure)? userDataLoadingError,
    TResult Function(List<GithubRepo> listOfFilteredRepos)? listFiltered,
    TResult Function(Map<String, bool> filterOptions)? filterOptionsLoaded,
    TResult Function(GithubFailure githubFailure)? refreshError,
    TResult Function()? refreshing,
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
    required TResult Function(_UserDataLoaded value) userDataLoaded,
    required TResult Function(_UserDataLoadingError value) userDataLoadingError,
    required TResult Function(_ListFiltered value) listFiltered,
    required TResult Function(_FilterOptionsLoaded value) filterOptionsLoaded,
    required TResult Function(_RefreshError value) refreshError,
    required TResult Function(_Refreshing value) refreshing,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserDataLoaded value)? userDataLoaded,
    TResult Function(_UserDataLoadingError value)? userDataLoadingError,
    TResult Function(_ListFiltered value)? listFiltered,
    TResult Function(_FilterOptionsLoaded value)? filterOptionsLoaded,
    TResult Function(_RefreshError value)? refreshError,
    TResult Function(_Refreshing value)? refreshing,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserDataLoaded value)? userDataLoaded,
    TResult Function(_UserDataLoadingError value)? userDataLoadingError,
    TResult Function(_ListFiltered value)? listFiltered,
    TResult Function(_FilterOptionsLoaded value)? filterOptionsLoaded,
    TResult Function(_RefreshError value)? refreshError,
    TResult Function(_Refreshing value)? refreshing,
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
abstract class _$UserDataLoadedCopyWith<$Res> {
  factory _$UserDataLoadedCopyWith(
          _UserDataLoaded value, $Res Function(_UserDataLoaded) then) =
      __$UserDataLoadedCopyWithImpl<$Res>;
  $Res call({GithubUserData githubUserData});

  $GithubUserDataCopyWith<$Res> get githubUserData;
}

/// @nodoc
class __$UserDataLoadedCopyWithImpl<$Res>
    extends _$GithubStateCopyWithImpl<$Res>
    implements _$UserDataLoadedCopyWith<$Res> {
  __$UserDataLoadedCopyWithImpl(
      _UserDataLoaded _value, $Res Function(_UserDataLoaded) _then)
      : super(_value, (v) => _then(v as _UserDataLoaded));

  @override
  _UserDataLoaded get _value => super._value as _UserDataLoaded;

  @override
  $Res call({
    Object? githubUserData = freezed,
  }) {
    return _then(_UserDataLoaded(
      githubUserData == freezed
          ? _value.githubUserData
          : githubUserData // ignore: cast_nullable_to_non_nullable
              as GithubUserData,
    ));
  }

  @override
  $GithubUserDataCopyWith<$Res> get githubUserData {
    return $GithubUserDataCopyWith<$Res>(_value.githubUserData, (value) {
      return _then(_value.copyWith(githubUserData: value));
    });
  }
}

/// @nodoc

class _$_UserDataLoaded implements _UserDataLoaded {
  const _$_UserDataLoaded(this.githubUserData);

  @override
  final GithubUserData githubUserData;

  @override
  String toString() {
    return 'GithubState.userDataLoaded(githubUserData: $githubUserData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDataLoaded &&
            (identical(other.githubUserData, githubUserData) ||
                other.githubUserData == githubUserData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, githubUserData);

  @JsonKey(ignore: true)
  @override
  _$UserDataLoadedCopyWith<_UserDataLoaded> get copyWith =>
      __$UserDataLoadedCopyWithImpl<_UserDataLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GithubUserData githubUserData) userDataLoaded,
    required TResult Function(GithubFailure githubFailure) userDataLoadingError,
    required TResult Function(List<GithubRepo> listOfFilteredRepos)
        listFiltered,
    required TResult Function(Map<String, bool> filterOptions)
        filterOptionsLoaded,
    required TResult Function(GithubFailure githubFailure) refreshError,
    required TResult Function() refreshing,
  }) {
    return userDataLoaded(githubUserData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GithubUserData githubUserData)? userDataLoaded,
    TResult Function(GithubFailure githubFailure)? userDataLoadingError,
    TResult Function(List<GithubRepo> listOfFilteredRepos)? listFiltered,
    TResult Function(Map<String, bool> filterOptions)? filterOptionsLoaded,
    TResult Function(GithubFailure githubFailure)? refreshError,
    TResult Function()? refreshing,
  }) {
    return userDataLoaded?.call(githubUserData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GithubUserData githubUserData)? userDataLoaded,
    TResult Function(GithubFailure githubFailure)? userDataLoadingError,
    TResult Function(List<GithubRepo> listOfFilteredRepos)? listFiltered,
    TResult Function(Map<String, bool> filterOptions)? filterOptionsLoaded,
    TResult Function(GithubFailure githubFailure)? refreshError,
    TResult Function()? refreshing,
    required TResult orElse(),
  }) {
    if (userDataLoaded != null) {
      return userDataLoaded(githubUserData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UserDataLoaded value) userDataLoaded,
    required TResult Function(_UserDataLoadingError value) userDataLoadingError,
    required TResult Function(_ListFiltered value) listFiltered,
    required TResult Function(_FilterOptionsLoaded value) filterOptionsLoaded,
    required TResult Function(_RefreshError value) refreshError,
    required TResult Function(_Refreshing value) refreshing,
  }) {
    return userDataLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserDataLoaded value)? userDataLoaded,
    TResult Function(_UserDataLoadingError value)? userDataLoadingError,
    TResult Function(_ListFiltered value)? listFiltered,
    TResult Function(_FilterOptionsLoaded value)? filterOptionsLoaded,
    TResult Function(_RefreshError value)? refreshError,
    TResult Function(_Refreshing value)? refreshing,
  }) {
    return userDataLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserDataLoaded value)? userDataLoaded,
    TResult Function(_UserDataLoadingError value)? userDataLoadingError,
    TResult Function(_ListFiltered value)? listFiltered,
    TResult Function(_FilterOptionsLoaded value)? filterOptionsLoaded,
    TResult Function(_RefreshError value)? refreshError,
    TResult Function(_Refreshing value)? refreshing,
    required TResult orElse(),
  }) {
    if (userDataLoaded != null) {
      return userDataLoaded(this);
    }
    return orElse();
  }
}

abstract class _UserDataLoaded implements GithubState {
  const factory _UserDataLoaded(GithubUserData githubUserData) =
      _$_UserDataLoaded;

  GithubUserData get githubUserData;
  @JsonKey(ignore: true)
  _$UserDataLoadedCopyWith<_UserDataLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UserDataLoadingErrorCopyWith<$Res> {
  factory _$UserDataLoadingErrorCopyWith(_UserDataLoadingError value,
          $Res Function(_UserDataLoadingError) then) =
      __$UserDataLoadingErrorCopyWithImpl<$Res>;
  $Res call({GithubFailure githubFailure});

  $GithubFailureCopyWith<$Res> get githubFailure;
}

/// @nodoc
class __$UserDataLoadingErrorCopyWithImpl<$Res>
    extends _$GithubStateCopyWithImpl<$Res>
    implements _$UserDataLoadingErrorCopyWith<$Res> {
  __$UserDataLoadingErrorCopyWithImpl(
      _UserDataLoadingError _value, $Res Function(_UserDataLoadingError) _then)
      : super(_value, (v) => _then(v as _UserDataLoadingError));

  @override
  _UserDataLoadingError get _value => super._value as _UserDataLoadingError;

  @override
  $Res call({
    Object? githubFailure = freezed,
  }) {
    return _then(_UserDataLoadingError(
      githubFailure == freezed
          ? _value.githubFailure
          : githubFailure // ignore: cast_nullable_to_non_nullable
              as GithubFailure,
    ));
  }

  @override
  $GithubFailureCopyWith<$Res> get githubFailure {
    return $GithubFailureCopyWith<$Res>(_value.githubFailure, (value) {
      return _then(_value.copyWith(githubFailure: value));
    });
  }
}

/// @nodoc

class _$_UserDataLoadingError implements _UserDataLoadingError {
  const _$_UserDataLoadingError(this.githubFailure);

  @override
  final GithubFailure githubFailure;

  @override
  String toString() {
    return 'GithubState.userDataLoadingError(githubFailure: $githubFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDataLoadingError &&
            (identical(other.githubFailure, githubFailure) ||
                other.githubFailure == githubFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, githubFailure);

  @JsonKey(ignore: true)
  @override
  _$UserDataLoadingErrorCopyWith<_UserDataLoadingError> get copyWith =>
      __$UserDataLoadingErrorCopyWithImpl<_UserDataLoadingError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GithubUserData githubUserData) userDataLoaded,
    required TResult Function(GithubFailure githubFailure) userDataLoadingError,
    required TResult Function(List<GithubRepo> listOfFilteredRepos)
        listFiltered,
    required TResult Function(Map<String, bool> filterOptions)
        filterOptionsLoaded,
    required TResult Function(GithubFailure githubFailure) refreshError,
    required TResult Function() refreshing,
  }) {
    return userDataLoadingError(githubFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GithubUserData githubUserData)? userDataLoaded,
    TResult Function(GithubFailure githubFailure)? userDataLoadingError,
    TResult Function(List<GithubRepo> listOfFilteredRepos)? listFiltered,
    TResult Function(Map<String, bool> filterOptions)? filterOptionsLoaded,
    TResult Function(GithubFailure githubFailure)? refreshError,
    TResult Function()? refreshing,
  }) {
    return userDataLoadingError?.call(githubFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GithubUserData githubUserData)? userDataLoaded,
    TResult Function(GithubFailure githubFailure)? userDataLoadingError,
    TResult Function(List<GithubRepo> listOfFilteredRepos)? listFiltered,
    TResult Function(Map<String, bool> filterOptions)? filterOptionsLoaded,
    TResult Function(GithubFailure githubFailure)? refreshError,
    TResult Function()? refreshing,
    required TResult orElse(),
  }) {
    if (userDataLoadingError != null) {
      return userDataLoadingError(githubFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UserDataLoaded value) userDataLoaded,
    required TResult Function(_UserDataLoadingError value) userDataLoadingError,
    required TResult Function(_ListFiltered value) listFiltered,
    required TResult Function(_FilterOptionsLoaded value) filterOptionsLoaded,
    required TResult Function(_RefreshError value) refreshError,
    required TResult Function(_Refreshing value) refreshing,
  }) {
    return userDataLoadingError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserDataLoaded value)? userDataLoaded,
    TResult Function(_UserDataLoadingError value)? userDataLoadingError,
    TResult Function(_ListFiltered value)? listFiltered,
    TResult Function(_FilterOptionsLoaded value)? filterOptionsLoaded,
    TResult Function(_RefreshError value)? refreshError,
    TResult Function(_Refreshing value)? refreshing,
  }) {
    return userDataLoadingError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserDataLoaded value)? userDataLoaded,
    TResult Function(_UserDataLoadingError value)? userDataLoadingError,
    TResult Function(_ListFiltered value)? listFiltered,
    TResult Function(_FilterOptionsLoaded value)? filterOptionsLoaded,
    TResult Function(_RefreshError value)? refreshError,
    TResult Function(_Refreshing value)? refreshing,
    required TResult orElse(),
  }) {
    if (userDataLoadingError != null) {
      return userDataLoadingError(this);
    }
    return orElse();
  }
}

abstract class _UserDataLoadingError implements GithubState {
  const factory _UserDataLoadingError(GithubFailure githubFailure) =
      _$_UserDataLoadingError;

  GithubFailure get githubFailure;
  @JsonKey(ignore: true)
  _$UserDataLoadingErrorCopyWith<_UserDataLoadingError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ListFilteredCopyWith<$Res> {
  factory _$ListFilteredCopyWith(
          _ListFiltered value, $Res Function(_ListFiltered) then) =
      __$ListFilteredCopyWithImpl<$Res>;
  $Res call({List<GithubRepo> listOfFilteredRepos});
}

/// @nodoc
class __$ListFilteredCopyWithImpl<$Res> extends _$GithubStateCopyWithImpl<$Res>
    implements _$ListFilteredCopyWith<$Res> {
  __$ListFilteredCopyWithImpl(
      _ListFiltered _value, $Res Function(_ListFiltered) _then)
      : super(_value, (v) => _then(v as _ListFiltered));

  @override
  _ListFiltered get _value => super._value as _ListFiltered;

  @override
  $Res call({
    Object? listOfFilteredRepos = freezed,
  }) {
    return _then(_ListFiltered(
      listOfFilteredRepos == freezed
          ? _value.listOfFilteredRepos
          : listOfFilteredRepos // ignore: cast_nullable_to_non_nullable
              as List<GithubRepo>,
    ));
  }
}

/// @nodoc

class _$_ListFiltered implements _ListFiltered {
  const _$_ListFiltered(this.listOfFilteredRepos);

  @override
  final List<GithubRepo> listOfFilteredRepos;

  @override
  String toString() {
    return 'GithubState.listFiltered(listOfFilteredRepos: $listOfFilteredRepos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListFiltered &&
            const DeepCollectionEquality()
                .equals(other.listOfFilteredRepos, listOfFilteredRepos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(listOfFilteredRepos));

  @JsonKey(ignore: true)
  @override
  _$ListFilteredCopyWith<_ListFiltered> get copyWith =>
      __$ListFilteredCopyWithImpl<_ListFiltered>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GithubUserData githubUserData) userDataLoaded,
    required TResult Function(GithubFailure githubFailure) userDataLoadingError,
    required TResult Function(List<GithubRepo> listOfFilteredRepos)
        listFiltered,
    required TResult Function(Map<String, bool> filterOptions)
        filterOptionsLoaded,
    required TResult Function(GithubFailure githubFailure) refreshError,
    required TResult Function() refreshing,
  }) {
    return listFiltered(listOfFilteredRepos);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GithubUserData githubUserData)? userDataLoaded,
    TResult Function(GithubFailure githubFailure)? userDataLoadingError,
    TResult Function(List<GithubRepo> listOfFilteredRepos)? listFiltered,
    TResult Function(Map<String, bool> filterOptions)? filterOptionsLoaded,
    TResult Function(GithubFailure githubFailure)? refreshError,
    TResult Function()? refreshing,
  }) {
    return listFiltered?.call(listOfFilteredRepos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GithubUserData githubUserData)? userDataLoaded,
    TResult Function(GithubFailure githubFailure)? userDataLoadingError,
    TResult Function(List<GithubRepo> listOfFilteredRepos)? listFiltered,
    TResult Function(Map<String, bool> filterOptions)? filterOptionsLoaded,
    TResult Function(GithubFailure githubFailure)? refreshError,
    TResult Function()? refreshing,
    required TResult orElse(),
  }) {
    if (listFiltered != null) {
      return listFiltered(listOfFilteredRepos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UserDataLoaded value) userDataLoaded,
    required TResult Function(_UserDataLoadingError value) userDataLoadingError,
    required TResult Function(_ListFiltered value) listFiltered,
    required TResult Function(_FilterOptionsLoaded value) filterOptionsLoaded,
    required TResult Function(_RefreshError value) refreshError,
    required TResult Function(_Refreshing value) refreshing,
  }) {
    return listFiltered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserDataLoaded value)? userDataLoaded,
    TResult Function(_UserDataLoadingError value)? userDataLoadingError,
    TResult Function(_ListFiltered value)? listFiltered,
    TResult Function(_FilterOptionsLoaded value)? filterOptionsLoaded,
    TResult Function(_RefreshError value)? refreshError,
    TResult Function(_Refreshing value)? refreshing,
  }) {
    return listFiltered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserDataLoaded value)? userDataLoaded,
    TResult Function(_UserDataLoadingError value)? userDataLoadingError,
    TResult Function(_ListFiltered value)? listFiltered,
    TResult Function(_FilterOptionsLoaded value)? filterOptionsLoaded,
    TResult Function(_RefreshError value)? refreshError,
    TResult Function(_Refreshing value)? refreshing,
    required TResult orElse(),
  }) {
    if (listFiltered != null) {
      return listFiltered(this);
    }
    return orElse();
  }
}

abstract class _ListFiltered implements GithubState {
  const factory _ListFiltered(List<GithubRepo> listOfFilteredRepos) =
      _$_ListFiltered;

  List<GithubRepo> get listOfFilteredRepos;
  @JsonKey(ignore: true)
  _$ListFilteredCopyWith<_ListFiltered> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FilterOptionsLoadedCopyWith<$Res> {
  factory _$FilterOptionsLoadedCopyWith(_FilterOptionsLoaded value,
          $Res Function(_FilterOptionsLoaded) then) =
      __$FilterOptionsLoadedCopyWithImpl<$Res>;
  $Res call({Map<String, bool> filterOptions});
}

/// @nodoc
class __$FilterOptionsLoadedCopyWithImpl<$Res>
    extends _$GithubStateCopyWithImpl<$Res>
    implements _$FilterOptionsLoadedCopyWith<$Res> {
  __$FilterOptionsLoadedCopyWithImpl(
      _FilterOptionsLoaded _value, $Res Function(_FilterOptionsLoaded) _then)
      : super(_value, (v) => _then(v as _FilterOptionsLoaded));

  @override
  _FilterOptionsLoaded get _value => super._value as _FilterOptionsLoaded;

  @override
  $Res call({
    Object? filterOptions = freezed,
  }) {
    return _then(_FilterOptionsLoaded(
      filterOptions == freezed
          ? _value.filterOptions
          : filterOptions // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ));
  }
}

/// @nodoc

class _$_FilterOptionsLoaded implements _FilterOptionsLoaded {
  const _$_FilterOptionsLoaded(this.filterOptions);

  @override
  final Map<String, bool> filterOptions;

  @override
  String toString() {
    return 'GithubState.filterOptionsLoaded(filterOptions: $filterOptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FilterOptionsLoaded &&
            const DeepCollectionEquality()
                .equals(other.filterOptions, filterOptions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(filterOptions));

  @JsonKey(ignore: true)
  @override
  _$FilterOptionsLoadedCopyWith<_FilterOptionsLoaded> get copyWith =>
      __$FilterOptionsLoadedCopyWithImpl<_FilterOptionsLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GithubUserData githubUserData) userDataLoaded,
    required TResult Function(GithubFailure githubFailure) userDataLoadingError,
    required TResult Function(List<GithubRepo> listOfFilteredRepos)
        listFiltered,
    required TResult Function(Map<String, bool> filterOptions)
        filterOptionsLoaded,
    required TResult Function(GithubFailure githubFailure) refreshError,
    required TResult Function() refreshing,
  }) {
    return filterOptionsLoaded(filterOptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GithubUserData githubUserData)? userDataLoaded,
    TResult Function(GithubFailure githubFailure)? userDataLoadingError,
    TResult Function(List<GithubRepo> listOfFilteredRepos)? listFiltered,
    TResult Function(Map<String, bool> filterOptions)? filterOptionsLoaded,
    TResult Function(GithubFailure githubFailure)? refreshError,
    TResult Function()? refreshing,
  }) {
    return filterOptionsLoaded?.call(filterOptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GithubUserData githubUserData)? userDataLoaded,
    TResult Function(GithubFailure githubFailure)? userDataLoadingError,
    TResult Function(List<GithubRepo> listOfFilteredRepos)? listFiltered,
    TResult Function(Map<String, bool> filterOptions)? filterOptionsLoaded,
    TResult Function(GithubFailure githubFailure)? refreshError,
    TResult Function()? refreshing,
    required TResult orElse(),
  }) {
    if (filterOptionsLoaded != null) {
      return filterOptionsLoaded(filterOptions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UserDataLoaded value) userDataLoaded,
    required TResult Function(_UserDataLoadingError value) userDataLoadingError,
    required TResult Function(_ListFiltered value) listFiltered,
    required TResult Function(_FilterOptionsLoaded value) filterOptionsLoaded,
    required TResult Function(_RefreshError value) refreshError,
    required TResult Function(_Refreshing value) refreshing,
  }) {
    return filterOptionsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserDataLoaded value)? userDataLoaded,
    TResult Function(_UserDataLoadingError value)? userDataLoadingError,
    TResult Function(_ListFiltered value)? listFiltered,
    TResult Function(_FilterOptionsLoaded value)? filterOptionsLoaded,
    TResult Function(_RefreshError value)? refreshError,
    TResult Function(_Refreshing value)? refreshing,
  }) {
    return filterOptionsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserDataLoaded value)? userDataLoaded,
    TResult Function(_UserDataLoadingError value)? userDataLoadingError,
    TResult Function(_ListFiltered value)? listFiltered,
    TResult Function(_FilterOptionsLoaded value)? filterOptionsLoaded,
    TResult Function(_RefreshError value)? refreshError,
    TResult Function(_Refreshing value)? refreshing,
    required TResult orElse(),
  }) {
    if (filterOptionsLoaded != null) {
      return filterOptionsLoaded(this);
    }
    return orElse();
  }
}

abstract class _FilterOptionsLoaded implements GithubState {
  const factory _FilterOptionsLoaded(Map<String, bool> filterOptions) =
      _$_FilterOptionsLoaded;

  Map<String, bool> get filterOptions;
  @JsonKey(ignore: true)
  _$FilterOptionsLoadedCopyWith<_FilterOptionsLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RefreshErrorCopyWith<$Res> {
  factory _$RefreshErrorCopyWith(
          _RefreshError value, $Res Function(_RefreshError) then) =
      __$RefreshErrorCopyWithImpl<$Res>;
  $Res call({GithubFailure githubFailure});

  $GithubFailureCopyWith<$Res> get githubFailure;
}

/// @nodoc
class __$RefreshErrorCopyWithImpl<$Res> extends _$GithubStateCopyWithImpl<$Res>
    implements _$RefreshErrorCopyWith<$Res> {
  __$RefreshErrorCopyWithImpl(
      _RefreshError _value, $Res Function(_RefreshError) _then)
      : super(_value, (v) => _then(v as _RefreshError));

  @override
  _RefreshError get _value => super._value as _RefreshError;

  @override
  $Res call({
    Object? githubFailure = freezed,
  }) {
    return _then(_RefreshError(
      githubFailure == freezed
          ? _value.githubFailure
          : githubFailure // ignore: cast_nullable_to_non_nullable
              as GithubFailure,
    ));
  }

  @override
  $GithubFailureCopyWith<$Res> get githubFailure {
    return $GithubFailureCopyWith<$Res>(_value.githubFailure, (value) {
      return _then(_value.copyWith(githubFailure: value));
    });
  }
}

/// @nodoc

class _$_RefreshError implements _RefreshError {
  const _$_RefreshError(this.githubFailure);

  @override
  final GithubFailure githubFailure;

  @override
  String toString() {
    return 'GithubState.refreshError(githubFailure: $githubFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RefreshError &&
            (identical(other.githubFailure, githubFailure) ||
                other.githubFailure == githubFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, githubFailure);

  @JsonKey(ignore: true)
  @override
  _$RefreshErrorCopyWith<_RefreshError> get copyWith =>
      __$RefreshErrorCopyWithImpl<_RefreshError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GithubUserData githubUserData) userDataLoaded,
    required TResult Function(GithubFailure githubFailure) userDataLoadingError,
    required TResult Function(List<GithubRepo> listOfFilteredRepos)
        listFiltered,
    required TResult Function(Map<String, bool> filterOptions)
        filterOptionsLoaded,
    required TResult Function(GithubFailure githubFailure) refreshError,
    required TResult Function() refreshing,
  }) {
    return refreshError(githubFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GithubUserData githubUserData)? userDataLoaded,
    TResult Function(GithubFailure githubFailure)? userDataLoadingError,
    TResult Function(List<GithubRepo> listOfFilteredRepos)? listFiltered,
    TResult Function(Map<String, bool> filterOptions)? filterOptionsLoaded,
    TResult Function(GithubFailure githubFailure)? refreshError,
    TResult Function()? refreshing,
  }) {
    return refreshError?.call(githubFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GithubUserData githubUserData)? userDataLoaded,
    TResult Function(GithubFailure githubFailure)? userDataLoadingError,
    TResult Function(List<GithubRepo> listOfFilteredRepos)? listFiltered,
    TResult Function(Map<String, bool> filterOptions)? filterOptionsLoaded,
    TResult Function(GithubFailure githubFailure)? refreshError,
    TResult Function()? refreshing,
    required TResult orElse(),
  }) {
    if (refreshError != null) {
      return refreshError(githubFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UserDataLoaded value) userDataLoaded,
    required TResult Function(_UserDataLoadingError value) userDataLoadingError,
    required TResult Function(_ListFiltered value) listFiltered,
    required TResult Function(_FilterOptionsLoaded value) filterOptionsLoaded,
    required TResult Function(_RefreshError value) refreshError,
    required TResult Function(_Refreshing value) refreshing,
  }) {
    return refreshError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserDataLoaded value)? userDataLoaded,
    TResult Function(_UserDataLoadingError value)? userDataLoadingError,
    TResult Function(_ListFiltered value)? listFiltered,
    TResult Function(_FilterOptionsLoaded value)? filterOptionsLoaded,
    TResult Function(_RefreshError value)? refreshError,
    TResult Function(_Refreshing value)? refreshing,
  }) {
    return refreshError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserDataLoaded value)? userDataLoaded,
    TResult Function(_UserDataLoadingError value)? userDataLoadingError,
    TResult Function(_ListFiltered value)? listFiltered,
    TResult Function(_FilterOptionsLoaded value)? filterOptionsLoaded,
    TResult Function(_RefreshError value)? refreshError,
    TResult Function(_Refreshing value)? refreshing,
    required TResult orElse(),
  }) {
    if (refreshError != null) {
      return refreshError(this);
    }
    return orElse();
  }
}

abstract class _RefreshError implements GithubState {
  const factory _RefreshError(GithubFailure githubFailure) = _$_RefreshError;

  GithubFailure get githubFailure;
  @JsonKey(ignore: true)
  _$RefreshErrorCopyWith<_RefreshError> get copyWith =>
      throw _privateConstructorUsedError;
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
    required TResult Function(GithubUserData githubUserData) userDataLoaded,
    required TResult Function(GithubFailure githubFailure) userDataLoadingError,
    required TResult Function(List<GithubRepo> listOfFilteredRepos)
        listFiltered,
    required TResult Function(Map<String, bool> filterOptions)
        filterOptionsLoaded,
    required TResult Function(GithubFailure githubFailure) refreshError,
    required TResult Function() refreshing,
  }) {
    return refreshing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GithubUserData githubUserData)? userDataLoaded,
    TResult Function(GithubFailure githubFailure)? userDataLoadingError,
    TResult Function(List<GithubRepo> listOfFilteredRepos)? listFiltered,
    TResult Function(Map<String, bool> filterOptions)? filterOptionsLoaded,
    TResult Function(GithubFailure githubFailure)? refreshError,
    TResult Function()? refreshing,
  }) {
    return refreshing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GithubUserData githubUserData)? userDataLoaded,
    TResult Function(GithubFailure githubFailure)? userDataLoadingError,
    TResult Function(List<GithubRepo> listOfFilteredRepos)? listFiltered,
    TResult Function(Map<String, bool> filterOptions)? filterOptionsLoaded,
    TResult Function(GithubFailure githubFailure)? refreshError,
    TResult Function()? refreshing,
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
    required TResult Function(_UserDataLoaded value) userDataLoaded,
    required TResult Function(_UserDataLoadingError value) userDataLoadingError,
    required TResult Function(_ListFiltered value) listFiltered,
    required TResult Function(_FilterOptionsLoaded value) filterOptionsLoaded,
    required TResult Function(_RefreshError value) refreshError,
    required TResult Function(_Refreshing value) refreshing,
  }) {
    return refreshing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserDataLoaded value)? userDataLoaded,
    TResult Function(_UserDataLoadingError value)? userDataLoadingError,
    TResult Function(_ListFiltered value)? listFiltered,
    TResult Function(_FilterOptionsLoaded value)? filterOptionsLoaded,
    TResult Function(_RefreshError value)? refreshError,
    TResult Function(_Refreshing value)? refreshing,
  }) {
    return refreshing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserDataLoaded value)? userDataLoaded,
    TResult Function(_UserDataLoadingError value)? userDataLoadingError,
    TResult Function(_ListFiltered value)? listFiltered,
    TResult Function(_FilterOptionsLoaded value)? filterOptionsLoaded,
    TResult Function(_RefreshError value)? refreshError,
    TResult Function(_Refreshing value)? refreshing,
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
