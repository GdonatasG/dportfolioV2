import 'package:dartz/dartz.dart';
import 'package:dportfolio_v2/domain/github/github_repo.dart';
import 'package:dportfolio_v2/domain/github/github_search_repos.dart';
import 'package:dportfolio_v2/domain/github/github_user.dart';

import 'github_failure.dart';
import 'github_user_data.dart';

abstract class IGithubRepository {
  Future<Either<GithubFailure, GithubUser>> getUserByName({
    required String name,
  });

  Future<Either<GithubFailure, GithubSearchRepos>> searchUserRepos({
    required String name,
    required int per_page,
    required int page,
    String query = "",
    String language = "",
  });

  Future<Either<GithubFailure, GithubSearchRepos>> searchReposGlobally({
    required int per_page,
    required int page,
    String query = "",
    String language = "",
  });
}
