import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:skypilot_app/router/router.dart';
import 'package:skypilot_app/screens/flapping_plane/coins_bloc/coins_bloc.dart';
import 'package:skypilot_app/screens/flapping_plane/models/plane_model.dart';
import 'package:skypilot_app/theme/colors.dart';
import 'package:skypilot_app/widgets/action_button_widget.dart';

@RoutePage()
class FlappingPlaneGameScreen extends StatefulWidget {
  final PlaneModel plane;
  final int coins;

  const FlappingPlaneGameScreen(
      {super.key, required this.plane, required this.coins});

  @override
  State<FlappingPlaneGameScreen> createState() =>
      _FlappingPlaneGameScreenState();
}

class _FlappingPlaneGameScreenState extends State<FlappingPlaneGameScreen> {
  double _left = 0;
  double _bottom = 0;

  double coins = 0;
  double coefficient = 1.0;
  bool gameStarted = false;
  int timerDuration = 0;
  Timer _timer = Timer(Duration(seconds: 0), () {});
  Timer _updateTimer = Timer(Duration(seconds: 0), () {});

  List<Offset> positions = [];

  @override
  void initState() {
    super.initState();
    coins = widget.coins.toDouble();
    gameStarted = true;
    startGame();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _left = MediaQuery.of(context).size.width;
        _bottom = MediaQuery.of(context).size.height * 0.5;
      });
    });
  }

  void startGame() {
    timerDuration = Random().nextInt(12) + 5;

    if (gameStarted) {
      _updateTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
        setState(() {
          coefficient += 0.01;
        });
      });
    }
    _timer = Timer(Duration(seconds: timerDuration), () {
      if (gameStarted) {
        context.read<CoinsBloc>().add(DecrementCoinsEvent(coins: widget.coins));
        context.router.push(ResultRoute(coins: 0, result: 'Lose'));
      }
    });
  }

  void stopGame() {
    if (gameStarted) {
      gameStarted = false;
      _timer.cancel();
      _updateTimer.cancel();
    }
  }

  void resetGame() {
    setState(() {
      _updateTimer.cancel();
      coins = 0;
      gameStarted = false;
      coefficient = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double _mediaHeight = MediaQuery.of(context).size.height;
    final double _mediaWidth = MediaQuery.of(context).size.width;

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
      body: Column(
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
                Center(
                  child: Text(
                    'x${coefficient.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: AppColors.black65,
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/flapping-plane/coin.png',
                            width: 32,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '${coins.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(// Start of the path
                  child: CustomPaint(
                    painter: TrajectoryPainter(positions),
                  ),
                ),
                TweenAnimationBuilder(
                  curve: Curves.linear,
                  tween: BezierTween(
                    begin: Offset(-100, _mediaHeight * 0.35),
                    control: Offset(200, 200),
                    end: Offset(_mediaWidth * 0.6, 0),
                  ),
                  duration: Duration(
                      seconds: timerDuration + Random().nextInt(2) + 5),
                  builder: (BuildContext context, Offset value, Widget? child) {
                    positions.add(value);

                    return Positioned(
                      left: value.dx,
                      top: value.dy,
                      child: RotationTransition(
                        turns: AlwaysStoppedAnimation(-20 / 360),
                        child: Container(
                          width: 200,
                          height: 200,
                          child: Lottie.asset(widget.plane.imageJson),
                        ),
                      ),
                    );
                  },
                ),

              ],
            ),
          ),
          Container(
            color: AppColors.grey,
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
                  controller: TextEditingController(),
                  readOnly: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white8,
                    hintText: '${widget.coins}',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: ActionButtonWidget(
                      text: 'Stop',
                      width: 350,
                      onTap: () {
                        stopGame();
                        final double winnings = coins * coefficient;
                        context.read<CoinsBloc>().add(IncrementCoinsEvent(coins: winnings));
                        context.router
                            .push(ResultRoute(coins: winnings, result: 'Win'));
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BezierTween extends Tween<Offset> {
  final Offset begin;
  final Offset end;
  final Offset control;

  BezierTween({required this.begin, required this.end, required this.control})
      : super(begin: begin, end: end);

  @override
  Offset lerp(double t) {
    final t1 = 1 - t;
    return begin * t1 * t1 + control * 2 * t1 * t + end * t * t;
  }
}


class TrajectoryPainter extends CustomPainter {
  List<Offset> positions;

  TrajectoryPainter(this.positions);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Path path = Path();
    path.moveTo(positions.first.dx+110, positions.first.dy+110);

    for (int i = 1; i < positions.length; i++) {
      path.lineTo(positions[i].dx+110, positions[i].dy+110);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TrajectoryPainter oldDelegate) {
    return true;
  }
}
