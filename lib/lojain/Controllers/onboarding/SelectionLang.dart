import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Selection extends Cubit<int?> {
  Selection() : super(0);
  void selectLang(int option) async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    var l;
   if(option==1) sharedPreferences.setString("lang","ar");
   else sharedPreferences.setString("lang","en");
   l=sharedPreferences.getString('lang');
    print(l);
    emit(option);
  }
  
}
