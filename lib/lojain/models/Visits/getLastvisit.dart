import 'dart:convert';

import 'package:MediLink/lojain/Static/Static.dart';
import 'package:MediLink/lojain/View/Home/Visits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetLastvisitState {}

class GetLastvisitLoading extends GetLastvisitState {}

class GetLastvisitLoaded extends GetLastvisitState {
  final  visits;
  GetLastvisitLoaded({
    required this.visits,
  });
}

class GetLastvisitError extends GetLastvisitState {
  final String messageError;
  GetLastvisitError({
    required this.messageError,
  });
}

class GetLastvisitCubit extends Cubit<GetLastvisitState> {
  GetLastvisitCubit() : super(GetLastvisitLoading());

  Future fetchProfile() async {
    emit(GetLastvisitLoading());
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
          await http.get(Uri.parse('$url/editMedicalRecord/visitlast'), headers: headers);
      var visits = json.decode(response.body);
      print(await response.body);

      if (response.statusCode == 200||response.statusCode == 201) {
        print(await response.body);

        emit(GetLastvisitLoaded(visits: visits));
      } else {
        print(await response.body);

        emit(GetLastvisitLoaded(visits: visits));
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
      emit(GetLastvisitError(messageError: e.toString()));
    }
  }


}


