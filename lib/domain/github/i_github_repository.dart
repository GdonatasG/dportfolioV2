import 'package:dartz/dartz.dart';
import 'package:dportfolio_v2/domain/github/github_repo.dart';
import 'package:dportfolio_v2/domain/github/github_user.dart';

import 'github_failure.dart';
import 'github_user_data.dart';

abstract class IGithubRepository {
  Future<Either<GithubFailure, GithubUser>> getUserByName(String name);

  Future<Either<GithubFailure, List<GithubRepo>>> getUserReposByName(
      String name);

  Future<Either<GithubFailure, GithubUserData>> getUserDataByName(String name);
}
