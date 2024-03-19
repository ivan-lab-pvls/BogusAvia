import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:skypilot_app/router/router.dart';
import 'package:skypilot_app/screens/flapping_plane/coins_bloc/coins_bloc.dart';
import 'package:skypilot_app/screens/flapping_plane/models/plane_model.dart';
import 'package:skypilot_app/services/shared_preferences.dart';
import 'package:skypilot_app/theme/colors.dart';
import 'package:skypilot_app/widgets/action_button_widget.dart';

@RoutePage()
class EnterCoinsScreen extends StatefulWidget {
  final PlaneModel plane;

  const EnterCoinsScreen({super.key, required this.plane});

  @override
  State<EnterCoinsScreen> createState() => _EnterCoinsScreenState();
}

class _EnterCoinsScreenState extends State<EnterCoinsScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        backgroundColor: AppColors.grey,
        centerTitle: true,
        leadingWidth: 110,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GestureDetector(
            onTap: () {
              context.router.pop();
            },
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios_new, color: AppColors.blue),
                SizedBox(width: 5),
                Text(
                  'Back',
                  style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/flapping-plane/bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    BlocProvider(
                      create: (context) => CoinsBloc()..add(GetCoinsEvent()),
                      child: BlocConsumer<CoinsBloc, CoinsState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state is LoadedCoinsState) {
                            return Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: AppColors.black65,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/images/flapping-plane/coin.png',
                                      width: 32,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '${state.coins.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: 200,
                        height: 200,
                        child: Lottie.asset(widget.plane.imageJson),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'To start the game, enter the number of coins you want to accumulate.',
                      style: TextStyle(
                        color: AppColors.white40,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Goal coins',
                      style: TextStyle(
                        color: AppColors.white40,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      controller: _controller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.white8,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: ActionButtonWidget(
                          text: 'Start',
                          width: 350,
                          onTap: () async {
                            if (_controller.text.isNotEmpty && _controller.text != '0') {
                              SharedPreferencesService storage =
                                  await SharedPreferencesService.getInstance();

                              if (storage.coins < int.parse(_controller.text)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: AppColors.blue,
                                    content: Text(
                                      'Not enough coins!',
                                      style: TextStyle(color: AppColors.white),
                                    ),
                                  ),
                                );
                              } else {
                                context.router.push(FlappingPlaneGameRoute(
                                    plane: widget.plane,
                                    coins: int.parse(_controller.text)));
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColors.blue,
                                  content: Text(
                                    'Firstly, enter goal coins!',
                                    style: TextStyle(color: AppColors.white),
                                  ),
                                ),
                              );
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
