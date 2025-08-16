import 'dart:convert';

import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChangeAccount extends Cubit<bool> {
  ChangeAccount() : super(false);
  Future<dynamic> post(
      {required email,
      required password,
      required password_confirmation}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');

      String Authorization = 'Bearer $token';
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Accept-Language': 'ar',
        'Authorization': '$Authorization',
        'Cookie':
            'syrian_clinic_session=3XzjaNux0m39927nEtzdLhuwpd3Jwn4pXGUDOvOX'
      };
      emit(true);
      var request = await http.MultipartRequest(
          'POST', Uri.parse('$url/force-password-change'));

      request.fields.addAll({
        'email': '$email',
        'password': '$password',
        'password_confirmation': '$password_confirmation'
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responsebody = await http.Response.fromStream(response);
      var data = json.decode(responsebody.body);
      print(data);
      emit(false);
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(await responsebody.body);

        return true;
      } else {
        print(responsebody.body);
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}


// {
//     "message": "Unauthenticated."
// }