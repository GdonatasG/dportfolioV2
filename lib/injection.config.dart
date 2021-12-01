// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/github_bloc/github_bloc.dart' as _i8;
import 'application/wrapper_bloc/wrapper_bloc.dart' as _i7;
import 'domain/github/i_github_repository.dart' as _i5;
import 'infrastructure/github/github_repository.dart' as _i6;
import 'infrastructure/github/github_service.dart' as _i4;
import 'presentation/afterTutorial/misc/current_bottom_bar_page.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.CurrentBottomBarPage>(() => _i3.CurrentBottomBarPage());
  gh.factory<_i4.GithubService>(() => _i4.GithubService.create());
  gh.lazySingleton<_i5.IGithubRepository>(
      () => _i6.GithubRepository(get<_i4.GithubService>()));
  gh.factory<_i7.WrapperBloc>(() => _i7.WrapperBloc());
  gh.factory<_i8.GithubBloc>(
      () => _i8.GithubBloc(get<_i5.IGithubRepository>()));
  return get;
}
