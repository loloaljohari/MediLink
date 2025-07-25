
import 'package:MediLink/ammar/lib/controller/aouth/sucssful.dart';
import 'package:MediLink/ammar/lib/core/constant/color.dart';
import 'package:MediLink/ammar/lib/core/constant/imageasset.dart';
import 'package:MediLink/ammar/lib/view/screen/aouth/login.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/forgetpaasword.dart/custombuttion.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/sinup/coustomtitleaouth%20copy.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/sinup/photosucssful.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sucssfolsinup extends StatelessWidget {
final  BuildContext context1;
   Sucssfolsinup({super.key, required this.context1});

  @override
  Widget build(BuildContext context) {
    // تسجيل الـ controller مرة واحدة عند بداية الصفحة
    Get.put(SussfulcontrollerImp());

    return GetBuilder<SussfulcontrollerImp>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.backgroundColor,
          appBar: AppBar(
            backgroundColor: AppColor.backgroundColor,
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {
                controller.back1();
              },
              icon: Icon(Icons.arrow_back_ios, color: AppColor.lightblue),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                const SizedBox(height: 70),
                const Coustomtitlesucssful(
                  text: "Successfully",
                  text1: "your code has been success",
                ),
                const SizedBox(height: 40),
                Photosucssful(),
                const SizedBox(height: 60),
                Custombuttionforgetpasssword(
                    text: "Continue",
                    photo: AppImageAsset.sucssful_icon,
                    onPressed: () {
                      Get.offAll(login(context1:context1 ));
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
