import 'dart:convert';

import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetPublicState {}

class GetPublicLoading extends GetPublicState {}

class GetPublicLoaded extends GetPublicState {
  final Map public;
  GetPublicLoaded({
    required this.public,
  });
}

class GetPublicError extends GetPublicState {
  final String messageError;
  GetPublicError({
    required this.messageError,
  });
}

class GetPublicCubit extends Cubit<GetPublicState> {
  GetPublicCubit() : super(GetPublicLoading());

  Future fetch() async {
    emit(GetPublicLoading());
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
      final response = await http.get(Uri.parse('$url/patient-record/profile'),
          headers: headers);
var public = json.decode(response.body);

      if (response.statusCode == 200) {
        print(await response.body);
        
        emit(GetPublicLoaded(public: public));
      } else {
         print(await response.body);
        emit(GetPublicLoaded(public: public));
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
      emit(GetPublicError(messageError: e.toString()));
    }
  }
}
