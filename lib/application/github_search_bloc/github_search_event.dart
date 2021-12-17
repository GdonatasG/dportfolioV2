part of 'github_search_bloc.dart';

@freezed
abstract class GithubSearchEvent with _$GithubSearchEvent {
  const factory GithubSearchEvent.searchTypeChanged({
    required bool isGlobal,
  }) = SearchTypeChanged;

  const factory GithubSearchEvent.queryChanged({
    required String query,
  }) = QueryChanged;

  const factory GithubSearchEvent.languageChanged({
    required int index,
  }) = LanguageChanged;

  const factory GithubSearchEvent.retrySearch() = RetrySearch;

  const factory GithubSearchEvent.paginate() = Paginate;
}
