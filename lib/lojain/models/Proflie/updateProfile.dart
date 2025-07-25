import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UpdateprofileCubit extends Cubit<bool> {
  UpdateprofileCubit():super(false);

  
  Future<bool> update(var name, var phone, var photo,var email) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');

      String Authorization = 'Bearer $token';
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Accept-Language': 'ar',
        'Authorization':
            '$Authorization',
        'Cookie':
            'syrian_clinic_session=3XzjaNux0m39927nEtzdLhuwpd3Jwn4pXGUDOvOX'
      };
      emit(true);
      var request = await http.MultipartRequest(
          'POST', Uri.parse('$url/profile'));
      request.fields.addAll(
          {if (name != null) 'name': name, if (phone != null) 'phone': phone  ,if (email != null) 'email': email  });
      if (photo != null) {
        request.files.add(await http.MultipartFile.fromPath('photo',
           photo));
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
       emit(false);
      if (response.statusCode == 200) {
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