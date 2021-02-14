// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'github_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GithubEventTearOff {
  const _$GithubEventTearOff();

// ignore: unused_element
  GetUserDataByName getUserDataByName(String name, bool isRefresh) {
    return GetUserDataByName(
      name,
      isRefresh,
    );
  }

// ignore: unused_element
  FilterList filterList(Map<String, bool> filterOptions) {
    return FilterList(
      filterOptions,
    );
  }

// ignore: unused_element
  LoadFilterOptions loadFilterOptions() {
    return const LoadFilterOptions();
  }

// ignore: unused_element
  FilterCheckRequest filterCheckRequest() {
    return const FilterCheckRequest();
  }
}

/// @nodoc
// ignore: unused_element
const $GithubEvent = _$GithubEventTearOff();

/// @nodoc
mixin _$GithubEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getUserDataByName(String name, bool isRefresh),
    @required Result filterList(Map<String, bool> filterOptions),
    @required Result loadFilterOptions(),
    @required Result filterCheckRequest(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getUserDataByName(String name, bool isRefresh),
    Result filterList(Map<String, bool> filterOptions),
    Result loadFilterOptions(),
    Result filterCheckRequest(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getUserDataByName(GetUserDataByName value),
    @required Result filterList(FilterList value),
    @required Result loadFilterOptions(LoadFilterOptions value),
    @required Result filterCheckRequest(FilterCheckRequest value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getUserDataByName(GetUserDataByName value),
    Result filterList(FilterList value),
    Result loadFilterOptions(LoadFilterOptions value),
    Result filterCheckRequest(FilterCheckRequest value),
    @required Result orElse(),
  });
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
    Object name = freezed,
    Object isRefresh = freezed,
  }) {
    return _then(GetUserDataByName(
      name == freezed ? _value.name : name as String,
      isRefresh == freezed ? _value.isRefresh : isRefresh as bool,
    ));
  }
}

/// @nodoc
class _$GetUserDataByName implements GetUserDataByName {
  const _$GetUserDataByName(this.name, this.isRefresh)
      : assert(name != null),
        assert(isRefresh != null);

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
        (other is GetUserDataByName &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.isRefresh, isRefresh) ||
                const DeepCollectionEquality()
                    .equals(other.isRefresh, isRefresh)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(isRefresh);

  @override
  $GetUserDataByNameCopyWith<GetUserDataByName> get copyWith =>
      _$GetUserDataByNameCopyWithImpl<GetUserDataByName>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getUserDataByName(String name, bool isRefresh),
    @required Result filterList(Map<String, bool> filterOptions),
    @required Result loadFilterOptions(),
    @required Result filterCheckRequest(),
  }) {
    assert(getUserDataByName != null);
    assert(filterList != null);
    assert(loadFilterOptions != null);
    assert(filterCheckRequest != null);
    return getUserDataByName(name, isRefresh);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getUserDataByName(String name, bool isRefresh),
    Result filterList(Map<String, bool> filterOptions),
    Result loadFilterOptions(),
    Result filterCheckRequest(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getUserDataByName != null) {
      return getUserDataByName(name, isRefresh);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getUserDataByName(GetUserDataByName value),
    @required Result filterList(FilterList value),
    @required Result loadFilterOptions(LoadFilterOptions value),
    @required Result filterCheckRequest(FilterCheckRequest value),
  }) {
    assert(getUserDataByName != null);
    assert(filterList != null);
    assert(loadFilterOptions != null);
    assert(filterCheckRequest != null);
    return getUserDataByName(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getUserDataByName(GetUserDataByName value),
    Result filterList(FilterList value),
    Result loadFilterOptions(LoadFilterOptions value),
    Result filterCheckRequest(FilterCheckRequest value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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
  $GetUserDataByNameCopyWith<GetUserDataByName> get copyWith;
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
    Object filterOptions = freezed,
  }) {
    return _then(FilterList(
      filterOptions == freezed
          ? _value.filterOptions
          : filterOptions as Map<String, bool>,
    ));
  }
}

/// @nodoc
class _$FilterList implements FilterList {
  const _$FilterList(this.filterOptions) : assert(filterOptions != null);

