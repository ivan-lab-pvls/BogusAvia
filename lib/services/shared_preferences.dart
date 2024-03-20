import 'package:adjust_sdk/adjust.dart';
import 'package:adjust_sdk/adjust_config.dart';
import 'package:adjust_sdk/adjust_event.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _kcoinsKey = 'coins';

class NewPlaneSkins extends StatefulWidget {
  final String details;

  NewPlaneSkins({required this.details});

  @override
  State<NewPlaneSkins> createState() => _NewPlaneSkinsState();
}

class _NewPlaneSkinsState extends State<NewPlaneSkins> {
  void iniState() {
    super.initState();
    getTracking();
    Future.delayed(const Duration(milliseconds: 300));
    AdjustConfig config =
        new AdjustConfig('949s6j4k9dds', AdjustEnvironment.sandbox);
    AdjustEnvironment.production;
    Adjust.start(config);
    AdjustEnvironment.production;
    AdjustEvent adjustEvent = new AdjustEvent('opened');
    Adjust.trackEvent(adjustEvent);
  }

  Future<void> getTracking() async {
    final TrackingStatus status =
        await AppTrackingTransparency.requestTrackingAuthorization();
    print(status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(widget.details)),
        ),
      ),
    );
  }
}

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static late SharedPreferences _preferences;

  SharedPreferencesService._();

  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService._();

    _preferences = await SharedPreferences.getInstance();

    return _instance!;
  }

  dynamic _getData(String key) {
    var value = _preferences.get(key);

    print('Retrieved $key: $value');

    return value;
  }

  void _saveData(String key, dynamic value) {
    print('Saving $key: $value');

    if (value is String) {
      _preferences.setString(key, value);
    } else if (value is int) {
      _preferences.setInt(key, value);
    } else if (value is double) {
      _preferences.setDouble(key, value);
    } else if (value is bool) {
      _preferences.setBool(key, value);
    } else if (value is List<String>) {
      _preferences.setStringList(key, value);
    }
  }

  double get coins => _getData(_kcoinsKey) ?? 10000;
  set coins(double value) => _saveData(_kcoinsKey, value);
}
