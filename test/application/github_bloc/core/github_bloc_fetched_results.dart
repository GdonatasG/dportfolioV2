import 'package:dportfolio_v2/domain/github/github_repo.dart';
import 'package:dportfolio_v2/domain/github/github_search_repos.dart';
import 'package:dportfolio_v2/domain/github/github_user.dart';

const fetchedUser = GithubUser(
  login: 'testUser',
  avatar_url: 'avatar_url',
  html_url: 'html_url',
);

const fetchedSearchReposThatCanLoadMore = GithubSearchRepos(
  // can paginate, because [total_count] is greater than [items.length]
  total_count: 4,
  items: [
    GithubRepo(name: 'repo1', html_url: 'html_url', language: 'language'),
    GithubRepo(name: 'repo2', html_url: 'html_url', language: 'language'),
  ],
);

const fetchedSearchReposThatCanNotLoadMore = GithubSearchRepos(
  total_count: 2,
  items: [
    GithubRepo(name: 'repo1', html_url: 'html_url', language: 'language'),
    GithubRepo(name: 'repo2', html_url: 'html_url', language: 'language'),
  ],
);

const paginatedSearchReposThatCanLoadMore = GithubSearchRepos(
  // can paginate, because [total_count] is greater than [items.length]
  total_count: 6,
  items: [
    GithubRepo(name: 'repo3', html_url: 'html_url', language: 'language'),
    GithubRepo(name: 'repo4', html_url: 'html_url', language: 'language'),
  ],
);

const paginatedSearchReposThatCanNotLoadMore = GithubSearchRepos(
  total_count: 2,
  items: [
    GithubRepo(name: 'repo3', html_url: 'html_url', language: 'language'),
    GithubRepo(name: 'repo4', html_url: 'html_url', language: 'language'),
  ],
);

final mergedSearchReposThatCanLoadMore = GithubSearchRepos(
  total_count: paginatedSearchReposThatCanLoadMore.total_count,
  items: List.from(fetchedSearchReposThatCanLoadMore.items ?? [])
    ..addAll(paginatedSearchReposThatCanLoadMore.items ?? []),
);

final mergedSearchReposThatCanNotLoadMore = GithubSearchRepos(
  total_count: paginatedSearchReposThatCanNotLoadMore.total_count,
  items: List.from(fetchedSearchReposThatCanLoadMore.items ?? [])
    ..addAll(paginatedSearchReposThatCanNotLoadMore.items ?? []),
);
