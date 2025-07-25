import 'dart:convert';

import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetAlarmsState {}

class GetAlarmsLoading extends GetAlarmsState {}

class GetAlarmsLoaded extends GetAlarmsState {
  final alarms;
  GetAlarmsLoaded({
    required this.alarms,
  });
}

class GetAlarmsError extends GetAlarmsState {
  final String messageError;
  GetAlarmsError({
    required this.messageError,
  });
}

class GetAlarmsCubit extends Cubit<GetAlarmsState> {
  GetAlarmsCubit() : super(GetAlarmsLoading());

  Future fetch() async {
    emit(GetAlarmsLoading());
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');

      String Authorization = 'Bearer $token';
      var headers = {
        'Accept-Language': 'en',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': '$Authorization',
        'Cookie':
            'syrian_clinic_session=VfV6euPA4sgQvh2V0cf05xNtsIttOCUVSGJ9fQN0'
      };
      final response =
          await http.get(Uri.parse('$url/medication-alarms'), headers: headers);
      var alarms = json.decode(response.body);

      if (response.statusCode == 200) {
        print(await response.body);

        emit(GetAlarmsLoaded(alarms: alarms));
      } else {
        emit(GetAlarmsLoaded(alarms: alarms));
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
      emit(GetAlarmsError(messageError: e.toString()));
    }
  }
}
