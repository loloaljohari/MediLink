

import 'package:MediLink/ammar/lib/core/class/statusrequest.dart';

handlingData(response) {
  if (response is Statusrequest) {
    return response;
  } else {
    return Statusrequest.success;
  }
}
