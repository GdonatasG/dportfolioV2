import 'package:dartz/dartz.dart';
import 'package:dportfolio_v2/domain/github/github_failure.dart';
import 'package:dportfolio_v2/domain/github/github_repo.dart';
import 'package:dportfolio_v2/domain/github/github_user.dart';
import 'package:dportfolio_v2/domain/github/github_user_data.dart';
import 'package:dportfolio_v2/domain/github/i_github_repository.dart';
import 'package:dportfolio_v2/infrastructure/github/github_service.dart';
import 'package:dportfolio_v2/infrastructure/github/github_user_dto.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IGithubRepository)
class GithubRepository implements IGithubRepository {
  final GithubService _githubService;

  GithubRepository(this._githubService);

  @override
  Future<Either<GithubFailure, GithubUser>> getUserByName(String name) async {
    try {
      final response = await _githubService.getGithubUserByName(name);
      if (response.body != null) {
        return right(response.body!.toDomain());
      } else {
        throw Error();
      }
    } catch (e) {
      return left(const GithubFailure.userLoadingFailure());
    }
  }

  @override
  Future<Either<GithubFailure, List<GithubRepo>>> getUserReposByName(
    String name,
  ) async {
    try {
      final response = await _githubService.getUserReposByName(name);
      if (response.body != null) {
        return right(response.body!.map((repo) => repo.toDomain()).toList());
      } else {
        throw Error();
      }
    } catch (e) {
      return left(const GithubFailure.reposLoadingFailure());
    }
  }

  @override
  Future<Either<GithubFailure, GithubUserData>> getUserDataByName(
    String name,
  ) async {
    try {
      GithubUser user;
      List<GithubRepo> listOfRepos;
      final userResponse = await _githubService.getGithubUserByName(name);
      if (userResponse.body != null) {
        user = userResponse.body!.toDomain();
      } else {
        throw Error();
      }

      if (user.login != null) {
        final reposResponse =
            await _githubService.getUserReposByName(user.login!);
        if (reposResponse.body != null) {
          listOfRepos =
              reposResponse.body!.map((repo) => repo.toDomain()).toList();

          final GithubUserData githubUserData =
              GithubUserData(user: user, repos: listOfRepos);

          return right(githubUserData);
        } else {
          throw Error();
        }
      } else {
        throw Error();
      }
    } catch (e) {
      print(e.toString());
      return left(const GithubFailure.userDataLoadingFailure());
    }
  }
}
