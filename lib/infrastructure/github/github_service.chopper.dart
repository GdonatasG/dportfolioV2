// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$GithubService extends GithubService {
  _$GithubService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = GithubService;

  @override
  Future<Response<BuiltGithubUser>> getGithubUserByName(String name) {
    final $url = '/users/$name?client_id=2683db51e60b2522b6f7';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltGithubUser, BuiltGithubUser>($request);
  }

  @override
  Future<Response<BuiltList<BuiltGithubRepo>>> getUserReposByName(String name) {
    final $url = '/users/$name/repos?client_id=2683db51e60b2522b6f7';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<BuiltGithubRepo>, BuiltGithubRepo>($request);
  }
}
