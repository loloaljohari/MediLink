import 'dart:convert';

import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Postalarm extends Cubit<bool> {
  Postalarm() : super(false);
  Future<bool> post(var id, var list) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');

      String Authorization = 'Bearer $token';
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Language': 'ar',
        'Authorization': '$Authorization',
        'Cookie':
            'syrian_clinic_session=3XzjaNux0m39927nEtzdLhuwpd3Jwn4pXGUDOvOX'
      };

      var response = await http.post(
          Uri.parse(
            '$url/medication-alarms',
          ),
          headers: headers,
          body: jsonEncode({
            "medication_id": id,
            "alarm_times": [list]
          }));

      emit(false);
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(await response.body);

        return true;
      } else {
        print(response.body);
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