import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LangCubit extends Cubit<int> {
  LangCubit() : super(1) {
    _loadSwitchValue(); // تحميل القيمة الابتدائية عند الإنشاء
  }

  Future<void> _loadSwitchValue() async {
    final prefs = await SharedPreferences.getInstance();
    final savedValue = prefs.getString('lang');
    final inittheme = savedValue == 'ar' ? 2 : 1;
    emit(inittheme);
  }

  Future<void> toggleSwitch(int value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value == 1) {
      await prefs.setString('lang', 'en');
    } else {
      await prefs.setString('lang', 'ar');
    }
    emit(value);
  }
}
