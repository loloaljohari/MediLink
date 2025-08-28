import 'dart:convert';

import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetPrescriotionsState {}

class GetPrescriotionsLoading extends GetPrescriotionsState {}

class GetPrescriotionsLoaded extends GetPrescriotionsState {
  final  prescription;
  GetPrescriotionsLoaded({
    required this.prescription,
  });
}

class GetPrescriotionsError extends GetPrescriotionsState {
  final String messageError;
  GetPrescriotionsError({
    required this.messageError,
  });
}

class GetPrescriotionsCubit extends Cubit<GetPrescriotionsState> {
  GetPrescriotionsCubit() : super(GetPrescriotionsLoading());

  Future fetchProfile() async {
    emit(GetPrescriotionsLoading());
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
          await http.get(Uri.parse('$url/prescription'), headers: headers);
      var prescription = json.decode(response.body);
      print(await response.body);

      if (response.statusCode == 200||response.statusCode == 201) {
        print(await response.body);

        emit(GetPrescriotionsLoaded(prescription: prescription));
      } else {
        print(await response.body);

        emit(GetPrescriotionsLoaded(prescription: prescription));
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
      emit(GetPrescriotionsError(messageError: e.toString()));
    }
  }


}


