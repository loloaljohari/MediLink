import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Not valid user name";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Not valid email";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Not valid phone";
    }
  }

  if (val.isEmpty) {
    return " cant be Empty ";
  }

  if (val.length < min) {
    return " cant be less than $min";
  }

  if (val.length > max) {
    return " cant be larger than $max";
  }
}
