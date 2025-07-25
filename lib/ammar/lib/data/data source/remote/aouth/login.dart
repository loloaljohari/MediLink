import 'package:MediLink/ammar/lib/core/class/crud.dart';
import 'package:MediLink/ammar/lib/link_api.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logindata {
  Crud crud;

  Logindata(this.crud);

  postData(String email, String password) async {
    var response = await crud.PostData(Applink.login, {
      "email": email,
      "password": password,
    });
  
    return response.fold((l) => l, (r) => r);
  }
}
