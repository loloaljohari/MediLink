
import 'package:MediLink/ammar/lib/core/constant/routes.dart';
import 'package:MediLink/ammar/lib/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mymiddleware extends GetMiddleware {
  int? get priority => 1;

  Myservices myservices = Get.find();

  @override
  // ignore: body_might_complete_normally_nullable
  RouteSettings? redirect(String? route) {
    if (myservices.sharedPreferences.getString("onbording") == "1") {
      return const RouteSettings(name: Approut.login);
    }
  }
}
