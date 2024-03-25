import 'package:adjust_sdk/adjust.dart';
import 'package:adjust_sdk/adjust_attribution.dart';
import 'package:adjust_sdk/adjust_config.dart';
import 'package:adjust_sdk/adjust_event.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:skypilot_app/router/router.dart';

class SkyPilotApp extends StatefulWidget {
  SkyPilotApp({Key? key}) : super(key: key);

  @override
  State<SkyPilotApp> createState() => _SkyPilotAppState();
}

class _SkyPilotAppState extends State<SkyPilotApp> {


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
