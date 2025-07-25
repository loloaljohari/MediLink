import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PostpublicState extends Cubit<bool> {
  PostpublicState() : super(false);
  Future<bool> update(
      var weight,
      var height,
      var date_birth,
      var gender,
      var blood_type,
      var matital_status,
      var smoker,
      var alcohol,
      var drug) async {
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
          'POST', Uri.parse('$url/patient-record/profile'));
      request.fields.addAll({
        'weight': weight,
        'height': height,
        'date_birth': date_birth,
        'blood_type': blood_type,
        'gender': gender,
        'matital_status': matital_status,
        'smoker': smoker ? '1' : '0',
        'alcohol': alcohol ? '1' : '0',
        'drug': drug ? '1' : '0'
      });
      
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
        var responsebody=await http.Response.fromStream(response);

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
      return false;
    }
  }
}


// {
//     "message": "Unauthenticated."
// }