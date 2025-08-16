import 'dart:convert';

import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetAllNearestdateState {}

class GetAllNearestdateLoading extends GetAllNearestdateState {}

class GetAllNearestdateLoaded extends GetAllNearestdateState {
  final   dates;
  GetAllNearestdateLoaded({
    required this.dates,
  });
}

class GetAllNearestdateError extends GetAllNearestdateState {
  final String messageError;
  GetAllNearestdateError({
    required this.messageError,
  });
}

class GetAllNearestdateCubit extends Cubit<GetAllNearestdateState> {
  GetAllNearestdateCubit() : super(GetAllNearestdateLoading());

  Future fetchProfile() async {
    emit(GetAllNearestdateLoading());
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
          await http.get(Uri.parse('$url/appointments/confirmed/nearestAll'), headers: headers);
      var dates = json.decode(response.body);
      print(await response.body);

      if (response.statusCode == 200) {
        print(await response.body);

        emit(GetAllNearestdateLoaded(dates: dates));
      } else {
        print(await response.body);

        emit(GetAllNearestdateLoaded(dates: dates));
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
      emit(GetAllNearestdateError(messageError: e.toString()));
    }
  }
}
