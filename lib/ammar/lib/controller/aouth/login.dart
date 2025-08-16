import 'package:MediLink/ammar/lib/core/class/statusrequest.dart';
import 'package:MediLink/ammar/lib/core/constant/routes.dart';
import 'package:MediLink/ammar/lib/core/functions/handlingdata_controler.dart';
import 'package:MediLink/ammar/lib/data/data%20source/remote/aouth/login.dart';
import 'package:MediLink/lojain/View/Home/HomePages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../lojain/View/Home/Changeacount.dart';

abstract class Logincontroller extends GetxController {
  login(BuildContext context);
  gotosinup();
  gotofrgetpassword();
}

class LogincontrollerImp extends Logincontroller {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  Statusrequest? statusrequest;
  bool isshowpassword = true;

  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;

    update();
  }

  Logindata logindata = Logindata(Get.find());

  List data = [];

  @override
  login(BuildContext context) async {
    //var formdata = formKey.currentState;
    var formdata = formstate.currentState;
    if (formdata != null && formdata.validate()) {
      statusrequest = Statusrequest.loding;
      update();

      var response = await logindata.postData(email.text, password.text);
      print("Response: $response");

      statusrequest = handlingData(response);

      if (statusrequest == Statusrequest.success) {
        if (response.containsKey("user") && response.containsKey("token")) {
          // تسجيل دخول ناجح
          // يمكنك تخزين التوكن هنا باستخدام shared_preferences مثلاً
          var token = response['token'];
          print('token: $token');
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setString('token', token);
          print('done');
          // Get.offNamed(Approut.testview, arguments: {
          //   "email": email.text,
          //   "token": response["token"],
          // });

          if (response["created_by_secretary"]) {
            Get.offAll(Changeacount());
          } else
            Get.offAll(HomePages());
        } else if (response.containsKey("message")) {
          String message = response["message"];
          Get.defaultDialog(title: "تنبيه", middleText: message);
          statusrequest = Statusrequest.failure;
        } else {
          Get.defaultDialog(
              title: "خطأ غير متوقع", middleText: "حدث خطأ غير معروف");
          statusrequest = Statusrequest.failure;
        }
      }

      update();
    } else {
      print("Not valid");
    }
  }

  @override
  gotosinup() {
    Get.offNamed(Approut.Sinup);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  gotofrgetpassword() {
    Get.offNamed(Approut.forgetpassword);
  }
}
