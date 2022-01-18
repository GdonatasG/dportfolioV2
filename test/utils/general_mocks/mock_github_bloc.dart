import 'package:bloc_test/bloc_test.dart';
import 'package:dportfolio_v2/application/github_bloc/github_bloc.dart';

class MockGithubBloc extends MockBloc<GithubEvent, GithubState>
    implements GithubBloc {}
