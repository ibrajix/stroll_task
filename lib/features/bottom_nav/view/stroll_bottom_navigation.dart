import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stroll_task/constants/colors.dart';
import 'package:stroll_task/features/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:stroll_task/features/message/view/message.dart';
import 'package:stroll_task/features/profile/view/profile.dart';
import 'package:stroll_task/features/trending/view/trending.dart';

import '../../../constants/images.dart';
import '../../dashboard/view/dashboard.dart';

class StrollBottomNavigation extends StatefulWidget {
  const StrollBottomNavigation({super.key});

  @override
  State<StrollBottomNavigation> createState() => _StrollBottomNavigationState();
}

class _StrollBottomNavigationState extends State<StrollBottomNavigation> {
  final screens = [
    const Dashboard(),
    const Trending(),
    const Message(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavCubit = context.watch<BottomNavCubit>();
    final currentIndex = bottomNavCubit.currentIndex;

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: StrollColors.blackBg,
        currentIndex: currentIndex,
        onTap: (index) {
          bottomNavCubit.changeIndex(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.bonfire,
            ),
            label: 'Trending',
          ),
          BottomNavigationBarItem(
            icon: Stack(children: [
              SvgPicture.asset(Assets.chat),
              Positioned(
                right: 0,
                top: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 3),
                  decoration: BoxDecoration(
                    color: StrollColors.strollPurple,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 1.4, color: StrollColors.strollPurple),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: Text(
                        '10',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 7,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.user),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
