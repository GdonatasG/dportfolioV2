import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dportfolio_v2/domain/github/github_failure.dart';
import 'package:dportfolio_v2/domain/github/github_repo.dart';
import 'package:dportfolio_v2/domain/github/github_user_data.dart';
import 'package:dportfolio_v2/domain/github/i_github_repository.dart';
import 'package:dportfolio_v2/injection.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/core/github_filter_locale_keys.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

part 'github_event.dart';

part 'github_state.dart';

part 'github_bloc.freezed.dart';

@injectable
class GithubBloc extends Bloc<GithubEvent, GithubState> {
  final IGithubRepository _iGithubRepository;

  GithubUserData? githubUserData;

  List<GithubRepo> filteredRepoList = [];

  final String PREF_GITHUB_FILTER = 'github_filter';
  final String PREF_GITHUB_IS_FILTERED = 'github_is_filtered';
  Map<String, bool> defaultFilterOptions = {
    GithubFilterLocaleKeys.FILTER_OPTION_ALL: true,
    "Java": false,
    "Kotlin": false,
    "Dart": false,
    "Python": false,
    "Javascript": false,
    "HTML": false,
  };

  GithubBloc(this._iGithubRepository) : super(const GithubState.initial()) {
    on<GithubEvent>((event, emit) async {
      await event.map(
        getUserDataByName: (e) async => _getUserDataByNameEvent(
          e.name,
          isRefresh: e.isRefresh,
          emit: emit,
        ),
        filterList: (e) async => _filterListEvent(e.filterOptions, emit: emit),
        filterCheckRequest: (e) async => _filterCheckRequest(emit: emit),
        loadFilterOptions: (e) async {
          try {
            final filterOptions = _loadFilterOptions();
            emit(GithubState.filterOptionsLoaded(filterOptions));
          } catch (e) {
            log(e.toString());
          }
        },
      );
    });
  }

  void _getUserDataByNameEvent(
    String name, {
    bool isRefresh = false,
    required Emitter<GithubState> emit,
  }) async {
    if (isRefresh) {
      emit(const GithubState.refreshing());
    } else {
      emit(const GithubState.loading());
    }
    final failureOrUserData = await _iGithubRepository.getUserDataByName(name);
    final GithubState finalState = failureOrUserData.fold(
      (l) {
        return !isRefresh
            ? GithubState.userDataLoadingError(l)
            : GithubState.refreshError(l);
      },
      (r) {
        githubUserData = r;
        add(const GithubEvent.filterCheckRequest());
        return GithubState.userDataLoaded(githubUserData!);
      },
    );
    emit(finalState);
  }

  void _filterCheckRequest({
    required Emitter<GithubState> emit,
  }) {
    final bool isFiltered = getIt<StreamingSharedPreferences>()
        .getBool(PREF_GITHUB_IS_FILTERED, defaultValue: false)
        .getValue();
    if (isFiltered) {
      final filterOptions = _loadFilterOptions();
      filteredRepoList = _filter(filterOptions);
      emit(GithubState.listFiltered(filteredRepoList));
    } else {
      emit(
        GithubState.listFiltered(
          githubUserData?.repos ?? [],
        ),
      );
    }
  }

  void _filterListEvent(
    Map<String, bool> filterOptions, {
    required Emitter<GithubState> emit,
  }) async {
    await _saveFilterToSharedPref(filterOptions);

    // 'All' option is selected, emitting original (full) list
    if (filterOptions.keys.elementAt(0) ==
            GithubFilterLocaleKeys.FILTER_OPTION_ALL &&
        (filterOptions[filterOptions.keys.elementAt(0)] ?? false)) {
      await getIt<StreamingSharedPreferences>()
          .setBool(PREF_GITHUB_IS_FILTERED, false);
      emit(GithubState.listFiltered(githubUserData?.repos ?? []));
    } else {
      await getIt<StreamingSharedPreferences>()
          .setBool(PREF_GITHUB_IS_FILTERED, true);
      filteredRepoList = _filter(filterOptions);
      emit(GithubState.listFiltered(filteredRepoList));
    }
  }

  List<GithubRepo> _filter(Map<String, bool> filterOptions) =>
      githubUserData?.repos != null
          ? List.from(
              githubUserData!.repos.where((element) {
                for (int i = 0; i < filterOptions.length; i++) {
                  // Value is selected (== true) and repo language is
                  // the same as the key from filter options Map
                  if (filterOptions.values.elementAt(i) &&
                      element.language == filterOptions.keys.elementAt(i)) {
                    return true;
                  }
                }
                return false;
              }),
            )
          : [];

  Map<String, bool> _loadFilterOptions() {
    final filterOptionsPref = getIt<StreamingSharedPreferences>()
        .getString(
          PREF_GITHUB_FILTER,
          defaultValue: json.encode(defaultFilterOptions),
        )
        .getValue();
    final Map<String, bool> filterOptions = Map<String, bool>.from(
      json.decode(filterOptionsPref),
    );
    return filterOptions;
  }

  Future<void> _saveFilterToSharedPref(Map<String, bool> filterOptions) async {
    final filterOptionsJson = json.encode(filterOptions);
    await getIt<StreamingSharedPreferences>()
        .setString(PREF_GITHUB_FILTER, filterOptionsJson);
  }
}
