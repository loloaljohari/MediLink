
import 'package:MediLink/ammar/lib/controller/onbording_controler.dart';
import 'package:MediLink/ammar/lib/core/constant/color.dart';
import 'package:MediLink/ammar/lib/core/constant/routes.dart';
import 'package:MediLink/ammar/lib/view/widget/onbording/OnboardingProgressPainter.dart';
import 'package:MediLink/ammar/lib/view/widget/onbording/custombottom.dart';
import 'package:MediLink/ammar/lib/view/widget/onbording/customclipar.dart';
import 'package:MediLink/ammar/lib/view/widget/onbording/dotcontrolere.dart';
import 'package:MediLink/lojain/View/Home/HomePages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../lojain/Controllers/onboarding/SelectionLang.dart';

class onBording extends StatelessWidget {
  const onBording({super.key});

  @override
  Widget build(BuildContext context) {
    //  Get.put(OnbordingcontrolerImp());

    Get.put(OnbordingcontrolerImp());

    return Scaffold(

        body: SafeArea(
          child: Stack(
            children: [
            const  Column(children: [
                Expanded(
                  flex: 4,
                  child: Slidercustomonbording(),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Dotcontroleronpording(),
                      Custombuttenonbording(),
                    ],
                  ),
                ),
              ]),
              Positioned(
                top: 10,
                left: 10,
                child: GetBuilder<OnbordingcontrolerImp>(
                  builder: (controller) {
                    int current = controller.currenpage + 1;

                    return SizedBox(
                      width: 50,
                      height: 50,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // دائرة مخصصة
                          CustomPaint(
                            size: const Size(40, 40),
                            painter: OnboardingProgressPainter(
                              currentSection: current,
                              activeColor: AppColor.lightblue,
                              inactiveColor: Colors.grey.shade300,
                            ),
                          ),

                          // الرقم داخل الدائرة ومرفوع قليلاً
                          Transform.translate(
                            offset: const Offset(0, 0),
                            child: Text(
                              '$current/3',
                              style: const TextStyle(
                                // fontWeight: FontWeight.bold,

                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                  top: 10,
                  right: 5,
                  child: MaterialButton(
                    onPressed: () async{
                     SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
                     sharedPreferences.setBool('firstopen', false);
                      Get.offAll(HomePages());
                    },
                    child: Text(
                   context.watch<Selection>().state == 1
                                    ? 'تخطي':    "Skip",
                      style: TextStyle(color: AppColor.lightblue),
                    ),
                  ))
            ],
          ),
        ));
  }
}
