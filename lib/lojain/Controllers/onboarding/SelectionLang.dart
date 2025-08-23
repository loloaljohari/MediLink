///////////////////////////
//////////////////////////

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/widgets.dart';

class Selection extends Cubit<int?> {
  Selection() : super(null) {
    loadLang();
  }

  Future<void> loadLang() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLang = prefs.getString('lang');

    if (savedLang != null) {
      emit(savedLang == "ar" ? 1 : 2);
    } else {
      // لغة النظام
      final deviceLang = WidgetsBinding.instance.platformDispatcher.locale.languageCode;
      emit(deviceLang == "ar" ? 1 : 2);
    }
  }

  Future<void> selectLang(int option) async {
    
    final prefs = await SharedPreferences.getInstance();
    final lang = option == 1 ? "ar" : "en";
    await prefs.setString('lang', lang);
    emit(option);
  }
}