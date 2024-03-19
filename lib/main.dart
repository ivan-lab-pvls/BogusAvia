import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:skypilot_app/firebase_options.dart';
import 'package:skypilot_app/screens/flapping_plane/coins_bloc/coins_bloc.dart';
import 'package:skypilot_app/services/shared_preferences.dart';
import 'package:skypilot_app/skypilot_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();

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