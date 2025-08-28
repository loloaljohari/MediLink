import 'dart:convert';

import 'package:MediLink/lojain/Static/Static.dart';
import 'package:MediLink/lojain/View/Home/Visits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetallvisitsState {}

class GetallvisitsLoading extends GetallvisitsState {}

class GetallvisitsLoaded extends GetallvisitsState {
  final  visits;
  GetallvisitsLoaded({
    required this.visits,
  });
}

class GetallvisitsError extends GetallvisitsState {
  final String messageError;
  GetallvisitsError({
    required this.messageError,
  });
}

class GetallvisitsCubit extends Cubit<GetallvisitsState> {
  GetallvisitsCubit() : super(GetallvisitsLoading());

  Future fetchProfile() async {
    emit(GetallvisitsLoading());
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      //  sharedPreferences.remove('token');

      var token = sharedPreferences.getString('token');
    print(token);
      String Authorization = 'Bearer $token';
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Accept-Language': 'en',
        'Cookie': 'syrian_clinic_session=ci961YlZtBpCUYWWuhOlm2JUoXVkdTHt5NCVtoMe',
        'Authorization': '$Authorization',
      };
      final response =
          await http.get(Uri.parse('$url/AllVisit'), headers: headers);
      var visits = json.decode(response.body);
      print(await response.body);

      if (response.statusCode == 200||response.statusCode == 201) {
        print(await response.body);

        emit(GetallvisitsLoaded(visits: visits));
      } else {
        print(await response.body);

        emit(GetallvisitsLoaded(visits: visits));
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
      emit(GetallvisitsError(messageError: e.toString()));
    }
  }


}


