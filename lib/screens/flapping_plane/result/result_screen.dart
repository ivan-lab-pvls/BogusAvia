import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skypilot_app/router/router.dart';
import 'package:skypilot_app/theme/colors.dart';
import 'package:skypilot_app/widgets/action_button_widget.dart';

@RoutePage()
class ResultScreen extends StatefulWidget {
  final String result;
  final double coins;
  const ResultScreen({super.key, required this.result, required this.coins});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.result,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                widget.result != 'Lose' ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'You win ',
                      style: TextStyle(
                        color: AppColors.white40,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${widget.coins.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      ' coins!',
                      style: TextStyle(
                        color: AppColors.white40,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ) : Text(
                  'You lost all coins!',
                  style: TextStyle(
                    color: AppColors.white40,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonWidget(
          text: 'Play Again',
          width: 350,
          onTap: () {
            context.router.push(MainRoute());
          }),
    );
  }
}
