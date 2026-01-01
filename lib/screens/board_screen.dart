import 'package:flutter/material.dart';
import 'package:xo_game_project/board_button.dart';

import '../app_colors.dart';

class BoardScreen extends StatelessWidget {
  static const String routeName = 'boardScreen';

  const BoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedPlayer =
        ModalRoute.of(context)!.settings.arguments as String;
    //todo:make us khnow we start with x or o
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.cyanColor, AppColors.blueColor],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusGeometry.circular(44),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Player 1',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '0',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Player 2',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '0',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  'Player 1’s Turn',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(13),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusGeometry.circular(44),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              BoardButton(),
                              VerticalDivider(color: Colors.black),
                              BoardButton(),
                              VerticalDivider(color: Colors.black),
                              BoardButton(),
                            ],
                          ),
                        ),
                        Divider(color: Colors.black, height: 0),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              BoardButton(),
                              VerticalDivider(color: Colors.black),
                              BoardButton(),
                              VerticalDivider(color: Colors.black),
                              BoardButton(),
                            ],
                          ),
                        ),
                        Divider(color: Colors.black, height: 0),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              BoardButton(),
                              VerticalDivider(color: Colors.black),
                              BoardButton(),
                              VerticalDivider(color: Colors.black),
                              BoardButton(),
                            ],
                          ),
                        ),
                      ],
                    ),
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
