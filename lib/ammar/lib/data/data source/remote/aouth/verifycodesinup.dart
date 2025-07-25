

import 'package:MediLink/ammar/lib/core/class/crud.dart';
import 'package:MediLink/ammar/lib/link_api.dart';
class VerfaicodesinupData {
  Crud crud;

  VerfaicodesinupData(this.crud);

  postData(String email, String otp) async {
    var response = await crud.PostData(Applink.verfaicodesinup, {
      "email": email,
      "otp": otp,
    });

    return response.fold((l) => l, (r) => r);
  }
}
