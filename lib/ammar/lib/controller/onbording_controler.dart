
import 'package:MediLink/ammar/lib/core/constant/routes.dart';
import 'package:MediLink/ammar/lib/core/services/services.dart';
import 'package:MediLink/ammar/lib/data/data%20source/static/static.dart';
import 'package:MediLink/lojain/View/Home/HomePages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Onbordingcontroler extends GetxController {
  back();
  next();
  onpagechanged(int index);
}

class OnbordingcontrolerImp extends Onbordingcontroler {
  late PageController pageController;
  int currenpage = 0;
  Myservices myservices = Get.find();

  @override
  next() async{
    
    currenpage++;

    if (currenpage > 2) {
      myservices.sharedPreferences.setString("onbording", "1");
       SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
       sharedPreferences.setBool('firstopen', false);
      Get.offAll(HomePages());

      ;
    } else {
      pageController.animateToPage(currenpage,
          duration: const Duration(microseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onpagechanged(int index) {
    currenpage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  back() {
    currenpage--;

    if (currenpage > 4) {
      myservices.sharedPreferences.setString("onbording", "1");
    } else {
      pageController.animateToPage(currenpage,
          duration: const Duration(microseconds: 900), curve: Curves.easeInOut);
    }
  }
}
