


import 'package:MediLink/ammar/lib/core/class/crud.dart';
import 'package:MediLink/ammar/lib/link_api.dart';
class Rest_Password_data {
  Crud crud;

  Rest_Password_data(this.crud);

  postData(String email, String password, String password_confirmation) async {
    var response = await crud.PostData(Applink.rest_pasword, {
      "email": email,
      "password": password,
      "password_confirmation": password_confirmation,
    });

    return response.fold((l) => l, (r) => r);
  }
}
