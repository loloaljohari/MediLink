import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Buttonsdates extends Cubit<int> {
  Buttonsdates() : super(0);

  void selectButton(int option) async {
    emit(option);
  }
}
