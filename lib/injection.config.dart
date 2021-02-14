// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'presentation/afterTutorial/misc/current_bottom_bar_page.dart';
import 'application/github_bloc/github_bloc.dart';
import 'infrastructure/github/github_repository.dart';
import 'infrastructure/github/github_service.dart';
import 'domain/github/i_github_repository.dart';
import 'application/wrapper_bloc/wrapper_bloc.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<CurrentBottomBarPage>(() => CurrentBottomBarPage());
  gh.factory<GithubService>(() => GithubService.create());
  gh.lazySingleton<IGithubRepository>(
      () => GithubRepository(get<GithubService>()));
  gh.factory<WrapperBloc>(() => WrapperBloc());
  gh.factory<GithubBloc>(() => GithubBloc(get<IGithubRepository>()));
  return get;
}
