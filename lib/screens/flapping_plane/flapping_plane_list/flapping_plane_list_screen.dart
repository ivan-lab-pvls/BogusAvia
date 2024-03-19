import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:lottie/lottie.dart';
import 'package:skypilot_app/router/router.dart';
import 'package:skypilot_app/screens/flapping_plane/models/plane_model.dart';
import 'package:skypilot_app/screens/flapping_plane/repository/plane_repository.dart';
import 'package:skypilot_app/theme/colors.dart';
import 'package:skypilot_app/widgets/app_container.dart';

@RoutePage()
class FlappingPlaneListScreen extends StatefulWidget {
  const FlappingPlaneListScreen({super.key});

  @override
  State<FlappingPlaneListScreen> createState() => _FlappingPlaneListScreenState();
}

class _FlappingPlaneListScreenState extends State<FlappingPlaneListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Flapping Plane',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Choose an plane to start the game.',
                  style: TextStyle(
                    color: AppColors.white40,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: planeRepository.length,
                    separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 15),
                    itemBuilder: (BuildContext context, int index) {
                      final PlaneModel _plane = planeRepository[index];
                      return GestureDetector(
                        onTap: () {
                          context.router.push(EnterCoinsRoute(plane: _plane));
                        },
                        child: AppContainer(
                          child: Column(
                            children: [
                              Lottie.asset(_plane.imageJson),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    _plane.name,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
