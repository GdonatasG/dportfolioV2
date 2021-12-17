import 'package:dartz/dartz.dart';
import 'package:dportfolio_v2/domain/github/github_failure.dart';
import 'package:dportfolio_v2/domain/github/github_search_repos.dart';
import 'package:dportfolio_v2/domain/github/github_user.dart';
import 'package:dportfolio_v2/domain/github/i_github_repository.dart';
import 'package:dportfolio_v2/infrastructure/github/github_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IGithubRepository)
class GithubRepository implements IGithubRepository {
  final GithubService _githubService;

  GithubRepository(this._githubService);

  @override
  Future<Either<GithubFailure, GithubUser>> getUserByName({
    required String name,
  }) async {
    try {
      final response = await _githubService.getGithubUserByName(name);
      if (response.isSuccessful && response.body != null) {
        return right(response.body!.toDomain());
      } else {
        throw Error();
      }
    } catch (e) {
      return left(const GithubFailure.userLoadingFailure());
    }
  }

  @override
  Future<Either<GithubFailure, GithubSearchRepos>> searchUserRepos({
    required String name,
    required int per_page,
    required int page,
    String query = "",
    String language = "",
  }) async {
    try {
      final response = await _githubService.searchUserRepos(
        user: name,
        per_page: per_page,
        page: page,
        query: query,
        language: language,
      );

      if (response.isSuccessful && response.body != null) {
        return right(response.body!.toDomain());
      } else {
        throw Error();
      }
    } catch (e) {
      return left(const GithubFailure.reposLoadingFailure());
    }
  }

  @override
  Future<Either<GithubFailure, GithubSearchRepos>> searchReposGlobally({
    required int per_page,
    required int page,
    String query = "",
    String language = "",
  }) async {
    try {
      final response = await _githubService.searchReposGlobally(
        per_page: per_page,
        page: page,
        query: query,
        language: language,
      );

      if (response.isSuccessful && response.body != null) {
        return right(response.body!.toDomain());
      } else {
        throw Error();
      }
    } catch (e) {
      return left(const GithubFailure.reposLoadingFailure());
    }
  }
}
