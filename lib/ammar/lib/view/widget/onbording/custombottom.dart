
import 'package:MediLink/ammar/lib/controller/onbording_controler.dart';
import 'package:MediLink/ammar/lib/core/constant/color.dart';
import 'package:MediLink/lojain/Controllers/onboarding/SelectionLang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Custombuttenonbording extends GetView<OnbordingcontrolerImp> {
  const Custombuttenonbording({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.lightblue, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: IconButton(
            padding: const EdgeInsets.all(10),
            onPressed: () {
              controller.back();
            },
            icon: const Icon(Icons.arrow_back_ios_rounded),
            color: AppColor.lightblue,
          ),
        ),
        MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: () {
            controller.next();
          },
          child: Text(
           context.watch<Selection>().state == 1?'التالي<<': "Next >>",
            style: TextStyle(
         
                fontFamily: "PlayfairDisplay",
                fontSize: 25),
          ),
          color: AppColor.lightblue,
        ),
      ]),
    );
  }
}
