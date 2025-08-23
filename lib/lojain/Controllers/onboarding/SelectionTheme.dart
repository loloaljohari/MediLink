import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SelectionTheme extends Cubit<int?> {
  SelectionTheme() : super(null) {
    loadTheme();
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString('theme');

    if (savedTheme != null) {
      emit(savedTheme == "dark" ? 3 : 4);
    } else {
      // ثيم النظام
      final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
      emit(brightness == Brightness.dark ? 3 : 4);
    }
  }

  Future<void> selecttheme(int option) async {
   
    final prefs = await SharedPreferences.getInstance();
    final theme = option == 3 ? "dark" : "light";
    await prefs.setString('theme', theme);
    print(theme); emit(option);
    
  }
}