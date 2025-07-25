import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DropdownState {
  final String? selectedValue;

  const DropdownState({this.selectedValue});
}

class DropdownCubit extends Cubit<DropdownState> {
  DropdownCubit() : super(const DropdownState());

  Future<void> loadSelectedValue() async {
    var font;
    var initFont;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    font = await preferences.getString('fontType');
    if (font == 'larg') {
      initFont = 'Larg';
    } else if (font == 'small') {
      initFont = 'Small';
    } else
      initFont = 'Medium';
    emit(DropdownState(selectedValue: initFont));
  }

  Future<void> setSelectedValue(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (value == 'Larg') {
      preferences.setString('fontType', 'larg');
    } else if (value == 'Small') {
      preferences.setString('fontType', 'small');
    } else
      preferences.setString('fontType', 'medium');
    emit(DropdownState(selectedValue: value));
  }
}
