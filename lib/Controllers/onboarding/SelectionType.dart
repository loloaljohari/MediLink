import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectionType extends Cubit<int?>{
  SelectionType():super(1);
  void choose(int option) async{
    print(option);
    
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    if(option==0){
 
  sharedPreferences.setString('fontType', 'larg');
    }
    else if(option==1){
  sharedPreferences.setString('fontType', 'medium');
    }
    else 
    {
      sharedPreferences.setString('fontType', 'small');
    }
    var type=sharedPreferences.getString('fontType');
    print(type);
    emit(option);
  }
}