import 'dart:convert';

import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetDatesState {}

class GetDatesLoading extends GetDatesState {}

class GetDatesLoaded extends GetDatesState {
  final  dates;
  GetDatesLoaded({
    required this.dates,
  });
}

class GetDatesError extends GetDatesState {
  final String messageError;
  GetDatesError({
    required this.messageError,
  });
}

class GetDatesCubit extends Cubit<GetDatesState> {
  GetDatesCubit() : super(GetDatesLoading());

  Future fetchProfile() async {
    emit(GetDatesLoading());
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
          await http.get(Uri.parse('$url/patient/appointments'), headers: headers);
      var dates = json.decode(response.body);
      print(await response.body);

      if (response.statusCode == 200) {
        print(await response.body);

        emit(GetDatesLoaded(dates: dates));
      } else {
        print(await response.body);

        emit(GetDatesLoaded(dates: dates));
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
      emit(GetDatesError(messageError: e.toString()));
    }
  }
}
