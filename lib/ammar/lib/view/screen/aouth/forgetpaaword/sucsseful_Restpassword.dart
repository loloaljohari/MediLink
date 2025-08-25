
import 'package:MediLink/ammar/lib/controller/aouth/sucssful.dart';
import 'package:MediLink/ammar/lib/core/constant/color.dart';
import 'package:MediLink/ammar/lib/core/constant/imageasset.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/forgetpaasword.dart/custombuttion.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/sinup/coustomtitleaouth%20copy.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/sinup/photosucssful.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../../lojain/Controllers/onboarding/SelectionLang.dart';

class Sucssfolrestpassword extends StatelessWidget {
  const Sucssfolrestpassword({super.key});

  @override
  Widget build(BuildContext context) {
    // تسجيل الـ controller مرة واحدة عند بداية الصفحة
    Get.put(SussfulcontrollerImp());

    return GetBuilder<SussfulcontrollerImp>(
      builder: (controller) {
        return Scaffold(
          // backgroundColor: AppColor.backgroundColor,
          appBar: AppBar(
            // backgroundColor: AppColor.backgroundColor,
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
                 Coustomtitlesucssful(
                  text: context.watch<Selection>().state == 1?'بنجاح':"Successfully",
                  text1:context.watch<Selection>().state == 1?'لقد نجح رمزك': "your code has been success",
                ),
                const SizedBox(height: 40),
                Photosucssful(),
                const SizedBox(height: 60),
                Custombuttionforgetpasssword(
                    text: context.watch<Selection>().state == 1?'تعيين كلمة مرور ':"Reset Password",
                    photo: AppImageAsset.sucssful_icon,
                    onPressed: () {
                      controller.gotologin();
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
