import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:skypilot_app/theme/colors.dart';
import 'package:skypilot_app/widgets/app_container.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class ShowTermsAndConditions extends StatelessWidget {
  final String details;

  const ShowTermsAndConditions({Key? key, required this.details})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 119, 139),
      ),
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(details)),
        ),
      ),
    );
  }
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Settings',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Share.share(
                      'Check our game Avia Tracker: Full Battery in AppStore!');
                },
                child: AppContainer(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0))),
                          child: SvgPicture.asset(
                              'assets/images/settings/share.svg'),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Share with friends',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.white40,
                    ),
                  ],
                )),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const ShowTermsAndConditions(
                              details:
                                  'https://docs.google.com/document/d/1ppGqAjAqon_01d3f01Uuz4BZ5xYHDXkiV0_pcq7Bqu0/edit?usp=sharing',
                            )),
                  );
                },
                child: AppContainer(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0))),
                          child: SvgPicture.asset(
                              'assets/images/settings/terms-of-use.svg'),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Terms of use',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.white40,
                    ),
                  ],
                )),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const ShowTermsAndConditions(
                              details:
                                  'https://docs.google.com/document/d/1cZAcNJuTaC5w8aBi0yAKis1hjAkj4Gckd6aoXRK9lXo/edit?usp=sharing',
                            )),
                  );
                },
                child: AppContainer(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0))),
                          child: SvgPicture.asset(
                              'assets/images/settings/policy.svg'),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Privacy Policy',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.white40,
                    ),
                  ],
                )),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const ShowTermsAndConditions(
                              details: 'https://forms.gle/YB25icLMZdh98YbE9',
                            )),
                  );
                },
                child: AppContainer(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0))),
                          child: SvgPicture.asset(
                              'assets/images/settings/support.svg'),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Write support',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.white40,
                    ),
                  ],
                )),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
