import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:dportfolio_v2/infrastructure/core/converters/json_to_type_converter.dart';
import 'package:dportfolio_v2/infrastructure/github/github_repo_dto.dart';
import 'package:dportfolio_v2/infrastructure/github/github_search_repos_dto.dart';
import 'package:dportfolio_v2/infrastructure/github/github_user_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as httpIO;
import 'package:injectable/injectable.dart';

part 'github_service.chopper.dart';

@injectable
@ChopperApi(baseUrl: "https://api.github.com")
abstract class GithubService extends ChopperService {
  static final _converter = JsonToTypeConverter(
    {
      GithubUserDTO: (jsonData) => GithubUserDTO.fromJson(jsonData),
      GithubRepoDTO: (jsonData) => GithubRepoDTO.fromJson(jsonData),
      GithubSearchReposDTO: (jsonData) =>
          GithubSearchReposDTO.fromJson(jsonData),
    },
  );
  static final _interceptors = [
    HttpLoggingInterceptor(),
  ];

  @Get(
    path: "/users/{name}",
  )
  Future<Response<GithubUserDTO>> getGithubUserByName(
    @Header("Authorization") String token,
    @Path("name") String name,
  );

  @Get(
    path: "/search/repositories?q={query}+user:{user}+language:"
        "{language}&per_page={per_page}&page={page}",
  )
  Future<Response<GithubSearchReposDTO>> searchUserRepos({
    @Header("Authorization") required String token,
    @Path("query") String query = "",
    @Path("user") required String user,
    @Path("language") String language = "",
    @Path("per_page") required int per_page,
    @Path("page") int page = 1,
  });

  @Get(
    path: "/search/repositories?q={query}+language:"
        "{language}&per_page={per_page}&page={page}",
  )
  Future<Response<GithubSearchReposDTO>> searchReposGlobally({
    @Header("Authorization") required String token,
    @Path("query") String query = "",
    @Path("language") String language = "",
    @Path("per_page") required int per_page,
    @Path("page") int page = 1,
  });

  @factoryMethod
  static GithubService create() {
    final client = ChopperClient(
      client: httpIO.IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 15),
      ),
      services: [
        _$GithubService(),
      ],
      converter: _converter,
      interceptors: _interceptors,
    );
    return _$GithubService(client);
  }

  @visibleForTesting
  static GithubService createForTesting(http.Client mockClient) {
    final client = ChopperClient(
      client: mockClient,
      services: [
        _$GithubService(),
      ],
      converter: _converter,
      interceptors: _interceptors,
    );
    return _$GithubService(client);
  }
}
