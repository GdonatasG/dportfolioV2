import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:dportfolio_v2/hidden.dart';
import 'package:dportfolio_v2/infrastructure/core/converters/json_to_type_converter.dart';
import 'package:dportfolio_v2/infrastructure/github/github_repo_dto.dart';
import 'package:dportfolio_v2/infrastructure/github/github_user_dto.dart';
import 'package:http/io_client.dart' as http;
import 'package:injectable/injectable.dart';

part 'github_service.chopper.dart';

@injectable
@ChopperApi(baseUrl: "/users")
abstract class GithubService extends ChopperService {
  @Get(path: "/{name}?client_id=${Hidden.GITHUB_CLIENT_ID}")
  Future<Response<GithubUserDTO>> getGithubUserByName(
    @Path("name") String name,
  );

  @Get(path: "/{name}/repos?client_id=${Hidden.GITHUB_CLIENT_ID}")
  Future<Response<List<GithubRepoDTO>>> getUserReposByName(
    @Path("name") String name,
  );

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
      converter: JsonToTypeConverter(
        {
          GithubUserDTO: (jsonData) => GithubUserDTO.fromJson(jsonData),
          GithubRepoDTO: (jsonData) => GithubRepoDTO.fromJson(jsonData),
        },
      ),
      interceptors: [],
    );
    return _$GithubService(client);
  }
}
