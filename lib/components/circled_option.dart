import 'package:flutter/material.dart';
import 'package:stroll_task/constants/colors.dart';

class CircleButton extends StatelessWidget {
  final String letter;
  final bool isActive;
  final VoidCallback onTap;

  const CircleButton({
    super.key,
    required this.letter,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 20, // Diameter of the circle
        height: 20,
        decoration: BoxDecoration(
          color: isActive
              ? StrollColors.strollPurple
              : Colors.transparent, // Background color
          border: isActive
              ? null
              : Border.all(
                  color: StrollColors.strollGreyShade, // Inactive border color
                  width: 1,
                ),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            letter,
            style: TextStyle(
              color: isActive
                  ? StrollColors.strollPurple
                  : StrollColors.strollGreyShade, // Text color
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
