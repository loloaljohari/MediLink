
import 'package:MediLink/ammar/lib/core/class/statusrequest.dart';
import 'package:MediLink/ammar/lib/core/constant/routes.dart';
import 'package:MediLink/ammar/lib/data/data%20source/remote/aouth/signup.dart';
import 'package:MediLink/ammar/lib/view/screen/aouth/verfaicodesinup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Sinupcontroller extends GetxController {
  gotoverfaicode(BuildContext context);
  gotologin();
}

class SinupcontrollerImp extends Sinupcontroller {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController password_confirmation;
  late TextEditingController name;
  late TextEditingController phone;

  Statusrequest? statusrequest;

  bool isshowpassword = true;

  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;

    update();
  }

  @override
  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    password_confirmation = TextEditingController();
    name = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    password_confirmation.dispose();
    phone.dispose();
    name.dispose();
    super.dispose();
  }

  Sinupdata sinupData = Sinupdata(Get.find());

  List data = [];


  @override
  gotoverfaicode(BuildContext context) async {
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.loding;
      update();

      var response = await sinupData.postData(
        name.text,
        email.text,
        phone.text,
        password.text,
        password_confirmation.text,
      );

      print("SIGNUP RESPONSE: $response");

      if (response is Statusrequest) {
        // فشل الاتصال أو مشكلة سيرفر
        statusrequest = response;
      } else if (response is Map) {
        // السيرفر رد بـ JSON

        if (response.containsKey('errors')) {
          Get.defaultDialog(
            title: "تحذير",
            middleText: response['message'] ?? "Email or PHNE Not Correct",
          );

          statusrequest = Statusrequest.failure;
        } else {
          // نجاح التسجيل
          statusrequest = Statusrequest.success;

          Get.off(
            Verfaicodesinup(context1: context,),
            arguments: {"email": email.text},
          );
        }
      }

      update();
    }
  }

  @override
  gotologin() {
    Get.offNamed(Approut.login);
    Get.delete<SinupcontrollerImp>();
  }
}
