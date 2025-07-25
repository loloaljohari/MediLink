import 'package:MediLink/ammar/lib/controller/aouth/timercontroller.dart';
import 'package:MediLink/ammar/lib/controller/aouth/verifcode.dart';
import 'package:MediLink/ammar/lib/core/class/statusrequest.dart';
import 'package:MediLink/ammar/lib/core/constant/color.dart';
import 'package:MediLink/ammar/lib/core/constant/imageasset.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/forgetpaasword.dart/custombuttion.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/verfaicodesinup.dart/coustomtitleaouth.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/verfaicodesinup.dart/custombody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/functions/alertexitapp.dart';

class verfaicode extends StatelessWidget {
  const verfaicode({super.key});

  @override
  Widget build(BuildContext context) {
    VerficodecontrolarImp controller = Get.put(VerficodecontrolarImp());
    final TimerController timerController = Get.put(TimerController());

    // return GetBuilder<VerficodecontrolarImp>(
    //     init: VerficodecontrolarImp(),
    //     builder: (controller) => controller.statusrequest ==
    //             Statusrequest.loding
    //         ? Center(
    //             child: Text("loding............"),
    //           )
    //  :

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
        body:

            // ignore: deprecated_member_use
            WillPopScope(
                onWillPop: alertExitApp,
                child: GetBuilder<VerficodecontrolarImp>(
                    builder: (controller) => controller.statusrequest ==
                            Statusrequest.loding
                        ? Center(child: Lottie.asset(AppImageAsset.loding))
                        : controller.statusrequest ==
                                Statusrequest.serverExecption
                            ? Center(
                                child: Lottie.asset(AppImageAsset.serverfailur))
                            : Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: ListView(children: [
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  const Coustomtitleaouthverfaicode(
                                      text: "We just send an massege"),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  Costombodyverfaicode(
                                      body:
                                          "Enter the security code ,we send to ",
                                      body1: "${controller.email}"),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  SizedBox(
                                    height: 40,
                                  ),
                                  OtpTextField(
                                    textStyle: TextStyle(
                                      color: AppColor.white_number,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      height: 0.8,
                                    ),
                                    fieldWidth: 50,
                                    fieldHeight: 46,
                                    borderRadius: BorderRadius.circular(12),
                                    numberOfFields: 5,
                                    borderColor: AppColor.lightblue2,
                                    enabledBorderColor: AppColor.lightblue2,
                                    filled: true,
                                    fillColor: AppColor.lightblue2,
                                    showFieldAsBox: true,
                                    focusedBorderColor: AppColor.lightblue2,
                                    cursorColor: AppColor.lightgrey,
                                    clearText: true,
                                    onCodeChanged: (String code) {
                                      controller.otp = code;
                                    },
                                    onSubmit: (String verificationcode) {
                                      controller.otp = verificationcode;
                                    },
                                  ),

                                  SizedBox(
                                    height: 40,
                                  ),
                                  Custombuttionforgetpasssword(
                                    text: "Verify",
                                    photo: AppImageAsset.verfayi,
                                    onPressed: () {
                                      controller.chieck();
                                    },
                                  ),

                                  SizedBox(
                                    height: 30,
                                  ),

// ⏱️ العداد
                                  Obx(() {
                                    final int seconds =
                                        timerController.seconds.value;
                                    final String formattedTime =
                                        "${(seconds ~/ 60).toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, '0')}";

                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Didn’t receive code ?",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        GestureDetector(
                                          onTap: seconds == 0
                                              ? () {
                                                  timerController.resetTimer();
                                                  controller
                                                      .resendVerificationCode();
                                                  // TODO: Call your resend code logic here
                                                }
                                              : null,
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "Resend code",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: seconds == 0
                                                        ? Colors.blue
                                                        : Colors
                                                            .grey, // Active or disabled
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: "  -  $formattedTime",
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  })
                                ]),
                              ))));
  }
}
