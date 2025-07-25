

import 'package:MediLink/ammar/lib/core/class/crud.dart';
import 'package:MediLink/ammar/lib/link_api.dart';
class ResendCodeData {
  Crud crud;
  ResendCodeData(this.crud);

  Future postData(String email) async {
    var response = await crud.PostData(Applink.resendCode, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
