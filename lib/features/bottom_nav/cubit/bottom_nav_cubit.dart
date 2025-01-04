import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavState(currentIndex: 0));

  int get currentIndex => state.currentIndex;

  void changeIndex(int index) {
    emit(BottomNavState(currentIndex: index));
  }
}

class BottomNavState {
  final int currentIndex;
  BottomNavState({required this.currentIndex});
}
