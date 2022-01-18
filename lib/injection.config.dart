// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart'
    as _i6;

import 'application/github_bloc/github_bloc.dart' as _i8;
import 'application/github_search_bloc/github_search_bloc.dart' as _i10;
import 'application/github_search_bloc/github_search_pagination.dart' as _i9;
import 'application/wrapper_bloc/wrapper_bloc.dart' as _i7;
import 'domain/github/i_github_repository.dart' as _i4;
import 'infrastructure/core/injectable_modules/streaming_shared_preferences_injectable_module.dart'
    as _i11;
import 'infrastructure/github/github_repository.dart' as _i5;
import 'infrastructure/github/github_service.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final streamingSharedPreferencesInjectableModule =
      _$StreamingSharedPreferencesInjectableModule();
  gh.factory<_i3.GithubService>(() => _i3.GithubService.create());
  gh.lazySingleton<_i4.IGithubRepository>(
      () => _i5.GithubRepository(get<_i3.GithubService>()));
  await gh.factoryAsync<_i6.StreamingSharedPreferences>(
      () => streamingSharedPreferencesInjectableModule.preferences,
      preResolve: true);
  gh.factory<_i7.WrapperBloc>(
      () => _i7.WrapperBloc(get<_i6.StreamingSharedPreferences>()));
  gh.factory<_i8.GithubBloc>(
      () => _i8.GithubBloc(get<_i4.IGithubRepository>()));
  gh.factory<_i9.GithubSearchPagination>(
      () => _i9.GithubSearchPagination(get<_i4.IGithubRepository>()));
  gh.factoryParam<_i10.GithubSearchBloc, String?, dynamic>((username, _) =>
      _i10.GithubSearchBloc(get<_i9.GithubSearchPagination>(),
          username: username));
  return get;
}

class _$StreamingSharedPreferencesInjectableModule
    extends _i11.StreamingSharedPreferencesInjectableModule {}
