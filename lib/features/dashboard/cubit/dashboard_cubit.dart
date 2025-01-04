import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<int?> {
  DashboardCubit() : super(null);

  void setActive(int index) {
    emit(index);
  }
}
