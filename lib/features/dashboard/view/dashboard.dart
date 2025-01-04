import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stroll_task/constants/colors.dart';
import 'package:stroll_task/constants/images.dart';

import '../../../components/option_card.dart';

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

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final List<String> options = [
      "The peace in the early mornings",
      "Magical golden hours",
      "Excitement of late nights",
      "Calmness of the afternoon",
    ];

    return Scaffold(
      backgroundColor: StrollColors.strollBlack,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight,
          child: Stack(
            children: [
              Positioned(
                height: screenHeight * 0.5,
                width: screenWidth,
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
                          color: StrollColors.strollPurpleShade,
                          shadows: [
                            Shadow(
                              color: Color(0x33000000),
                              blurRadius: 7.9,
                            ),
                            Shadow(
                              color: Color(0xFFBEBEBE),
                              blurRadius: 2,
                            ),
                            Shadow(
                              color: Color(0x8024232F),
                              blurRadius: 2,
                            ),
                            Shadow(
                              color: Color(0xFFB3ADF6),
                              blurRadius: 0.32,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      SvgPicture.asset(Assets.caretDown),
                    ],
                  ),
                  const SizedBox(height: 8),
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
                  ),
                ],
              ),
              Positioned(
                top: (screenHeight * 0.55) - 90,
                left: 20,
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: Image.asset(
                      Assets.human,
                      fit: BoxFit.cover,
                      width: 60,
                      height: 60,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: (screenHeight * 0.55) - 60,
                left: 20 + 90,
                child: const Text(
                  'Angelina, 28',
                  style: TextStyle(
                    color: StrollColors.strollWhite,
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.51,
                left: 120,
                right: 20,
                child: const Text(
                  'What is your favorite time of the day?',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: StrollColors.strollWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.51 + 60,
                left: 20,
                right: 20,
                child: Text(
                  '“Mine is definitely the peace in the morning.”',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: StrollColors.strollPurpleShade2.withOpacity(0.7),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.51 + 80,
                left: 20,
                right: 20,
                child: SizedBox(
                  height: 300,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: options.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2.5,
                    ),
                    itemBuilder: (context, index) {
                      return OptionsCard(
                        title: options[index],
                        isActive: false,
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.51 + 270,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    const Text(
                        "Pick your option. \nSee who has a similar mind.",
                        style: TextStyle(
                          color: StrollColors.strollWhiteShade,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        )),
                    Spacer(),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.speaker),
                        const SizedBox(width: 5),
                        SvgPicture.asset(Assets.rightArrowBg),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
