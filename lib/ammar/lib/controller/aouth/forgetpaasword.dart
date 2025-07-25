
import 'package:MediLink/ammar/lib/core/class/statusrequest.dart';
import 'package:MediLink/ammar/lib/core/constant/routes.dart';
import 'package:MediLink/ammar/lib/data/data%20source/remote/aouth/forgetpassword/chiek_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Forgetpasswordcontrolar extends GetxController {
  chieck();
  gotoverifcode();
  back1();
}

class ForgetpasswordcontrolarImp extends Forgetpasswordcontrolar {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;

  Statusrequest? statusrequest;

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }

  @override
  chieck() {}

  Chiek_Email_data chiek_email_data = Chiek_Email_data(Get.find());

  @override
  gotoverifcode() async {
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.loding;
      update();

      var response = await chiek_email_data.postData(email.text);

      print("SIGNUP RESPONSE: $response");

      if (response is Statusrequest) {
        // فشل الاتصال أو مشكلة سيرفر
        statusrequest = response;
      } else if (response is Map) {
        // السيرفر رد بـ JSON

        if (response.containsKey('errors')) {
          Get.defaultDialog(
            title: "تحذير",
            middleText: response['message'] ?? "Email Not Correct",
          );

          statusrequest = Statusrequest.failure;
        } else {
          // نجاح التسجيل
          statusrequest = Statusrequest.success;

          Get.offNamed(
            Approut.verifcode,
            arguments: {"email": email.text},
          );
        }
      }

      update();
    }
  }

  @override
  back1() {
    Get.offAllNamed(Approut.login);
  }
}
