import 'package:bloc/bloc.dart';

class Selecttheday extends Cubit<int?> {
  Selecttheday() : super(null);
  void selectLang(int option) async {
    emit(option);
  }
}
