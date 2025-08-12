import 'dart:convert';

import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetDoctorsState {}

class GetDoctorsLoading extends GetDoctorsState {}

class GetDoctorsLoaded extends GetDoctorsState {
  final  doctors;
  GetDoctorsLoaded({
    required this.doctors,
  });
}

class GetDoctorsError extends GetDoctorsState {
  final String messageError;
  GetDoctorsError({
    required this.messageError,
  });
}

class GetDoctorsCubit extends Cubit<GetDoctorsState> {
  GetDoctorsCubit() : super(GetDoctorsLoading());

  Future fetchProfile() async {
    emit(GetDoctorsLoading());
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
          await http.get(Uri.parse('$url/doctors'), headers: headers);
      var doctors = json.decode(response.body);
      print(await response.body);

      if (response.statusCode == 200) {
        print(await response.body);

        emit(GetDoctorsLoaded(doctors: doctors));
      } else {
        print(await response.body);

        emit(GetDoctorsLoaded(doctors: doctors));
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
      emit(GetDoctorsError(messageError: e.toString()));
    }
  }
}
