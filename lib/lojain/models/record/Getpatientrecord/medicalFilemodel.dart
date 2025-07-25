import 'dart:convert';

import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetmedicalfileState {}

class GetmedicalfileLoading extends GetmedicalfileState {}

class GetmedicalfileLoaded extends GetmedicalfileState {
  final medicalfile;
  GetmedicalfileLoaded({
    required this.medicalfile,
  });
}

class GetmedicalfileError extends GetmedicalfileState {
  final String messageError;
  GetmedicalfileError({
    required this.messageError,
  });
}

class GetmedicalfileCubit extends Cubit<GetmedicalfileState> {
  GetmedicalfileCubit() : super(GetmedicalfileLoading());

  Future fetch() async {
    emit(GetmedicalfileLoading());
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
      final response = await http.get(Uri.parse('$url/patient-record/MedicalAttachment'),
          headers: headers);
var medicalfile = json.decode(response.body);

      if (response.statusCode == 200) {
        print(await response.body);
        
        emit(GetmedicalfileLoaded(medicalfile: medicalfile));
      } else {
        emit(GetmedicalfileLoaded(medicalfile: medicalfile));
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
      emit(GetmedicalfileError(messageError: e.toString()));
    }
  }
}
