import 'dart:convert';

import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetSensitivityState {}

class GetSensitivityLoading extends GetSensitivityState {}

class GetSensitivityLoaded extends GetSensitivityState {
  final Sensitivity;
  GetSensitivityLoaded({
    required this.Sensitivity,
  });
}

class GetSensitivityError extends GetSensitivityState {
  final String messageError;
  GetSensitivityError({
    required this.messageError,
  });
}

class GetSensitivityCubit extends Cubit<GetSensitivityState> {
  GetSensitivityCubit() : super(GetSensitivityLoading());

  Future fetch() async {
    emit(GetSensitivityLoading());
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
      final response = await http.get(
          Uri.parse('$url/patient-record/allergiesGroup'),
          headers: headers);
      var Sensitivity = json.decode(response.body);

      if (response.statusCode == 200) {
        print(await response.body);

        emit(GetSensitivityLoaded(Sensitivity: Sensitivity));
      } else {
        print(await response.body);

        emit(GetSensitivityLoaded(Sensitivity: Sensitivity));
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
      emit(GetSensitivityError(messageError: e.toString()));
    }
  }
}
