import 'dart:convert';

import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetmedicineState {}

class GetmedicineLoading extends GetmedicineState {}

class GetmedicineLoaded extends GetmedicineState {
  final medicine;
  GetmedicineLoaded({
    required this.medicine,
  });
}

class GetmedicineError extends GetmedicineState {
  final String messageError;
  GetmedicineError({
    required this.messageError,
  });
}

class GetmedicineCubit extends Cubit<GetmedicineState> {
  GetmedicineCubit() : super(GetmedicineLoading());

  Future fetch() async {
    emit(GetmedicineLoading());
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
      final response = await http.get(Uri.parse('$url/patient-record/medications'),
          headers: headers);
  var medicine = json.decode(response.body);

      if (response.statusCode == 200) {
        print(await response.body);
      
        emit(GetmedicineLoaded(medicine: medicine));
      } else {
         print(medicine);
        
        emit(GetmedicineLoaded(medicine: medicine));
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
      emit(GetmedicineError(messageError: e.toString()));
    }
  }
}
