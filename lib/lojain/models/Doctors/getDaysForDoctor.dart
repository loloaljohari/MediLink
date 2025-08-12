import 'dart:convert';

import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetDaysForDoctorState {}

class GetDaysForDoctorLoading extends GetDaysForDoctorState {}

class GetDaysForDoctorLoaded extends GetDaysForDoctorState {
  final days;
  GetDaysForDoctorLoaded({
    required this.days,
  });
}

class GetDaysForDoctorError extends GetDaysForDoctorState {
  final String messageError;
  GetDaysForDoctorError({
    required this.messageError,
  });
}

class GetDaysForDoctorCubit extends Cubit<GetDaysForDoctorState> {
  GetDaysForDoctorCubit() : super(GetDaysForDoctorLoading());

  Future fetchProfile({required id, required year, required month}) async {
    emit(GetDaysForDoctorLoading());
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
          await http.get(Uri.parse('$url/doctor/$id/month-days?year=$year&month=$month'), headers: headers);
      var days = json.decode(response.body);
      print(await response.body);

      if (response.statusCode == 200) {
        print(await response.body);

        emit(GetDaysForDoctorLoaded(days: days));
      } else {
        print(await response.body);

        emit(GetDaysForDoctorLoaded(days: days));
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
      emit(GetDaysForDoctorError(messageError: e.toString()));
    }
  }
}
