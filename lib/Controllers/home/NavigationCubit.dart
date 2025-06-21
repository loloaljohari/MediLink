import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0); // الصفحة الافتراضية هي الصفحة الأولى

  void changePage(int index) {
    emit(index);
  }
}

