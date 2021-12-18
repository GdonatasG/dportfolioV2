// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$GithubService extends GithubService {
  _$GithubService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = GithubService;

  @override
  Future<Response<GithubUserDTO>> getGithubUserByName(
      String token, String name) {
    final $url = 'https://api.github.com/users/${name}';
    final $headers = {
      'Authorization': token,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<GithubUserDTO, GithubUserDTO>($request);
  }

  @override
  Future<Response<GithubSearchReposDTO>> searchUserRepos(
      {required String token,
      String query = "",
      required String user,
      String language = "",
      required int per_page,
      int page = 1}) {
    final $url =
        'https://api.github.com/search/repositories?q=${query}+user:${user}+language:${language}&per_page=${per_page}&page=${page}';
    final $headers = {
      'Authorization': token,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<GithubSearchReposDTO, GithubSearchReposDTO>($request);
  }

  @override
  Future<Response<GithubSearchReposDTO>> searchReposGlobally(
      {required String token,
      String query = "",
      String language = "",
      required int per_page,
      int page = 1}) {
    final $url =
        'https://api.github.com/search/repositories?q=${query}+language:${language}&per_page=${per_page}&page=${page}';
    final $headers = {
      'Authorization': token,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<GithubSearchReposDTO, GithubSearchReposDTO>($request);
  }
}
