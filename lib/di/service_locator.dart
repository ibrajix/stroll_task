import 'package:get_it/get_it.dart';

import '../features/bottom_nav/cubit/bottom_nav_cubit.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerFactory(() => BottomNavCubit());
}
