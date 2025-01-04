import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stroll_task/constants/colors.dart';
import 'package:stroll_task/constants/images.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: StrollColors.strollBlack,
      body: Stack(
        children: [
          Positioned(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              Assets.homeBg,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Stroll Bonfire',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      color:
                          StrollColors.strollPurpleShade, // Text color: #B3ADF6
                      shadows: [
                        Shadow(
                          color: Color(0x33000000), // #00000033
                          blurRadius: 7.9,
                        ),
                        Shadow(
                          color: Color(0xFFBEBEBE), // #BEBEBE
                          blurRadius: 2,
                        ),
                        Shadow(
                          color: Color(0x8024232F), // #24232F80 (50% opacity)
                          blurRadius: 2,
                        ),
                        Shadow(
                          color: Color(0xFFB3ADF6), // Border color: #B3ADF6
                          blurRadius: 0.32,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  SvgPicture.asset(Assets.caretDown),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.timer),
                  const SizedBox(width: 3),
                  const Text('22h 00m',
                      style: TextStyle(
                          color: StrollColors.strollWhite,
                          fontSize: 12,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(width: 12),
                  SvgPicture.asset(Assets.people),
                  const SizedBox(width: 3),
                  const Text('103',
                      style: TextStyle(
                          color: StrollColors.strollWhite,
                          fontSize: 12,
                          fontWeight: FontWeight.w600))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
