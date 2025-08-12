import 'dart:convert';

import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PostBook extends Cubit<bool> {
  PostBook() : super(false);
  Future<dynamic> post({required id, required date, required time}) async {
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
          'POST', Uri.parse('$url/doctor/$id/book-appointment'));

      request.fields.addAll({
        'doctor_id': '$id',
        'date': '$date',
        'time': '$time',
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responsebody = await http.Response.fromStream(response);
      var data = json.decode(responsebody.body);
      print(data);
      emit(false);
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(await responsebody.body);

        return data;
      } else {
        print(responsebody.body);
        return data;
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