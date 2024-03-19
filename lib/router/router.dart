
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:skypilot_app/screens/flapping_plane/enter_coins/enter_coins_screen.dart';
import 'package:skypilot_app/screens/flapping_plane/flapping_plane_game/flapping_plane_game_screen.dart';
import 'package:skypilot_app/screens/flapping_plane/flapping_plane_list/flapping_plane_list_screen.dart';
import 'package:skypilot_app/screens/flapping_plane/result/result_screen.dart';
import 'package:skypilot_app/screens/main/main_screen.dart';
import 'package:skypilot_app/screens/news/news_info/news_info_screen.dart';
import 'package:skypilot_app/screens/news/news_list/news_list_screen.dart';
import 'package:skypilot_app/screens/onboarding/onboarding_screen.dart';
import 'package:skypilot_app/screens/puzzle/puzzle_game/puzzle_game_screen.dart';
import 'package:skypilot_app/screens/puzzle/puzzle_list/puzzle_list_screen.dart';
import 'package:skypilot_app/screens/puzzle/models/puzzle_model.dart';
import 'package:skypilot_app/screens/news/models/news_model.dart';
import 'package:skypilot_app/screens/news/news_info/news_info_screen.dart';
import 'package:skypilot_app/screens/settings/settings_screen.dart';
import 'package:skypilot_app/screens/flapping_plane/models/plane_model.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardingRoute.page, initial: true),
    AutoRoute(page: MainRoute.page),
    AutoRoute(page: PuzzleListRoute.page),
    AutoRoute(page: PuzzleGameRoute.page),
    AutoRoute(page: NewsListRoute.page),
    AutoRoute(page: NewsInfoRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: FlappingPlaneListRoute.page),
    AutoRoute(page: FlappingPlaneGameRoute.page),
    AutoRoute(page: EnterCoinsRoute.page),
    AutoRoute(page: ResultRoute.page),
  ];
}