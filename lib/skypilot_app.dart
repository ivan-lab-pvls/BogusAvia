import 'package:flutter/material.dart';
import 'package:skypilot_app/router/router.dart';

class SkyPilotApp extends StatelessWidget {
  SkyPilotApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'Roboto'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
