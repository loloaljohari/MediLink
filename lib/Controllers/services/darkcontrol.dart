import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Darkcontrol extends Cubit<bool> {
  Darkcontrol() : super(false) {
    _loadSwitchValue(); // تحميل القيمة الابتدائية عند الإنشاء
  }

  Future<void> _loadSwitchValue() async {
    final prefs = await SharedPreferences.getInstance();
    final savedValue = prefs.getString('theme');
    final inittheme = savedValue == 'light' ? true : false;
    emit(inittheme);
  }

  Future<void> toggleSwitch(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value == true) {
      await prefs.setString('theme', 'light');
    } else {
      await prefs.setString('theme', 'naight');
    }
    emit(value);
  }
}
