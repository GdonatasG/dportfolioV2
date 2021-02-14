import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:dportfolio_v2/hidden.dart';
import 'package:dportfolio_v2/infrastructure/core/converters/built_value_converter.dart';
import 'package:http/io_client.dart' as http;
import 'package:built_collection/built_collection.dart';
import 'package:injectable/injectable.dart';

import 'built_github_repo.dart';
import 'built_github_user.dart';

part 'github_service.chopper.dart';

@injectable
@ChopperApi(baseUrl: "/users")
abstract class GithubService extends ChopperService {
  @Get(path: "/{name}?client_id=${Hidden.GITHUB_CLIENT_ID}")
  Future<Response<BuiltGithubUser>> getGithubUserByName(
      @Path("name") String name);

  @Get(path: "/{name}/repos?client_id=${Hidden.GITHUB_CLIENT_ID}")
  Future<Response<BuiltList<BuiltGithubRepo>>> getUserReposByName(
      @Path("name") String name);

  @factoryMethod
  static GithubService create() {
    final client = ChopperClient(
      client: http.IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 15),
      ),
      baseUrl: 'https://api.github.com',
      services: [
        _$GithubService(),
      ],
      converter: BuiltValueConverter(),
      interceptors: [],
    );
    return _$GithubService(client);
  }
}
