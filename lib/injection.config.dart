// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart'
    as _i7;

import 'application/github_bloc/github_bloc.dart' as _i9;
import 'application/github_search_bloc/github_search_bloc.dart' as _i10;
import 'application/wrapper_bloc/wrapper_bloc.dart' as _i8;
import 'domain/github/i_github_repository.dart' as _i5;
import 'infrastructure/core/injectable_modules/streaming_shared_preferences_injectable_module.dart'
    as _i11;
import 'infrastructure/github/github_repository.dart' as _i6;
import 'infrastructure/github/github_service.dart' as _i4;
import 'presentation/afterTutorial/misc/current_bottom_bar_page.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final streamingSharedPreferencesInjectableModule =
      _$StreamingSharedPreferencesInjectableModule();
  gh.factory<_i3.CurrentBottomBarPage>(() => _i3.CurrentBottomBarPage());
  gh.factory<_i4.GithubService>(() => _i4.GithubService.create());
  gh.lazySingleton<_i5.IGithubRepository>(
      () => _i6.GithubRepository(get<_i4.GithubService>()));
  await gh.factoryAsync<_i7.StreamingSharedPreferences>(
      () => streamingSharedPreferencesInjectableModule.preferences,
      preResolve: true);
  gh.factory<_i8.WrapperBloc>(
      () => _i8.WrapperBloc(get<_i7.StreamingSharedPreferences>()));
  gh.factory<_i9.GithubBloc>(
      () => _i9.GithubBloc(get<_i5.IGithubRepository>()));
  gh.factoryParam<_i10.GithubSearchBloc, String?, dynamic>((username, _) =>
      _i10.GithubSearchBloc(get<_i5.IGithubRepository>(), username: username));
  return get;
}

class _$StreamingSharedPreferencesInjectableModule
    extends _i11.StreamingSharedPreferencesInjectableModule {}
