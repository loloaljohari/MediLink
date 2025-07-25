import 'dart:convert';

import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetProfileState {}

class GetProfileLoading extends GetProfileState {}

class GetProfileLoaded extends GetProfileState {
  final myprofile;
  GetProfileLoaded({
    required this.myprofile,
  });
}

class GetProfileError extends GetProfileState {
  final String messageError;
  GetProfileError({
    required this.messageError,
  });
}

class GetprofileCubit extends Cubit<GetProfileState> {
  GetprofileCubit() : super(GetProfileLoading());

  Future fetchProfile() async {
    emit(GetProfileLoading());
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
          await http.get(Uri.parse('$url/get_profile'), headers: headers);
      var myprofile = json.decode(response.body);
      print(await response.body);

      if (response.statusCode == 200) {
        print(await response.body);

        emit(GetProfileLoaded(myprofile: myprofile));
      } else {
        print(await response.body);

        emit(GetProfileLoaded(myprofile: myprofile));
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
      emit(GetProfileError(messageError: e.toString()));
    }
  }
}
