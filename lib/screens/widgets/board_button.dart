import 'package:flutter/material.dart';
import 'package:xo_game_project/core/app_colors.dart';

class BoardButton extends StatelessWidget {
  final String value;
  final VoidCallback onTap;

  BoardButton({super.key, required this.value, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            value.toUpperCase(),
            style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: value == 'x' ? AppColors.xColor : AppColors.oColor),
          ),
          ),
        ),
    )
    ;
  }
}
