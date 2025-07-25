

import 'package:MediLink/ammar/lib/core/class/crud.dart';
import 'package:MediLink/ammar/lib/link_api.dart';

class Chiek_Email_data {
  Crud crud;

  Chiek_Email_data(this.crud);

  postData(String email) async {
    var response = await crud.PostData(Applink.chiek_email, {
      "email": email,
    });

    return response.fold((l) => l, (r) => r);
  }
}
