import 'package:flutter/material.dart';
import 'package:xo_game_project/screens/board_screen.dart';
import 'package:xo_game_project/screens/xo_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: XoHomeScreen(),
      initialRoute: XoHomeScreen.routeName,
      routes: {
        XoHomeScreen.routeName: (context) => XoHomeScreen(),
        BoardScreen.routeName: (context) => BoardScreen(),
      },
    );
  }
}
