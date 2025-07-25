import 'dart:convert';

import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Postsensitivity extends Cubit<bool> {
  Postsensitivity() : super(false);
  Future<dynamic> post({
    required var name,
    required var severity,
    required var type,
    required var dueTo,
    required var termmenet,
    required var reasons,
    required var prevention,
  }) async {
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
          'POST', Uri.parse('$url/patient-record/allergies'));
      request.fields.addAll({
        'aller_power': severity,
        'aller_name': name,
        'aller_type': type,
        'aller_cause': dueTo,
        'aller_treatment': termmenet,
        'aller_pervention': prevention,
        'aller_reasons': reasons
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responsebody = await http.Response.fromStream(response);
       var body=jsonDecode(responsebody.body);
      emit(false);
      if (response.statusCode == 200) {
        print(await responsebody.body);

        return true;
      } else {
        print(responsebody.body);
        return false;
      }
    } catch (e) {
      print(e.toString());
    
    }
  }
}


// {
//     "message": "Unauthenticated."
// }