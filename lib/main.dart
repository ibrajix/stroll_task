import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll_task/features/bottom_nav/view/stroll_bottom_navigation.dart';
import 'package:stroll_task/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:stroll_task/theme/theme_data.dart';

import 'di/service_locator.dart';
import 'features/bottom_nav/cubit/bottom_nav_cubit.dart';

void main() {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<BottomNavCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<DashboardCubit>(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getAppTheme(context, false),
          home: const StrollBottomNavigation()),
    );
  }
}
