import 'package:flutter/material.dart';
import 'package:stroll_task/constants/colors.dart';

import 'circled_option.dart';

class OptionsCard extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const OptionsCard({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
        decoration: BoxDecoration(
          color: StrollColors.strollGrey,
          border: Border.all(
            color: isActive ? Colors.blue : Colors.transparent,
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
              CircleButton(letter: "A", isActive: isActive, onTap: onTap),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: StrollColors.strollGreyShade,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
