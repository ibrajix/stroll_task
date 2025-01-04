import 'package:badges/badges.dart' as badges;
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
            icon: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SvgPicture.asset(
                Assets.home,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SvgPicture.asset(
                  Assets.bonfire,
                )),
            label: 'Trending',
          ),
          BottomNavigationBarItem(
            icon: badges.Badge(
              position: badges.BadgePosition.topEnd(top: -1, end: -1),
              badgeStyle: badges.BadgeStyle(
                badgeColor: StrollColors.strollPurple,
                borderRadius: BorderRadius.circular(0.2),
              ),
              badgeContent: const Text(
                '10',
                style: TextStyle(fontSize: 10),
              ),
              child: SvgPicture.asset(
                Assets.chat,
              ),
            ),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SvgPicture.asset(Assets.user)),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
