import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dportfolio_v2/domain/github/github_failure.dart';
import 'package:dportfolio_v2/domain/github/github_repo.dart';
import 'package:dportfolio_v2/domain/github/github_user_data.dart';
import 'package:dportfolio_v2/domain/github/i_github_repository.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/core/github_filter_locale_keys.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:preferences/preferences.dart';

part 'github_event.dart';

part 'github_state.dart';

part 'github_bloc.freezed.dart';

@injectable
class GithubBloc extends Bloc<GithubEvent, GithubState> {
  final IGithubRepository _iGithubRepository;

  GithubUserData githubUserData;

  List<GithubRepo> filteredRepoList;

  final String PREF_GITHUB_FILTER = 'github_filter';
  final String PREF_GITHUB_IS_FILTERED = 'github_is_filtered';
  Map<String, bool> defaultFilterOptions = {
    GithubFilterLocaleKeys.FILTER_OPTION_ALL: true,
    'Java': false,
    'Kotlin': false,
    'Dart': false,
    'Python': false,
    'Javascript': false,
    'HTML': false,
  };

  GithubBloc(this._iGithubRepository) : super(const GithubState.initial());

  @override
  Stream<GithubState> mapEventToState(
    GithubEvent event,
  ) async* {
    yield* event.map(
        getUserDataByName: (e) =>
            _getUserDataByNameEvent(e.name, isRefresh: e.isRefresh),
        filterList: (e) => _filterListEvent(e.filterOptions),
        filterCheckRequest: (e) => _filterCheckRequest(),
        loadFilterOptions: (e) async* {
          yield GithubState.filterOptionsLoaded(_loadFilterOptions());
        });
  }

  Stream<GithubState> _getUserDataByNameEvent(String name,
      {bool isRefresh = false}) async* {
    if (isRefresh) {
      yield const GithubState.refreshing();
    } else {
      yield const GithubState.loading();
    }
    final failureOrUserData = await _iGithubRepository.getUserDataByName(name);
    yield failureOrUserData.fold(
      (l) {
        return !isRefresh
            ? GithubState.userDataLoadingError(l)
            : GithubState.refreshError(l);
      },
      (r) {
        githubUserData = r;
        add(const GithubEvent.filterCheckRequest());
        return GithubState.userDataLoaded(githubUserData);
      },
    );
  }

  Stream<GithubState> _filterCheckRequest() async* {
    final bool prefValue = PrefService.getBool(PREF_GITHUB_IS_FILTERED);
    final isFiltered = prefValue ?? false;
    if (isFiltered) {
      final filterOptions = _loadFilterOptions();
      filteredRepoList = _filter(filterOptions);
      yield GithubState.listFiltered(filteredRepoList);
    } else {
      yield GithubState.listFiltered(githubUserData.repos);
    }
  }

  Stream<GithubState> _filterListEvent(Map<String, bool> filterOptions) async* {
    // 'All' option is selected, yielding original (full) list
    if (filterOptions.keys.elementAt(0) ==
            GithubFilterLocaleKeys.FILTER_OPTION_ALL &&
        filterOptions[filterOptions.keys.elementAt(0)]) {
      PrefService.setBool(PREF_GITHUB_IS_FILTERED, false);
      yield GithubState.listFiltered(githubUserData.repos);
    } else {
      PrefService.setBool(PREF_GITHUB_IS_FILTERED, true);
      filteredRepoList = _filter(filterOptions);
      yield GithubState.listFiltered(filteredRepoList);
    }
    _saveFilterToSharedPref(filterOptions);
  }

  List<GithubRepo> _filter(Map<String, bool> filterOptions) =>
      List.from(githubUserData.repos.where((element) {
        for (int i = 0; i < filterOptions.length; i++) {
          // Value is selected (== true) and repo language is
          // the same as the key from filter options Map
          if (filterOptions.values.elementAt(i) &&
              element.language == filterOptions.keys.elementAt(i)) return true;
        }
        return false;
      }));

  Map<String, bool> _loadFilterOptions() {
    final filterOptionsPref = PrefService.getString(PREF_GITHUB_FILTER);
    final Map<String, bool> filterOptions = filterOptionsPref == null
        ? defaultFilterOptions
        : Map<String, bool>.from(json.decode(filterOptionsPref));
    return filterOptions;
  }

  _saveFilterToSharedPref(Map<String, bool> filterOptions) {
    final filterOptionsJson = json.encode(filterOptions);
    PrefService.setString(PREF_GITHUB_FILTER, filterOptionsJson);
  }
}
