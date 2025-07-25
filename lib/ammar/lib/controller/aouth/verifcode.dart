
import 'package:MediLink/ammar/lib/core/class/statusrequest.dart';
import 'package:MediLink/ammar/lib/core/constant/routes.dart';
import 'package:MediLink/ammar/lib/data/data%20source/remote/aouth/forgetpassword/verfaicode.dart';
import 'package:MediLink/ammar/lib/data/data%20source/remote/aouth/resendcode.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../core/functions/handlingdata_controler.dart';

abstract class Verficodecontrolar extends GetxController {
  chieck();
  resendVerificationCode();
  back1();
}

class VerficodecontrolarImp extends Verficodecontrolar {
  Verfaicode_Data verfaicode_data = Verfaicode_Data(Get.find());
  ResendCodeData resendCodeData = ResendCodeData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late String otp;
  late String email;
  Statusrequest? statusrequest;

  @override
  chieck() async {
    if (otp.isEmpty) {
      Get.defaultDialog(
        title: "تنبيه",
        middleText: "يرجى إدخال رمز التحقق قبل المتابعة.",
      );
      return;
    }

    statusrequest = Statusrequest.loding;
    update();

    print("⏳ جاري التحقق من الكود...");

    var response = await verfaicode_data.postData(email, otp);
    print("📨 Response: $response");

    statusrequest = handlingData(response);

    if (statusrequest == Statusrequest.success) {
      final message = response["message"];
      final token = response["token"];

      // ✅ التحقق من نجاح العملية عن طريق التوكن أو الرسالة
      if (token != null ||
          message == "تم التسجيل بنجاح!" ||
          message == "Registration successful!" ||
          message.toString().toLowerCase().contains("success")) {
        Get.snackbar("نجاح", "تم التحقق بنجاح ✅");
        Get.offNamed(Approut.Restpassword);
      } else if (message == "انتهت صلاحية الجلسة، يرجى إعادة المحاولة." ||
          message == "Session expired. Please try again.") {
        Get.defaultDialog(
          title: "انتهت الجلسة",
          middleText: "يرجى إعادة إرسال الكود أو تسجيل الدخول من جديد.",
        );
        statusrequest = Statusrequest.failure;
      } else {
        Get.defaultDialog(
          title: "خطأ",
          middleText: message ?? "حدث خطأ غير متوقع.",
        );
        statusrequest = Statusrequest.failure;
      }
    } else {
      Get.defaultDialog(
        title: "خطأ في الاتصال",
        middleText: "تحقق من الإنترنت أو حاول لاحقًا.",
      );
    }

    update();
  }

  @override
  void onInit() {
    email = Get.arguments?['email'] ?? "";

    super.onInit();
  }

  @override
  back1() {
    Get.offNamed(Approut.forgetpassword);
  }

  @override
  resendVerificationCode() async {
    statusrequest = Statusrequest.loding;
    update();

    var response = await resendCodeData.postData(email);

    statusrequest = handlingData(response);

    if (statusrequest == Statusrequest.success) {
      final messageKey = response["message"]?.toString() ?? "";
      final message = messageKey.tr; // يدعم الترجمة

      // نحط الحالات صراحة
      if (messageKey == "auth.otp_resent" ||
          message.contains("تم إرسال الرمز") ||
          message.toLowerCase().contains("verification code resent")) {
        // نجاح
        Get.snackbar("نجاح", message);
      } else if (messageKey == "auth.wait_before_resend" ||
          message.contains("يرجى الانتظار") ||
          message.toLowerCase().contains("please wait before")) {
        // كثير من المحاولات
        Get.snackbar("تنبيه", message);
      } else {
        // أي حالة ثانية اعتبرها خطأ
        Get.defaultDialog(
          title: "خطأ",
          middleText: message.isNotEmpty ? message : "حدث خطأ غير معروف.",
        );
      }
    } else {
      Get.snackbar("خطأ", "تحقق من اتصالك بالإنترنت.");
    }

    update();
  }
}
