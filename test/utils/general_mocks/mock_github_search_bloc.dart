import 'package:bloc_test/bloc_test.dart';
import 'package:dportfolio_v2/application/github_search_bloc/github_search_bloc.dart';
import 'package:dportfolio_v2/application/github_search_bloc/github_search_filter_options.dart';

class MockGithubSearchBloc
    extends MockBloc<GithubSearchEvent, GithubSearchState>
    implements GithubSearchBloc {
  @override
  List<String> get getFilterOptions => List.unmodifiable(defaultFilterOptions);
}
