
import 'package:MediLink/ammar/lib/controller/onbording_controler.dart';
import 'package:MediLink/ammar/lib/core/constant/color.dart';
import 'package:MediLink/ammar/lib/data/data%20source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../lojain/Controllers/onboarding/SelectionLang.dart';
import '../../../core/constant/imageasset.dart';
import '../../../data/model/onbordingmodel.dart';

class Dotcontroleronpording extends StatelessWidget {
  const Dotcontroleronpording({super.key});

  @override
  Widget build(BuildContext context) {
     List<OnBordingModel> onBordinglist = [
  OnBordingModel(
      title:context.read<Selection>().state == 1
                                    ? 'مرحبًا بك في عيادتك':   " Welcome to Your Clinic",
      body:
         context.read<Selection>().state == 1 ? 'مواعيدك، سجلات صحتك، وتاريخك الطبي كلها في مكان واحد. بسيطة، خاصة، ومتاحة دائمًا.': "Your appointments, health records, and medical\n history all in one place. Simple, private, and\n always accessible",
      image: AppImageAsset.onebordingImageone),
  OnBordingModel(
      title: context.read<Selection>().state == 1?' احجز في ثواني': "Book in Seconds ",
      body:
       context.read<Selection>().state == 1?'تصفح الأوقات المتاحة واحجز على الفور دون مكالمات، دون طوابير. احصل على تذكيرات ودية قبل زيارتك.':   " Browse available times and book instantly no calls\n, no queues. Get friendly reminders before\n your visit.",
      image: AppImageAsset.onebordingImagetow),
  OnBordingModel(
      title: context.read<Selection>().state == 1?' احجز في ثواني': "Book in Seconds",
      body:
       context.read<Selection>().state == 1?'تصفح الأوقات المتاحة واحجز على الفور دون مكالمات، دون طوابير. احصل على تذكيرات ودية قبل زيارتك.':   " Browse available times and book instantly no calls\n, no queues. Get friendly reminders before\n your visit.",
      image: AppImageAsset.onebordingImagethre),
//
];
    return GetBuilder<OnbordingcontrolerImp>(
        builder: (controller) =>
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ...List.generate(
                  onBordinglist.length,
                  (index) => AnimatedContainer(
                        margin: const EdgeInsets.only(right: 20),
                        duration: const Duration(milliseconds: 900),
                        width: 5,
                        height: controller.currenpage == index ? 20 : 15,
                        decoration: BoxDecoration(
                          color: controller.currenpage == index
                              ? AppColor.lightblue // اللون النشط
                              : AppColor.lightgrey, // اللون الغير نشط
                          borderRadius: BorderRadius.circular(5),
                        ),
                      )),
            ]));
  }
}
