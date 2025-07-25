import 'package:flutter_bloc/flutter_bloc.dart';

class CheckAddictions extends Cubit<bool> {
  CheckAddictions():super(false);
 
  Future check(bool val) async{
  emit(val);
  }


}