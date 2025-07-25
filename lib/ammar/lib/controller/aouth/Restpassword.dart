
import 'package:MediLink/ammar/lib/core/class/statusrequest.dart';
import 'package:MediLink/ammar/lib/data/data%20source/remote/aouth/forgetpassword/rest_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class Restpasswordcontroller extends GetxController {
  login();
  back1();
  gotoSucsseful_Restpassword();
}

class RestpasswordcontrollerImp extends Restpasswordcontroller {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController password;
  late TextEditingController password_confirmation;
  late String email;

  Statusrequest? statusrequest;
  Rest_Password_data rest_password_data = Rest_Password_data(Get.find());

  bool isshowpassword = true;

  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;

    update();
  }

  @override
  login() {}

  @override
  void onInit() {
    password_confirmation = TextEditingController();
    password = TextEditingController();

    email = Get.arguments?['email'] ?? "";
    super.onInit();
  }

  @override
  void dispose() {
    password_confirmation.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  gotoSucsseful_Restpassword() async {
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.loding;
      update();

      var response = await rest_password_data.postData(
        email,
        password.text,
        password_confirmation.text,
      );

      print("RESET PASSWORD RESPONSE: $response");

      if (response is Statusrequest) {
        // فشل الاتصال أو مشكلة سيرفر
        statusrequest = response;
      } else if (response is Map) {
        // السيرفر رد بـ JSON
        if (response.containsKey('errors')) {
          // يوجد خطأ في البيانات مثل عدم تطابق كلمة المرور
          String errorMessage = response['message'] ?? "حدث خطأ غير معروف";
          Get.defaultDialog(
            title: "خطأ",
            middleText: errorMessage,
          );
          statusrequest = Statusrequest.failure;
        } else {
          // تحقق مما إذا كانت الرسالة تعني فشل في الرمز
          String message = response['message'] ?? "";

          if (message.contains("رمز التحقق غير صحيح") ||
              message.contains("منتهي الصلاحية") ||
              message.contains("invalid code")) {
            Get.defaultDialog(
              title: "تنبيه",
              middleText: message,
            );
            statusrequest = Statusrequest.failure;
          } else if (message.contains("تم إعادة تعيين كلمة المرور بنجاح") ||
              message.contains("Your password has been reset successfully")) {
            statusrequest = Statusrequest.success;
            Get.offNamed(Approut.Sucsseful_Restpassword); // ✅ هنا يتم التنقل
          } else {
            // أي رسالة أخرى غير متوقعة
            Get.defaultDialog(
              title: "ملاحظة",
              middleText: message,
            );
            statusrequest = Statusrequest.failure;
          }
        }
      }

      update();
    }
  }

  @override
  back1() {
    Get.toNamed(Approut.verifcode);
  }
}
