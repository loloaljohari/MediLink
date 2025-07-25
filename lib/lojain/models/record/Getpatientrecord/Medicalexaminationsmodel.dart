import 'dart:convert';

import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetMedicalexaminationsState {}

class GetMedicalexaminationsLoading extends GetMedicalexaminationsState {}

class GetMedicalexaminationsLoaded extends GetMedicalexaminationsState {
  final Medicalexaminations;
  GetMedicalexaminationsLoaded({
    required this.Medicalexaminations,
  });
}

class GetMedicalexaminationsError extends GetMedicalexaminationsState {
  final String messageError;
  GetMedicalexaminationsError({
    required this.messageError,
  });
}

class GetMedicalexaminationsCubit extends Cubit<GetMedicalexaminationsState> {
  GetMedicalexaminationsCubit() : super(GetMedicalexaminationsLoading());

  Future fetch() async {
    emit(GetMedicalexaminationsLoading());
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
      final response = await http.get(Uri.parse('$url/patient-record/MedicalFileTest'),
          headers: headers);
var Medicalexaminations = json.decode(response.body);

      if (response.statusCode == 200) {
        print(await response.body);
        
        emit(GetMedicalexaminationsLoaded(Medicalexaminations: Medicalexaminations));
      } else {
        
        emit(GetMedicalexaminationsLoaded(Medicalexaminations: Medicalexaminations));
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
      emit(GetMedicalexaminationsError(messageError: e.toString()));
    }
  }
}
