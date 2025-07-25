import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Postillness extends Cubit<bool> {
  Postillness() : super(false);
  Future<bool> post(
      {required var d_type,
      required var d_name,
      required var d_diagnosis_date,
      required var d_doctor,
      required var d_advice,
      required var d_prohibition}) async {
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
          'POST', Uri.parse('$url/patient-record/diseases'));
      request.fields.addAll({
        'd_type': d_type,
        'd_name': d_name,
        'd_diagnosis_date': d_diagnosis_date,
        'd_doctor': d_doctor,
        'd_advice': d_advice,
        'd_prohibitions': d_prohibition
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responsebody = await http.Response.fromStream(response);

      emit(false);
      if (response.statusCode == 201) {
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