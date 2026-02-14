import 'package:flutter/material.dart';
import 'package:xo_game_project/screens/widgets/board_button.dart';

import '../core/app_colors.dart';

class BoardScreen extends StatefulWidget {
  static const String routeName = 'boardScreen';

  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  List<String> board = List.filled(9, '');

  String currentPlayer = 'x';

  int player1Score = 0;
  int player2Score = 0;

  bool gameOver = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final selectedPlayer =
          ModalRoute.of(context)!.settings.arguments as String;
      setState(() {
        currentPlayer = selectedPlayer;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                            '$player1Score',
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
                            '$player2Score',
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
                  currentPlayer == 'x' ? 'Player 1’s Turn' : 'Player 2’s Turn',
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
                              BoardButton(
                                value: board[0],
                                onTap: () {
                                  return onCellTap(0);
                                },
                              ),
                              VerticalDivider(color: Colors.black),
                              BoardButton(
                                value: board[1],
                                onTap: () {
                                  return onCellTap(1);
                                },
                              ),
                              VerticalDivider(color: Colors.black),
                              BoardButton(
                                value: board[2],
                                onTap: () {
                                  return onCellTap(2);
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(color: Colors.black, height: 0),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              BoardButton(
                                value: board[3],
                                onTap: () {
                                  return onCellTap(3);
                                },
                              ),
                              VerticalDivider(color: Colors.black),
                              BoardButton(
                                value: board[4],
                                onTap: () {
                                  return onCellTap(4);
                                },
                              ),
                              VerticalDivider(color: Colors.black),
                              BoardButton(
                                value: board[5],
                                onTap: () {
                                  return onCellTap(5);
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(color: Colors.black, height: 0),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              BoardButton(
                                value: board[6],
                                onTap: () {
                                  return onCellTap(6);
                                },
                              ),
                              VerticalDivider(color: Colors.black),
                              BoardButton(
                                value: board[7],
                                onTap: () {
                                  return onCellTap(7);
                                },
                              ),
                              VerticalDivider(color: Colors.black),
                              BoardButton(
                                value: board[8],
                                onTap: () {
                                  return onCellTap(8);
                                },
                              ),
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

  void onCellTap(int index) {
    if (board[index].isNotEmpty || gameOver) return;

    setState(() {
      board[index] = currentPlayer;

      if (checkWinner()) {
        gameOver = true;

        if (currentPlayer == 'x') {
          player1Score++;
        } else {
          player2Score++;
        }

        Future.delayed(Duration(seconds: 1), () {
          resetBoard();
        });
      } else if (!board.contains('')) {
        gameOver = true;
        Future.delayed(Duration(seconds: 1), () {
          resetBoard();
        });
      } else {
        currentPlayer = currentPlayer == 'x' ? 'o' : 'x';
      }
    });
  }

  void resetBoard() {
    setState(() {
      board = List.filled(9, '');
      gameOver = false;
    });
  }

  bool checkWinner() {
    List<List<int>> wins = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in wins) {
      if (board[pattern[0]] == currentPlayer &&
          board[pattern[1]] == currentPlayer &&
          board[pattern[2]] == currentPlayer) {
        return true;
      } else if (!board.contains('')) {
        gameOver = true;
      }
    }

    return false;
  }
}
