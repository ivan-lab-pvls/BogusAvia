
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skypilot_app/screens/flapping_plane/flapping_plane_list/flapping_plane_list_screen.dart';
import 'package:skypilot_app/screens/news/news_list/news_list_screen.dart';
import 'package:skypilot_app/screens/puzzle/puzzle_list/puzzle_list_screen.dart';
import 'package:skypilot_app/screens/settings/settings_screen.dart';
import 'package:skypilot_app/theme/colors.dart';


@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final _tabs = [FlappingPlaneListScreen(), PuzzleListScreen(), NewsListScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          iconTheme: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return IconThemeData(color: AppColors.blue);
            } else {
              return IconThemeData(color: AppColors.white40);
            }
          }),
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blue);
            }
            return TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: AppColors.white40);
          }),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedIndex: _currentIndex,
          backgroundColor: AppColors.grey,
          indicatorColor: Colors.transparent,
          destinations: [
            NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/images/elements/airplane.svg', color: AppColors.blue),
              icon: SvgPicture.asset('assets/images/elements/airplane.svg', color: AppColors.white40),
              label: 'Flapping Plane',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/images/elements/puzzle.svg', color: AppColors.blue),
              icon: SvgPicture.asset('assets/images/elements/puzzle.svg', color: AppColors.white40),
              label: 'Puzzle',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/images/elements/news.svg', color: AppColors.blue),
              icon: SvgPicture.asset('assets/images/elements/news.svg', color: AppColors.white40),
              label: 'News',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/images/elements/settings.svg', color: AppColors.blue),
              icon: SvgPicture.asset('assets/images/elements/settings.svg', color: AppColors.white40),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
