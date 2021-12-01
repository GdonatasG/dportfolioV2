import 'package:auto_route/auto_route.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';

class PortfolioItem {
  final String title;
  final String? htmlUrl;
  final String? googlePlayUrl;
  final String? appStoreUrl;
  final String? githubUrl;
  final String? about;
  final bool isAboutTranslated; // for local translations by language
  final List<String>? platformsAndTechnologies;
  final String? coverUrl;
  final List<String>? listOfImagesUrl;

  const PortfolioItem({
    required this.title,
    this.htmlUrl,
    this.googlePlayUrl,
    this.appStoreUrl,
    this.githubUrl,
    this.about,
    required this.isAboutTranslated,
    this.platformsAndTechnologies,
    this.coverUrl,
    this.listOfImagesUrl,
  });
}

final List<PortfolioItem> listOfPortfolioItems = [
  const PortfolioItem(
    title: 'Dportfolio',
    googlePlayUrl:
        'https://play.google.com/store/apps/details?id=com.app.dportfolio',
    githubUrl: 'https://github.com/GdonatasG/dportfolioV2',
    about: LocaleKeys.DPORTFOLIO_ABOUT,
    isAboutTranslated: true,
    platformsAndTechnologies: [
      "Flutter",
      "Dependency Injection",
      "Flutter Bloc",
      "Dart",
      "Mobile",
      "Android",
      /*"iOS"*/
    ],
    coverUrl: 'assets/images/portfolio/dportfolio/dportfolio_cover.png',
    listOfImagesUrl: [
      "assets/images/portfolio/dportfolio/dportfolio1.png",
      "assets/images/portfolio/dportfolio/dportfolio2.png",
      "assets/images/portfolio/dportfolio/dportfolio3.png",
      "assets/images/portfolio/dportfolio/dportfolio4.png",
      "assets/images/portfolio/dportfolio/dportfolio5.png",
      "assets/images/portfolio/dportfolio/dportfolio_cover.png",
    ],
  ),
];
