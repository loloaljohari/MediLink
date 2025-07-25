
import 'package:MediLink/ammar/lib/controller/onbording_controler.dart';
import 'package:MediLink/ammar/lib/core/constant/color.dart';
import 'package:MediLink/ammar/lib/data/data%20source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Slidercustomonbording extends GetView<OnbordingcontrolerImp> {
  const Slidercustomonbording({super.key});

  @override
  Widget build(BuildContext context) {
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
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "PlayfairDisplay",
              color: AppColor.dark),
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
            style: TextStyle(height: 2, color: AppColor.dark, fontSize: 16),
          ),
        )
      ]),
    );
  }
}
