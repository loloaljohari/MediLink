import 'package:bloc/bloc.dart';

class Selecttheday extends Cubit<dynamic> {
  Selecttheday() : super(null);
  void selectLang(dynamic option) async {
    emit(option);
  }
}
