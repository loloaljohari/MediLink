import 'dart:convert';

import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetNearestdateState {}

class GetNearestdateLoading extends GetNearestdateState {}

class GetNearestdateLoaded extends GetNearestdateState {
  final  dates;
  GetNearestdateLoaded({
    required this.dates,
  });
}

class GetNearestdateError extends GetNearestdateState {
  final String messageError;
  GetNearestdateError({
    required this.messageError,
  });
}

class GetNearestdateCubit extends Cubit<GetNearestdateState> {
  GetNearestdateCubit() : super(GetNearestdateLoading());

  Future fetchProfile() async {
    emit(GetNearestdateLoading());
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
          await http.get(Uri.parse('$url/appointments/confirmed/nearest'), headers: headers);
      var dates = json.decode(response.body);
      print(await response.body);

      if (response.statusCode == 200) {
        print(await response.body);

        emit(GetNearestdateLoaded(dates: dates));
      } else {
        print(await response.body);

        emit(GetNearestdateLoaded(dates: dates));
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
      emit(GetNearestdateError(messageError: e.toString()));
    }
  }
}
