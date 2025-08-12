import 'dart:convert';

import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetDoctorinfoState {}

class GetDoctorinfoLoading extends GetDoctorinfoState {}

class GetDoctorinfoLoaded extends GetDoctorinfoState {
  final info;
  GetDoctorinfoLoaded({
    required this.info,
  });
}

class GetDoctorinfoError extends GetDoctorinfoState {
  final String messageError;
  GetDoctorinfoError({
    required this.messageError,
  });
}

class GetDoctorinfoCubit extends Cubit<GetDoctorinfoState> {
  GetDoctorinfoCubit() : super(GetDoctorinfoLoading());

  Future fetchProfile(id) async {
    emit(GetDoctorinfoLoading());
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      //  sharedPreferences.remove('token');

      var token = sharedPreferences.getString('token');

      String Authorization = 'Bearer $token';
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Accept-Language': 'en',
        'Authorization': '$Authorization',
      };
      final response =
          await http.get(Uri.parse('$url/doctor/details/$id'), headers: headers);
      var info = json.decode(response.body);
      print(await response.body);

      if (response.statusCode == 200) {
        print(await response.body);
          
        emit(GetDoctorinfoLoaded(info: info));
     
       } 
       else {
        print(await response.body);

        emit(GetDoctorinfoLoaded(info: info));
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
      emit(GetDoctorinfoError(messageError: e.toString()));
    }
  }
}
