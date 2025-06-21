import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectionColors extends Cubit<int?> {
  SelectionColors() : super(0);
  
  void selectcolor(int option) async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();

if(option==5)
{    sharedPreferences.setString('color',"red");}
else if(option==6){
  sharedPreferences.setString('color',"green"); 

}
else sharedPreferences.setString("color","yellow");
var l=sharedPreferences.getString('color');
    print(l);
    emit(option);
  }
  
}
