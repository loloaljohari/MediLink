import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Postmedicine extends Cubit<bool> {
  Postmedicine() : super(false);
  Future<bool> post({
    required var med_type,
    required var med_name,
    required var med_start_date,
    required var med_end_date,
    required var med_frequency,
    required var med_dosage_form,
    required var med_dose,
    required var med_prescribed_by_doctor,
    required var med_timing,
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
          'POST', Uri.parse('$url/patient-record/medications'));
      request.fields.addAll({
        'med_type': med_type,
        'med_name': med_name,
        'med_start_date': med_start_date,
        'med_end_date': med_end_date,
        'med_frequency': med_frequency,
        'med_dosage_form': med_dosage_form,
        'med_dose': med_dose,
        'med_prescribed_by_doctor': med_prescribed_by_doctor,
        'med_timing': med_timing
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responsebody = await http.Response.fromStream(response);

      emit(false);
      if (response.statusCode == 201||response.statusCode == 200) {
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