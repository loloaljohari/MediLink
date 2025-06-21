import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectionTheme extends Cubit<int?> {
  SelectionTheme() : super(0);
  void selecttheme(int option) async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    var l;
   if(option==4) sharedPreferences.setString("theme","light");
   else sharedPreferences.setString("theme","naight");
   l=sharedPreferences.getString("theme");
    print(l);
    emit(option);
  }
  
}
