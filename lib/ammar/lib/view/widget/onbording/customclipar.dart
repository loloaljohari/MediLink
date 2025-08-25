
import 'package:MediLink/ammar/lib/controller/onbording_controler.dart';
import 'package:MediLink/ammar/lib/core/constant/color.dart';
import 'package:MediLink/ammar/lib/data/data%20source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../lojain/Controllers/onboarding/SelectionLang.dart';
import '../../../core/constant/imageasset.dart';
import '../../../data/model/onbordingmodel.dart';

class Slidercustomonbording extends GetView<OnbordingcontrolerImp> {
  const Slidercustomonbording({super.key});

  @override
  Widget build(BuildContext context) {
    List<OnBordingModel> onBordinglist = [
  OnBordingModel(
      title:context.watch<Selection>().state == 1
                                    ? 'مرحبًا بك في عيادتك':   " Welcome to Your Clinic",
      body:
         context.watch<Selection>().state == 1 ? 'مواعيدك، سجلات صحتك، وتاريخك الطبي كلها في مكان واحد. بسيطة، خاصة، ومتاحة دائمًا.': "Your appointments, health records, and medical\n history all in one place. Simple, private, and\n always accessible",
      image: AppImageAsset.onebordingImageone),
  OnBordingModel(
      title: context.watch<Selection>().state == 1?' احجز في ثواني': "Book in Seconds ",
      body:
       context.watch<Selection>().state == 1?'تصفح الأوقات المتاحة واحجز على الفور دون مكالمات، دون طوابير. احصل على تذكيرات ودية قبل زيارتك.':   " Browse available times and book instantly no calls\n, no queues. Get friendly reminders before\n your visit.",
      image: AppImageAsset.onebordingImagetow),
  OnBordingModel(
      title: context.watch<Selection>().state == 1?' احجز في ثواني': "Book in Seconds",
      body:
       context.watch<Selection>().state == 1?'تصفح الأوقات المتاحة واحجز على الفور دون مكالمات، دون طوابير. احصل على تذكيرات ودية قبل زيارتك.':   " Browse available times and book instantly no calls\n, no queues. Get friendly reminders before\n your visit.",
      image: AppImageAsset.onebordingImagethre),
//
];
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onpagechanged(val);
      },
      itemCount: onBordinglist.length,
      itemBuilder: (context, i) => Column(children: [
        Container(
          padding: EdgeInsets.only(top: 30),
        ),
        const SizedBox(
          height: 40,
        ),
        Image.asset(
          onBordinglist[i].image!,
          width: 356,
          height: 351,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          onBordinglist[i].title!,
          style: const TextStyle(

              fontWeight: FontWeight.bold,
              fontFamily: "PlayfairDisplay",
             ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            onBordinglist[i].body!,
            textAlign: TextAlign.center,
            style: TextStyle(height: 2, fontSize: 16),
          ),
        )
      ]),
    );
  }
}
