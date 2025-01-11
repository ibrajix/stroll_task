import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomShadowIconText extends StatelessWidget {
  final String icon;
  final String text;

  const CustomShadowIconText(
      {required this.icon, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Positioned(
              top: 1.5,
              child: SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.srcIn),
              ),
            ),
            SvgPicture.asset(
              icon,
            ),
          ],
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 1),
                blurRadius: 4,
              ),
              Shadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 1),
                blurRadius: 1,
              ),
            ],
          ),
        )
      ],
    );
  }
}