  @override
  final Map<String, bool> filterOptions;

  @override
  String toString() {
    return 'GithubEvent.filterList(filterOptions: $filterOptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FilterList &&
            (identical(other.filterOptions, filterOptions) ||
                const DeepCollectionEquality()
                    .equals(other.filterOptions, filterOptions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(filterOptions);

  @override
  $FilterListCopyWith<FilterList> get copyWith =>
      _$FilterListCopyWithImpl<FilterList>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getUserDataByName(String name, bool isRefresh),
    @required Result filterList(Map<String, bool> filterOptions),
    @required Result loadFilterOptions(),
    @required Result filterCheckRequest(),
  }) {
    assert(getUserDataByName != null);
    assert(filterList != null);
    assert(loadFilterOptions != null);
    assert(filterCheckRequest != null);
    return filterList(filterOptions);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getUserDataByName(String name, bool isRefresh),
    Result filterList(Map<String, bool> filterOptions),
    Result loadFilterOptions(),
    Result filterCheckRequest(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (filterList != null) {
      return filterList(filterOptions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getUserDataByName(GetUserDataByName value),
    @required Result filterList(FilterList value),
    @required Result loadFilterOptions(LoadFilterOptions value),
    @required Result filterCheckRequest(FilterCheckRequest value),
  }) {
    assert(getUserDataByName != null);
    assert(filterList != null);
    assert(loadFilterOptions != null);
    assert(filterCheckRequest != null);
    return filterList(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getUserDataByName(GetUserDataByName value),
    Result filterList(FilterList value),
    Result loadFilterOptions(LoadFilterOptions value),
    Result filterCheckRequest(FilterCheckRequest value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (filterList != null) {
      return filterList(this);
    }
    return orElse();
  }
}

abstract class FilterList implements GithubEvent {
  const factory FilterList(Map<String, bool> filterOptions) = _$FilterList;

  Map<String, bool> get filterOptions;
  $FilterListCopyWith<FilterList> get copyWith;
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
    return identical(this, other) || (other is LoadFilterOptions);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getUserDataByName(String name, bool isRefresh),
    @required Result filterList(Map<String, bool> filterOptions),
    @required Result loadFilterOptions(),
    @required Result filterCheckRequest(),
  }) {
    assert(getUserDataByName != null);
    assert(filterList != null);
    assert(loadFilterOptions != null);
    assert(filterCheckRequest != null);
    return loadFilterOptions();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getUserDataByName(String name, bool isRefresh),
    Result filterList(Map<String, bool> filterOptions),
    Result loadFilterOptions(),
    Result filterCheckRequest(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadFilterOptions != null) {
      return loadFilterOptions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getUserDataByName(GetUserDataByName value),
    @required Result filterList(FilterList value),
    @required Result loadFilterOptions(LoadFilterOptions value),
    @required Result filterCheckRequest(FilterCheckRequest value),
  }) {
    assert(getUserDataByName != null);
    assert(filterList != null);
    assert(loadFilterOptions != null);
    assert(filterCheckRequest != null);
    return loadFilterOptions(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getUserDataByName(GetUserDataByName value),
    Result filterList(FilterList value),
    Result loadFilterOptions(LoadFilterOptions value),
    Result filterCheckRequest(FilterCheckRequest value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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
    return identical(this, other) || (other is FilterCheckRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getUserDataByName(String name, bool isRefresh),
    @required Result filterList(Map<String, bool> filterOptions),
    @required Result loadFilterOptions(),
    @required Result filterCheckRequest(),
  }) {
    assert(getUserDataByName != null);
    assert(filterList != null);
    assert(loadFilterOptions != null);
    assert(filterCheckRequest != null);
    return filterCheckRequest();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getUserDataByName(String name, bool isRefresh),
    Result filterList(Map<String, bool> filterOptions),
    Result loadFilterOptions(),
    Result filterCheckRequest(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (filterCheckRequest != null) {
      return filterCheckRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getUserDataByName(GetUserDataByName value),
    @required Result filterList(FilterList value),
    @required Result loadFilterOptions(LoadFilterOptions value),
    @required Result filterCheckRequest(FilterCheckRequest value),
  }) {
    assert(getUserDataByName != null);
    assert(filterList != null);
    assert(loadFilterOptions != null);
    assert(filterCheckRequest != null);
    return filterCheckRequest(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getUserDataByName(GetUserDataByName value),
    Result filterList(FilterList value),
    Result loadFilterOptions(LoadFilterOptions value),
    Result filterCheckRequest(FilterCheckRequest value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _Loading loading() {
    return const _Loading();
  }

// ignore: unused_element
  _UserDataLoaded userDataLoaded(GithubUserData githubUserData) {
    return _UserDataLoaded(
      githubUserData,
    );
  }

// ignore: unused_element
  _UserDataLoadingError userDataLoadingError(GithubFailure githubFailure) {
    return _UserDataLoadingError(
      githubFailure,
    );
  }

// ignore: unused_element
  _ListFiltered listFiltered(List<GithubRepo> listOfFilteredRepos) {
    return _ListFiltered(
      listOfFilteredRepos,
    );
  }

// ignore: unused_element
  _FilterOptionsLoaded filterOptionsLoaded(Map<String, bool> filterOptions) {
    return _FilterOptionsLoaded(
      filterOptions,
    );
  }

// ignore: unused_element
  _RefreshError refreshError(GithubFailure githubFailure) {
    return _RefreshError(
      githubFailure,
    );
  }

// ignore: unused_element
  _Refreshing refreshing() {
    return const _Refreshing();
  }
}

/// @nodoc
// ignore: unused_element
const $GithubState = _$GithubStateTearOff();

/// @nodoc
mixin _$GithubState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result userDataLoaded(GithubUserData githubUserData),
    @required Result userDataLoadingError(GithubFailure githubFailure),
    @required Result listFiltered(List<GithubRepo> listOfFilteredRepos),
    @required Result filterOptionsLoaded(Map<String, bool> filterOptions),
    @required Result refreshError(GithubFailure githubFailure),
    @required Result refreshing(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result userDataLoaded(GithubUserData githubUserData),
    Result userDataLoadingError(GithubFailure githubFailure),
    Result listFiltered(List<GithubRepo> listOfFilteredRepos),
    Result filterOptionsLoaded(Map<String, bool> filterOptions),
    Result refreshError(GithubFailure githubFailure),
    Result refreshing(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result userDataLoaded(_UserDataLoaded value),
    @required Result userDataLoadingError(_UserDataLoadingError value),
    @required Result listFiltered(_ListFiltered value),
    @required Result filterOptionsLoaded(_FilterOptionsLoaded value),
    @required Result refreshError(_RefreshError value),
    @required Result refreshing(_Refreshing value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result userDataLoaded(_UserDataLoaded value),
    Result userDataLoadingError(_UserDataLoadingError value),
    Result listFiltered(_ListFiltered value),
    Result filterOptionsLoaded(_FilterOptionsLoaded value),
    Result refreshError(_RefreshError value),
    Result refreshing(_Refreshing value),
    @required Result orElse(),
  });
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
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result userDataLoaded(GithubUserData githubUserData),
    @required Result userDataLoadingError(GithubFailure githubFailure),
    @required Result listFiltered(List<GithubRepo> listOfFilteredRepos),
    @required Result filterOptionsLoaded(Map<String, bool> filterOptions),
    @required Result refreshError(GithubFailure githubFailure),
    @required Result refreshing(),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(userDataLoaded != null);
    assert(userDataLoadingError != null);
    assert(listFiltered != null);
    assert(filterOptionsLoaded != null);
    assert(refreshError != null);
    assert(refreshing != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result userDataLoaded(GithubUserData githubUserData),
    Result userDataLoadingError(GithubFailure githubFailure),
    Result listFiltered(List<GithubRepo> listOfFilteredRepos),
    Result filterOptionsLoaded(Map<String, bool> filterOptions),
    Result refreshError(GithubFailure githubFailure),
    Result refreshing(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result userDataLoaded(_UserDataLoaded value),
    @required Result userDataLoadingError(_UserDataLoadingError value),
    @required Result listFiltered(_ListFiltered value),
    @required Result filterOptionsLoaded(_FilterOptionsLoaded value),
    @required Result refreshError(_RefreshError value),
    @required Result refreshing(_Refreshing value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(userDataLoaded != null);
    assert(userDataLoadingError != null);
    assert(listFiltered != null);
    assert(filterOptionsLoaded != null);
    assert(refreshError != null);
    assert(refreshing != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result userDataLoaded(_UserDataLoaded value),
    Result userDataLoadingError(_UserDataLoadingError value),
    Result listFiltered(_ListFiltered value),
    Result filterOptionsLoaded(_FilterOptionsLoaded value),
    Result refreshError(_RefreshError value),
    Result refreshing(_Refreshing value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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
    return identical(this, other) || (other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result userDataLoaded(GithubUserData githubUserData),
    @required Result userDataLoadingError(GithubFailure githubFailure),
    @required Result listFiltered(List<GithubRepo> listOfFilteredRepos),
    @required Result filterOptionsLoaded(Map<String, bool> filterOptions),
    @required Result refreshError(GithubFailure githubFailure),
    @required Result refreshing(),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(userDataLoaded != null);
    assert(userDataLoadingError != null);
    assert(listFiltered != null);
    assert(filterOptionsLoaded != null);
    assert(refreshError != null);
    assert(refreshing != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result userDataLoaded(GithubUserData githubUserData),
    Result userDataLoadingError(GithubFailure githubFailure),
    Result listFiltered(List<GithubRepo> listOfFilteredRepos),
    Result filterOptionsLoaded(Map<String, bool> filterOptions),
    Result refreshError(GithubFailure githubFailure),
    Result refreshing(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result userDataLoaded(_UserDataLoaded value),
    @required Result userDataLoadingError(_UserDataLoadingError value),
    @required Result listFiltered(_ListFiltered value),
    @required Result filterOptionsLoaded(_FilterOptionsLoaded value),
    @required Result refreshError(_RefreshError value),
    @required Result refreshing(_Refreshing value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(userDataLoaded != null);
    assert(userDataLoadingError != null);
    assert(listFiltered != null);
    assert(filterOptionsLoaded != null);
    assert(refreshError != null);
    assert(refreshing != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result userDataLoaded(_UserDataLoaded value),
    Result userDataLoadingError(_UserDataLoadingError value),
    Result listFiltered(_ListFiltered value),
    Result filterOptionsLoaded(_FilterOptionsLoaded value),
    Result refreshError(_RefreshError value),
    Result refreshing(_Refreshing value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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
    Object githubUserData = freezed,
  }) {
    return _then(_UserDataLoaded(
      githubUserData == freezed
          ? _value.githubUserData
          : githubUserData as GithubUserData,
    ));
  }

  @override
  $GithubUserDataCopyWith<$Res> get githubUserData {
    if (_value.githubUserData == null) {
      return null;
    }
    return $GithubUserDataCopyWith<$Res>(_value.githubUserData, (value) {
      return _then(_value.copyWith(githubUserData: value));
    });
  }
}

/// @nodoc
class _$_UserDataLoaded implements _UserDataLoaded {
  const _$_UserDataLoaded(this.githubUserData) : assert(githubUserData != null);

  @override
  final GithubUserData githubUserData;

  @override
  String toString() {
    return 'GithubState.userDataLoaded(githubUserData: $githubUserData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserDataLoaded &&
            (identical(other.githubUserData, githubUserData) ||
                const DeepCollectionEquality()
                    .equals(other.githubUserData, githubUserData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(githubUserData);

  @override
  _$UserDataLoadedCopyWith<_UserDataLoaded> get copyWith =>
      __$UserDataLoadedCopyWithImpl<_UserDataLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result userDataLoaded(GithubUserData githubUserData),
    @required Result userDataLoadingError(GithubFailure githubFailure),
    @required Result listFiltered(List<GithubRepo> listOfFilteredRepos),
    @required Result filterOptionsLoaded(Map<String, bool> filterOptions),
    @required Result refreshError(GithubFailure githubFailure),
    @required Result refreshing(),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(userDataLoaded != null);
    assert(userDataLoadingError != null);
    assert(listFiltered != null);
    assert(filterOptionsLoaded != null);
    assert(refreshError != null);
    assert(refreshing != null);
    return userDataLoaded(githubUserData);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result userDataLoaded(GithubUserData githubUserData),
    Result userDataLoadingError(GithubFailure githubFailure),
    Result listFiltered(List<GithubRepo> listOfFilteredRepos),
    Result filterOptionsLoaded(Map<String, bool> filterOptions),
    Result refreshError(GithubFailure githubFailure),
    Result refreshing(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userDataLoaded != null) {
      return userDataLoaded(githubUserData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result userDataLoaded(_UserDataLoaded value),
    @required Result userDataLoadingError(_UserDataLoadingError value),
    @required Result listFiltered(_ListFiltered value),
    @required Result filterOptionsLoaded(_FilterOptionsLoaded value),
    @required Result refreshError(_RefreshError value),
    @required Result refreshing(_Refreshing value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(userDataLoaded != null);
    assert(userDataLoadingError != null);
    assert(listFiltered != null);
    assert(filterOptionsLoaded != null);
    assert(refreshError != null);
    assert(refreshing != null);
    return userDataLoaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result userDataLoaded(_UserDataLoaded value),
    Result userDataLoadingError(_UserDataLoadingError value),
    Result listFiltered(_ListFiltered value),
    Result filterOptionsLoaded(_FilterOptionsLoaded value),
    Result refreshError(_RefreshError value),
    Result refreshing(_Refreshing value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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
  _$UserDataLoadedCopyWith<_UserDataLoaded> get copyWith;
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
    Object githubFailure = freezed,
  }) {
    return _then(_UserDataLoadingError(
      githubFailure == freezed
          ? _value.githubFailure
          : githubFailure as GithubFailure,
    ));
  }

  @override
  $GithubFailureCopyWith<$Res> get githubFailure {
    if (_value.githubFailure == null) {
      return null;
    }
    return $GithubFailureCopyWith<$Res>(_value.githubFailure, (value) {
      return _then(_value.copyWith(githubFailure: value));
    });
  }
}

/// @nodoc
class _$_UserDataLoadingError implements _UserDataLoadingError {
  const _$_UserDataLoadingError(this.githubFailure)
      : assert(githubFailure != null);

  @override
  final GithubFailure githubFailure;

  @override
  String toString() {
    return 'GithubState.userDataLoadingError(githubFailure: $githubFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserDataLoadingError &&
            (identical(other.githubFailure, githubFailure) ||
                const DeepCollectionEquality()
                    .equals(other.githubFailure, githubFailure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(githubFailure);

  @override
  _$UserDataLoadingErrorCopyWith<_UserDataLoadingError> get copyWith =>
      __$UserDataLoadingErrorCopyWithImpl<_UserDataLoadingError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result userDataLoaded(GithubUserData githubUserData),
    @required Result userDataLoadingError(GithubFailure githubFailure),
    @required Result listFiltered(List<GithubRepo> listOfFilteredRepos),
    @required Result filterOptionsLoaded(Map<String, bool> filterOptions),
    @required Result refreshError(GithubFailure githubFailure),
    @required Result refreshing(),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(userDataLoaded != null);
    assert(userDataLoadingError != null);
    assert(listFiltered != null);
    assert(filterOptionsLoaded != null);
    assert(refreshError != null);
    assert(refreshing != null);
    return userDataLoadingError(githubFailure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result userDataLoaded(GithubUserData githubUserData),
    Result userDataLoadingError(GithubFailure githubFailure),
    Result listFiltered(List<GithubRepo> listOfFilteredRepos),
    Result filterOptionsLoaded(Map<String, bool> filterOptions),
    Result refreshError(GithubFailure githubFailure),
    Result refreshing(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userDataLoadingError != null) {
      return userDataLoadingError(githubFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result userDataLoaded(_UserDataLoaded value),
    @required Result userDataLoadingError(_UserDataLoadingError value),
    @required Result listFiltered(_ListFiltered value),
    @required Result filterOptionsLoaded(_FilterOptionsLoaded value),
    @required Result refreshError(_RefreshError value),
    @required Result refreshing(_Refreshing value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(userDataLoaded != null);
    assert(userDataLoadingError != null);
    assert(listFiltered != null);
    assert(filterOptionsLoaded != null);
    assert(refreshError != null);
    assert(refreshing != null);
    return userDataLoadingError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result userDataLoaded(_UserDataLoaded value),
    Result userDataLoadingError(_UserDataLoadingError value),
    Result listFiltered(_ListFiltered value),
    Result filterOptionsLoaded(_FilterOptionsLoaded value),
    Result refreshError(_RefreshError value),
    Result refreshing(_Refreshing value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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
  _$UserDataLoadingErrorCopyWith<_UserDataLoadingError> get copyWith;
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
    Object listOfFilteredRepos = freezed,
  }) {
    return _then(_ListFiltered(
      listOfFilteredRepos == freezed
          ? _value.listOfFilteredRepos
          : listOfFilteredRepos as List<GithubRepo>,
    ));
  }
}

/// @nodoc
class _$_ListFiltered implements _ListFiltered {
  const _$_ListFiltered(this.listOfFilteredRepos)
      : assert(listOfFilteredRepos != null);

  @override
  final List<GithubRepo> listOfFilteredRepos;

  @override
  String toString() {
    return 'GithubState.listFiltered(listOfFilteredRepos: $listOfFilteredRepos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ListFiltered &&
            (identical(other.listOfFilteredRepos, listOfFilteredRepos) ||
                const DeepCollectionEquality()
                    .equals(other.listOfFilteredRepos, listOfFilteredRepos)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(listOfFilteredRepos);

  @override
  _$ListFilteredCopyWith<_ListFiltered> get copyWith =>
      __$ListFilteredCopyWithImpl<_ListFiltered>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result userDataLoaded(GithubUserData githubUserData),
    @required Result userDataLoadingError(GithubFailure githubFailure),
    @required Result listFiltered(List<GithubRepo> listOfFilteredRepos),
    @required Result filterOptionsLoaded(Map<String, bool> filterOptions),
    @required Result refreshError(GithubFailure githubFailure),
    @required Result refreshing(),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(userDataLoaded != null);
    assert(userDataLoadingError != null);
    assert(listFiltered != null);
    assert(filterOptionsLoaded != null);
    assert(refreshError != null);
    assert(refreshing != null);
    return listFiltered(listOfFilteredRepos);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result userDataLoaded(GithubUserData githubUserData),
    Result userDataLoadingError(GithubFailure githubFailure),
    Result listFiltered(List<GithubRepo> listOfFilteredRepos),
    Result filterOptionsLoaded(Map<String, bool> filterOptions),
    Result refreshError(GithubFailure githubFailure),
    Result refreshing(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (listFiltered != null) {
      return listFiltered(listOfFilteredRepos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result userDataLoaded(_UserDataLoaded value),
    @required Result userDataLoadingError(_UserDataLoadingError value),
    @required Result listFiltered(_ListFiltered value),
    @required Result filterOptionsLoaded(_FilterOptionsLoaded value),
    @required Result refreshError(_RefreshError value),
    @required Result refreshing(_Refreshing value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(userDataLoaded != null);
    assert(userDataLoadingError != null);
    assert(listFiltered != null);
    assert(filterOptionsLoaded != null);
    assert(refreshError != null);
    assert(refreshing != null);
    return listFiltered(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result userDataLoaded(_UserDataLoaded value),
    Result userDataLoadingError(_UserDataLoadingError value),
    Result listFiltered(_ListFiltered value),
    Result filterOptionsLoaded(_FilterOptionsLoaded value),
    Result refreshError(_RefreshError value),
    Result refreshing(_Refreshing value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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
  _$ListFilteredCopyWith<_ListFiltered> get copyWith;
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
    Object filterOptions = freezed,
  }) {
    return _then(_FilterOptionsLoaded(
      filterOptions == freezed
          ? _value.filterOptions
          : filterOptions as Map<String, bool>,
    ));
  }
}

/// @nodoc
class _$_FilterOptionsLoaded implements _FilterOptionsLoaded {
  const _$_FilterOptionsLoaded(this.filterOptions)
      : assert(filterOptions != null);

  @override
  final Map<String, bool> filterOptions;

  @override
  String toString() {
    return 'GithubState.filterOptionsLoaded(filterOptions: $filterOptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FilterOptionsLoaded &&
            (identical(other.filterOptions, filterOptions) ||
                const DeepCollectionEquality()
                    .equals(other.filterOptions, filterOptions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(filterOptions);

  @override
  _$FilterOptionsLoadedCopyWith<_FilterOptionsLoaded> get copyWith =>
      __$FilterOptionsLoadedCopyWithImpl<_FilterOptionsLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result userDataLoaded(GithubUserData githubUserData),
    @required Result userDataLoadingError(GithubFailure githubFailure),
    @required Result listFiltered(List<GithubRepo> listOfFilteredRepos),
    @required Result filterOptionsLoaded(Map<String, bool> filterOptions),
    @required Result refreshError(GithubFailure githubFailure),
    @required Result refreshing(),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(userDataLoaded != null);
    assert(userDataLoadingError != null);
    assert(listFiltered != null);
    assert(filterOptionsLoaded != null);
    assert(refreshError != null);
    assert(refreshing != null);
    return filterOptionsLoaded(filterOptions);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result userDataLoaded(GithubUserData githubUserData),
    Result userDataLoadingError(GithubFailure githubFailure),
    Result listFiltered(List<GithubRepo> listOfFilteredRepos),
    Result filterOptionsLoaded(Map<String, bool> filterOptions),
    Result refreshError(GithubFailure githubFailure),
    Result refreshing(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (filterOptionsLoaded != null) {
      return filterOptionsLoaded(filterOptions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result userDataLoaded(_UserDataLoaded value),
    @required Result userDataLoadingError(_UserDataLoadingError value),
    @required Result listFiltered(_ListFiltered value),
    @required Result filterOptionsLoaded(_FilterOptionsLoaded value),
    @required Result refreshError(_RefreshError value),
    @required Result refreshing(_Refreshing value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(userDataLoaded != null);
    assert(userDataLoadingError != null);
    assert(listFiltered != null);
    assert(filterOptionsLoaded != null);
    assert(refreshError != null);
    assert(refreshing != null);
    return filterOptionsLoaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result userDataLoaded(_UserDataLoaded value),
    Result userDataLoadingError(_UserDataLoadingError value),
    Result listFiltered(_ListFiltered value),
    Result filterOptionsLoaded(_FilterOptionsLoaded value),
    Result refreshError(_RefreshError value),
    Result refreshing(_Refreshing value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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
  _$FilterOptionsLoadedCopyWith<_FilterOptionsLoaded> get copyWith;
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
    Object githubFailure = freezed,
  }) {
    return _then(_RefreshError(
      githubFailure == freezed
          ? _value.githubFailure
          : githubFailure as GithubFailure,
    ));
  }

  @override
  $GithubFailureCopyWith<$Res> get githubFailure {
    if (_value.githubFailure == null) {
      return null;
    }
    return $GithubFailureCopyWith<$Res>(_value.githubFailure, (value) {
      return _then(_value.copyWith(githubFailure: value));
    });
  }
}

/// @nodoc
class _$_RefreshError implements _RefreshError {
  const _$_RefreshError(this.githubFailure) : assert(githubFailure != null);

  @override
  final GithubFailure githubFailure;

  @override
  String toString() {
    return 'GithubState.refreshError(githubFailure: $githubFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RefreshError &&
            (identical(other.githubFailure, githubFailure) ||
                const DeepCollectionEquality()
                    .equals(other.githubFailure, githubFailure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(githubFailure);

  @override
  _$RefreshErrorCopyWith<_RefreshError> get copyWith =>
      __$RefreshErrorCopyWithImpl<_RefreshError>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result userDataLoaded(GithubUserData githubUserData),
    @required Result userDataLoadingError(GithubFailure githubFailure),
    @required Result listFiltered(List<GithubRepo> listOfFilteredRepos),
    @required Result filterOptionsLoaded(Map<String, bool> filterOptions),
    @required Result refreshError(GithubFailure githubFailure),
    @required Result refreshing(),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(userDataLoaded != null);
    assert(userDataLoadingError != null);
    assert(listFiltered != null);
    assert(filterOptionsLoaded != null);
    assert(refreshError != null);
    assert(refreshing != null);
    return refreshError(githubFailure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result userDataLoaded(GithubUserData githubUserData),
    Result userDataLoadingError(GithubFailure githubFailure),
    Result listFiltered(List<GithubRepo> listOfFilteredRepos),
    Result filterOptionsLoaded(Map<String, bool> filterOptions),
    Result refreshError(GithubFailure githubFailure),
    Result refreshing(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (refreshError != null) {
      return refreshError(githubFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result userDataLoaded(_UserDataLoaded value),
    @required Result userDataLoadingError(_UserDataLoadingError value),
    @required Result listFiltered(_ListFiltered value),
    @required Result filterOptionsLoaded(_FilterOptionsLoaded value),
    @required Result refreshError(_RefreshError value),
    @required Result refreshing(_Refreshing value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(userDataLoaded != null);
    assert(userDataLoadingError != null);
    assert(listFiltered != null);
    assert(filterOptionsLoaded != null);
    assert(refreshError != null);
    assert(refreshing != null);
    return refreshError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result userDataLoaded(_UserDataLoaded value),
    Result userDataLoadingError(_UserDataLoadingError value),
    Result listFiltered(_ListFiltered value),
    Result filterOptionsLoaded(_FilterOptionsLoaded value),
    Result refreshError(_RefreshError value),
    Result refreshing(_Refreshing value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (refreshError != null) {
      return refreshError(this);
    }
    return orElse();
  }
}

abstract class _RefreshError implements GithubState {
  const factory _RefreshError(GithubFailure githubFailure) = _$_RefreshError;

  GithubFailure get githubFailure;
  _$RefreshErrorCopyWith<_RefreshError> get copyWith;
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
    return identical(this, other) || (other is _Refreshing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result userDataLoaded(GithubUserData githubUserData),
    @required Result userDataLoadingError(GithubFailure githubFailure),
    @required Result listFiltered(List<GithubRepo> listOfFilteredRepos),
    @required Result filterOptionsLoaded(Map<String, bool> filterOptions),
    @required Result refreshError(GithubFailure githubFailure),
    @required Result refreshing(),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(userDataLoaded != null);
    assert(userDataLoadingError != null);
    assert(listFiltered != null);
    assert(filterOptionsLoaded != null);
    assert(refreshError != null);
    assert(refreshing != null);
    return refreshing();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result userDataLoaded(GithubUserData githubUserData),
    Result userDataLoadingError(GithubFailure githubFailure),
    Result listFiltered(List<GithubRepo> listOfFilteredRepos),
    Result filterOptionsLoaded(Map<String, bool> filterOptions),
    Result refreshError(GithubFailure githubFailure),
    Result refreshing(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (refreshing != null) {
      return refreshing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result userDataLoaded(_UserDataLoaded value),
    @required Result userDataLoadingError(_UserDataLoadingError value),
    @required Result listFiltered(_ListFiltered value),
    @required Result filterOptionsLoaded(_FilterOptionsLoaded value),
    @required Result refreshError(_RefreshError value),
    @required Result refreshing(_Refreshing value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(userDataLoaded != null);
    assert(userDataLoadingError != null);
    assert(listFiltered != null);
    assert(filterOptionsLoaded != null);
    assert(refreshError != null);
    assert(refreshing != null);
    return refreshing(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result userDataLoaded(_UserDataLoaded value),
    Result userDataLoadingError(_UserDataLoadingError value),
    Result listFiltered(_ListFiltered value),
    Result filterOptionsLoaded(_FilterOptionsLoaded value),
    Result refreshError(_RefreshError value),
    Result refreshing(_Refreshing value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (refreshing != null) {
      return refreshing(this);
    }
    return orElse();
  }
}

abstract class _Refreshing implements GithubState {
  const factory _Refreshing() = _$_Refreshing;
}
