import 'package:flutter/material.dart';
import 'package:stroll_task/constants/colors.dart';

import 'circled_option.dart';

class OptionsCard extends StatelessWidget {
  final String title;
  final bool isActive;
  final String letter;
  final VoidCallback onTap;

  const OptionsCard({
    super.key,
    required this.title,
    required this.letter,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: StrollColors.strollGrey,
          border: Border.all(
            color: isActive ? StrollColors.strollPurple : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Row(
            children: [
              CircleButton(letter: letter, isActive: isActive, onTap: onTap),
              const SizedBox(width: 10),
              Expanded(
                  child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  height: 1.2,
                  color: StrollColors.strollGreyShade,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
