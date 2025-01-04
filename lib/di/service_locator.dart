import 'package:get_it/get_it.dart';
import 'package:stroll_task/features/dashboard/cubit/dashboard_cubit.dart';

import '../features/bottom_nav/cubit/bottom_nav_cubit.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerFactory(() => BottomNavCubit());
  sl.registerFactory(() => DashboardCubit());
}
