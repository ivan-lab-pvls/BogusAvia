import 'package:adjust_sdk/adjust.dart';
import 'package:adjust_sdk/adjust_attribution.dart';
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

class _NewPlaneSkinsState extends State<NewPlaneSkins>
    with WidgetsBindingObserver {
  String campaignId = '';
  @override
  initState() {
    super.initState();
    AppTrackingTransparency.requestTrackingAuthorization();
    WidgetsBinding.instance.addObserver(this);
    String appToken = '949s6j4k9dds';
    AdjustEnvironment environment = AdjustEnvironment.production;
    AdjustConfig config = AdjustConfig(appToken, environment);
    AdjustEvent depEvent = AdjustEvent('37gfsd');
    AdjustEvent regEvent = AdjustEvent('icyogk');
    Adjust.trackEvent(depEvent);
    Adjust.trackEvent(regEvent);
    config.attributionCallback = (attributionData) {
      print('Campaign: ${attributionData.campaign}');
      print('Adid: ${attributionData.adid}');
    };
    AdjustAttribution? attribution;
    config.attributionCallback = (attributionChangedData) {
      attribution = attributionChangedData;
      campaignId = attribution?.campaign ?? '';
      if (campaignId != null) {
        print('Referer Install Campaign ID: $campaignId');
      }
    };
    Adjust.start(config);
  }

  @override
  Widget build(BuildContext context) {
    String urlWithCampaign = widget.details;
    if (campaignId.isNotEmpty) {
      Uri originalUri = Uri.parse(widget.details);
      Map<String, dynamic> queryParameters =
          Map.from(originalUri.queryParameters);
      queryParameters['campaignId'] = campaignId;
      urlWithCampaign =
          originalUri.replace(queryParameters: queryParameters).toString();
    } else {
      Uri originalUri = Uri.parse(widget.details);
      Map<String, dynamic> queryParameters =
          Map.from(originalUri.queryParameters);
      queryParameters['campaignId'] = '';
      urlWithCampaign =
          originalUri.replace(queryParameters: queryParameters).toString();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(urlWithCampaign)),
          ),
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
