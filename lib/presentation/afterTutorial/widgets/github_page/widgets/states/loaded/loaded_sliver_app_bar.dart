import 'package:auto_route/auto_route.dart';
import 'package:dportfolio_v2/application/github_bloc/github_bloc.dart';
import 'package:dportfolio_v2/domain/github/github_user.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/github_page.dart';
import 'package:dportfolio_v2/presentation/core/extensions/app_data_extensions.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:dportfolio_v2/presentation/core/widgets/custom_webview.dart';
import 'package:dportfolio_v2/presentation/core/widgets/sabt.dart';
import 'package:dportfolio_v2/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import 'core/github_filter_locale_keys.dart';

class LoadedSliverAppBar extends StatefulWidget {
  final GithubUser githubUser;

  const LoadedSliverAppBar({
    Key? key,
    required this.githubUser,
  }) : super(key: key);

  @override
  _LoadedSliverAppBarState createState() => _LoadedSliverAppBarState();
}

class _LoadedSliverAppBarState extends State<LoadedSliverAppBar> {
  Map<String, bool>? editableFilterOptions;

  @override
  void initState() {
    BlocProvider.of<GithubBloc>(context)
        .add(const GithubEvent.loadFilterOptions());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GithubBloc, GithubState>(
      listener: (context, state) {
        state.maybeMap(
          filterOptionsLoaded: (s) {
            editableFilterOptions = Map.from(s.filterOptions);
          },
          orElse: () {},
        );
      },
      child: SliverAppBar(
        automaticallyImplyLeading: false,
        expandedHeight: GITHUB_PAGE_APP_BAR_HEIGHT,
        centerTitle: true,
        pinned: true,
        forceElevated: true,
        title: const SABT(
          child: Text(
            'Github',
          ),
        ),
        actions: [
          IconButton(
              icon: IconTheme(
                data: Theme.of(context).iconTheme,
                child: const Icon(FontAwesome5.filter),
              ),
              onPressed: () {
                _openFilterDialog();
              })
        ],
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60.0,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                backgroundImage:
                    NetworkImage(widget.githubUser.avatar_url ?? ''),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                widget.githubUser.login ?? '',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontFamily: "ComicSansMs",
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  context.router.push(
                    CustomWebViewRoute(url: widget.githubUser.html_url ?? ''),
                  );
                },
                child: Text(
                  context.getString(LocaleKeys.VISIT_PROFILE) ?? '',
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future? _openFilterDialog() {
    return editableFilterOptions != null
        ? showDialog(
            context: context,
            builder: (_) => StatefulBuilder(
              builder: (ctx, setState) => AlertDialog(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                title: Text(
                  context.getString(GithubFilterLocaleKeys.FILTER_TITLE) ?? '',
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: editableFilterOptions!.keys.map((String key) {
                      return CheckboxListTile(
                        activeColor: Theme.of(context).colorScheme.secondary,
                        title: Text(
                          key == GithubFilterLocaleKeys.FILTER_OPTION_ALL
                              ? context.getString(
                                    GithubFilterLocaleKeys.FILTER_OPTION_ALL,
                                  ) ??
                                  ''
                              : key,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        value: editableFilterOptions![key],
                        onChanged: (bool? value) {
                          if (value != null) {
                            setState(() {
                              _configureOptions(key, value);
                            });
                          }
                        },
                      );
                    }).toList(),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<GithubBloc>(context)
                          .add(GithubEvent.filterList(editableFilterOptions!));
                      // close dialog
                      context.router.pop();
                    },
                    child: Text(
                      context.getString(
                              GithubFilterLocaleKeys.FILTER_BUTTON_FILTER) ??
                          '',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      context.getString(
                              GithubFilterLocaleKeys.FILTER_BUTTON_CANCEL) ??
                          '',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        editableFilterOptions = Map<String, bool>.from(
                          BlocProvider.of<GithubBloc>(context)
                              .defaultFilterOptions,
                        );
                      });
                      BlocProvider.of<GithubBloc>(context)
                          .add(GithubEvent.filterList(editableFilterOptions!));
                      // close dialog
                      context.router.pop();
                    },
                    child: Text(
                      context.getString(
                            GithubFilterLocaleKeys.FILTER_BUTTON_RESET,
                          ) ??
                          '',
                    ),
                  ),
                ],
              ),
            ),
          )
        : null;
  }

  // ignore: always_declare_return_types
  _configureOptions(String key, bool value) {
    // action with the first option (All)
    if (key == editableFilterOptions!.keys.elementAt(0) && _anySelected()) {
      // User tries to check 'All' option when some other options are selected
      _unselectAll();
      editableFilterOptions![key] = value; // selecting 'All' option
    }
    // action with other options
    else {
      editableFilterOptions![key] = value;
      // If any option has been selected - uncheck 'All' option
      // if no options has been selected - check 'All' option
      editableFilterOptions![editableFilterOptions!.keys.elementAt(0)] =
          !_anySelected();
    }
  }

  bool _anySelected() => editableFilterOptions!.entries
      .where(
        (element) =>
            element.key != editableFilterOptions!.keys.elementAt(0) &&
            element.value,
      )
      .isNotEmpty;

  // ignore: always_declare_return_types
  _unselectAll() {
    editableFilterOptions!.forEach((key, value) {
      editableFilterOptions![key] = false;
    });
  }
}
