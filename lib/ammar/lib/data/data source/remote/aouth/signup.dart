

import 'package:MediLink/ammar/lib/core/class/crud.dart';
import 'package:MediLink/ammar/lib/link_api.dart';
class Sinupdata {
  Crud crud;

  Sinupdata(this.crud);

  postData(String name, String email, String phone, String password,
      String password_confirmation) async {
    var response = await crud.PostData(Applink.sinup, {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "password_confirmation": password_confirmation,
    });

    return response.fold((l) => l, (r) => r);
  }
}
