// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    EnterCoinsRoute.name: (routeData) {
      final args = routeData.argsAs<EnterCoinsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EnterCoinsScreen(
          key: args.key,
          plane: args.plane,
        ),
      );
    },
    FlappingPlaneGameRoute.name: (routeData) {
      final args = routeData.argsAs<FlappingPlaneGameRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FlappingPlaneGameScreen(
          key: args.key,
          plane: args.plane,
          coins: args.coins,
        ),
      );
    },
    FlappingPlaneListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FlappingPlaneListScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    NewsInfoRoute.name: (routeData) {
      final args = routeData.argsAs<NewsInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewsInfoScreen(
          key: args.key,
          news: args.news,
        ),
      );
    },
    NewsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsListScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    PuzzleGameRoute.name: (routeData) {
      final args = routeData.argsAs<PuzzleGameRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PuzzleGameScreen(
          key: args.key,
          puzzle: args.puzzle,
        ),
      );
    },
    PuzzleListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PuzzleListScreen(),
      );
    },
    ResultRoute.name: (routeData) {
      final args = routeData.argsAs<ResultRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResultScreen(
          key: args.key,
          result: args.result,
          coins: args.coins,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
  };
}

/// generated route for
/// [EnterCoinsScreen]
class EnterCoinsRoute extends PageRouteInfo<EnterCoinsRouteArgs> {
  EnterCoinsRoute({
    Key? key,
    required PlaneModel plane,
    List<PageRouteInfo>? children,
  }) : super(
          EnterCoinsRoute.name,
          args: EnterCoinsRouteArgs(
            key: key,
            plane: plane,
          ),
          initialChildren: children,
        );

  static const String name = 'EnterCoinsRoute';

  static const PageInfo<EnterCoinsRouteArgs> page =
      PageInfo<EnterCoinsRouteArgs>(name);
}

class EnterCoinsRouteArgs {
  const EnterCoinsRouteArgs({
    this.key,
    required this.plane,
  });

  final Key? key;

  final PlaneModel plane;

  @override
  String toString() {
    return 'EnterCoinsRouteArgs{key: $key, plane: $plane}';
  }
}

/// generated route for
/// [FlappingPlaneGameScreen]
class FlappingPlaneGameRoute extends PageRouteInfo<FlappingPlaneGameRouteArgs> {
  FlappingPlaneGameRoute({
    Key? key,
    required PlaneModel plane,
    required int coins,
    List<PageRouteInfo>? children,
  }) : super(
          FlappingPlaneGameRoute.name,
          args: FlappingPlaneGameRouteArgs(
            key: key,
            plane: plane,
            coins: coins,
          ),
          initialChildren: children,
        );

  static const String name = 'FlappingPlaneGameRoute';

  static const PageInfo<FlappingPlaneGameRouteArgs> page =
      PageInfo<FlappingPlaneGameRouteArgs>(name);
}

class FlappingPlaneGameRouteArgs {
  const FlappingPlaneGameRouteArgs({
    this.key,
    required this.plane,
    required this.coins,
  });

  final Key? key;

  final PlaneModel plane;

  final int coins;

  @override
  String toString() {
    return 'FlappingPlaneGameRouteArgs{key: $key, plane: $plane, coins: $coins}';
  }
}

/// generated route for
/// [FlappingPlaneListScreen]
class FlappingPlaneListRoute extends PageRouteInfo<void> {
  const FlappingPlaneListRoute({List<PageRouteInfo>? children})
      : super(
          FlappingPlaneListRoute.name,
          initialChildren: children,
        );

  static const String name = 'FlappingPlaneListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsInfoScreen]
class NewsInfoRoute extends PageRouteInfo<NewsInfoRouteArgs> {
  NewsInfoRoute({
    Key? key,
    required NewsModel news,
    List<PageRouteInfo>? children,
  }) : super(
          NewsInfoRoute.name,
          args: NewsInfoRouteArgs(
            key: key,
            news: news,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsInfoRoute';

  static const PageInfo<NewsInfoRouteArgs> page =
      PageInfo<NewsInfoRouteArgs>(name);
}

class NewsInfoRouteArgs {
  const NewsInfoRouteArgs({
    this.key,
    required this.news,
  });

  final Key? key;

  final NewsModel news;

  @override
  String toString() {
    return 'NewsInfoRouteArgs{key: $key, news: $news}';
  }
}

/// generated route for
/// [NewsListScreen]
class NewsListRoute extends PageRouteInfo<void> {
  const NewsListRoute({List<PageRouteInfo>? children})
      : super(
          NewsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PuzzleGameScreen]
class PuzzleGameRoute extends PageRouteInfo<PuzzleGameRouteArgs> {
  PuzzleGameRoute({
    Key? key,
    required PuzzleModel puzzle,
    List<PageRouteInfo>? children,
  }) : super(
          PuzzleGameRoute.name,
          args: PuzzleGameRouteArgs(
            key: key,
            puzzle: puzzle,
          ),
          initialChildren: children,
        );

  static const String name = 'PuzzleGameRoute';

  static const PageInfo<PuzzleGameRouteArgs> page =
      PageInfo<PuzzleGameRouteArgs>(name);
}

class PuzzleGameRouteArgs {
  const PuzzleGameRouteArgs({
    this.key,
    required this.puzzle,
  });

  final Key? key;

  final PuzzleModel puzzle;

  @override
  String toString() {
    return 'PuzzleGameRouteArgs{key: $key, puzzle: $puzzle}';
  }
}

/// generated route for
/// [PuzzleListScreen]
class PuzzleListRoute extends PageRouteInfo<void> {
  const PuzzleListRoute({List<PageRouteInfo>? children})
      : super(
          PuzzleListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PuzzleListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResultScreen]
class ResultRoute extends PageRouteInfo<ResultRouteArgs> {
  ResultRoute({
    Key? key,
    required String result,
    required double coins,
    List<PageRouteInfo>? children,
  }) : super(
          ResultRoute.name,
          args: ResultRouteArgs(
            key: key,
            result: result,
            coins: coins,
          ),
          initialChildren: children,
        );

  static const String name = 'ResultRoute';

  static const PageInfo<ResultRouteArgs> page = PageInfo<ResultRouteArgs>(name);
}

class ResultRouteArgs {
  const ResultRouteArgs({
    this.key,
    required this.result,
    required this.coins,
  });

  final Key? key;

  final String result;

  final double coins;

  @override
  String toString() {
    return 'ResultRouteArgs{key: $key, result: $result, coins: $coins}';
  }
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
