import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stroll_task/components/custom_shadow_icon_text.dart';
import 'package:stroll_task/components/gradient_background.dart';
import 'package:stroll_task/constants/colors.dart';
import 'package:stroll_task/constants/images.dart';

import '../../../components/option_card.dart';
import '../cubit/dashboard_cubit.dart';

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

    final List<String> options = [
      "The peace in the early mornings",
      "The magical golden hours",
      "Wind-down time after dinners",
      "The serenity past midnight",
    ];

    final List<String> optionsLetters = [
      "A",
      "B",
      "C",
      "D",
    ];

    return Scaffold(
      backgroundColor: StrollColors.strollBlack,
      body: Stack(
        children: [
          Image.asset(
            Assets.homeBg,
            fit: BoxFit.cover,
          ).animate().fadeIn(duration: 600.ms),
          GradientBackground(
              child: SafeArea(
                  child: Column(
            children: [
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.headerStroll,
                        width: 200,
                      ).animate().fadeIn(duration: 800.ms).scale(),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CustomShadowIconText(
                              icon: Assets.timer, text: '22h 00m')
                          .animate()
                          .slideY(begin: -1, duration: 600.ms),
                      const SizedBox(width: 9),
                      const CustomShadowIconText(
                              icon: Assets.people, text: '103')
                          .animate()
                          .slideY(begin: -1, duration: 600.ms, delay: 100.ms)
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 30, top: 8),
                              padding: const EdgeInsets.fromLTRB(34, 6, 8, 6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: StrollColors.blackBgShade2,
                              ),
                              child: const Text(
                                'Angelina, 28',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: StrollColors.strollWhite),
                              ),
                            ),
                            const Padding(
                              //Left padding is width of circle + spacing
                              padding: EdgeInsets.fromLTRB(69, 6, 8, 6),
                              child: Text(
                                "What is your favorite time \nof the day?",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: StrollColors.strollWhite,
                                  height: 1,
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(),
                            color: StrollColors.blackBgShade2,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: CircleAvatar(
                            radius: 25,
                            foregroundImage: AssetImage(Assets.human),
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Mine is definitely the peace in the morning.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: StrollColors.strollPurpleShade2.withOpacity(0.7),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height:
                      (options.length / 2 * 62) + ((options.length - 2) * 12),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: options.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 12,
                      mainAxisExtent: 62,
                    ),
                    itemBuilder: (context, index) {
                      return BlocBuilder<DashboardCubit, int?>(
                        builder: (BuildContext context, state) {
                          bool isActive = state == index;
                          return OptionsCard(
                            letter: optionsLetters[index],
                            title: options[index],
                            isActive: isActive,
                            onTap: () {
                              context.read<DashboardCubit>().setActive(index);
                            },
                          )
                              .animate()
                              .fadeIn(duration: 500.ms, delay: (index * 100).ms)
                              .scale();
                        },
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                          "Pick your option. \nSee who has a similar mind.",
                          style: TextStyle(
                            color: StrollColors.strollWhiteShade,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          )),
                    ).animate().slideY(begin: 1, duration: 600.ms).fadeIn(),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.speaker),
                        const SizedBox(width: 5),
                        SvgPicture.asset(Assets.rightArrowBg),
                      ],
                    ).animate().fadeIn(duration: 500.ms),
                  ],
                ),
              ),
            ],
          ))),
        ],
      ),
    );
  }
}
