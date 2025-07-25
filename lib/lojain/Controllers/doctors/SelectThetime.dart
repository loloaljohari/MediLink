import 'package:bloc/bloc.dart';

class Selectthetime extends Cubit<String?> {
  Selectthetime() : super(null);
  void selectLang(String option) async {
    emit(option);
  }
}
