import 'dart:convert';

import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PostEvaluate extends Cubit<bool> {
  PostEvaluate() : super(false);

  Future<bool> post(var id, var treatment_final, var handling, var services,
      var final_evaluate) async {
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
            'syrian_clinic_session=TnmIDSa7aw0xwZuGXAdsZson8ERkq4Pan8gK45ol'
      };
      emit(true);
      var request = await http.MultipartRequest(
          'POST', Uri.parse('$url/Evaluation/$id/storeEvaluation'));
      request.fields.addAll({
        'treatment_final': '$treatment_final',
        'handling': '$handling',
        'services': '$services',
        'final_evaluate': '$final_evaluate'
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      emit(false);
      var responsebody = await http.Response.fromStream(response);
      var data = json.decode(responsebody.body);
      print(data);
      if (response.statusCode == 200||response.statusCode == 201) {
        print(await response.stream.bytesToString());

        return true;
      } else {
        print(response.reasonPhrase);
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
