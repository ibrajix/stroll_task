import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll_task/constants/colors.dart';
import 'package:stroll_task/features/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:stroll_task/features/message/view/message.dart';
import 'package:stroll_task/features/profile/view/profile.dart';
import 'package:stroll_task/features/trending/view/trending.dart';

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
    final appCubit = context.watch<BottomNavCubit>();

    return Scaffold(
      backgroundColor: StrollColors.blackBg,
      body: IndexedStack(
        index: 0,
        children: screens,
      ),
    );
  }
}
