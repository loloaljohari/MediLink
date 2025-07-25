
import 'package:MediLink/ammar/lib/controller/onbording_controler.dart';
import 'package:MediLink/ammar/lib/core/constant/color.dart';
import 'package:MediLink/ammar/lib/data/data%20source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dotcontroleronpording extends StatelessWidget {
  const Dotcontroleronpording({super.key});

  @override
  Widget build(BuildContext context) {
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
