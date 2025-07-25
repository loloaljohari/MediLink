

import 'package:MediLink/ammar/lib/controller/aouth/login.dart';
import 'package:MediLink/ammar/lib/core/class/statusrequest.dart';
import 'package:MediLink/ammar/lib/core/constant/color.dart';
import 'package:MediLink/ammar/lib/core/constant/imageasset.dart';
import 'package:MediLink/ammar/lib/core/functions/alertexitapp.dart';
import 'package:MediLink/ammar/lib/core/functions/validinput.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/login/Photologin.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/login/coustomformfild.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/login/coustomtitleaouth.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/login/custombody.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/login/custombuttion.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/login/customtextandicon%20copy.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/login/customtextsininandsinup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class login extends StatelessWidget {
final  BuildContext context1;
  const login({super.key, required this.context1});

  @override
  Widget build(BuildContext context) {
    //final LogincontrollerImp controller = Get.put(LogincontrollerImp());
    Get.lazyPut(() => LogincontrollerImp(), fenix: true);

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LogincontrollerImp>(
          builder: (controller) => controller.statusrequest ==
                  Statusrequest.loding
              ? Center(child: Lottie.asset(AppImageAsset.loding))
              : controller.statusrequest == Statusrequest.serverExecption
                  ? Center(child: Lottie.asset(AppImageAsset.serverfailur))
                  : Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Form(
                        key: controller.formstate,
                        //key: formKey,

                        child: ListView(
                          children: [
                            const SizedBox(height: 20),
                            const SizedBox(
                              width: 350,
                              height: 250,
                              child: Photologin(),
                            ),
                            const SizedBox(height: 40),
                            Coustomtitleaouth(text: "Log In"),
                            const SizedBox(height: 10),
                            const Costombody(
                                photo1: AppImageAsset.Welcome_back),
                            const SizedBox(height: 40),
                            const customtextandphotologin(
                              text: " your email  ",
                              photo1: AppImageAsset.Message_light,
                            ),
                            const SizedBox(height: 10),
                            Customforfild(
                              valid: (val) => validInput(val!, 5, 100, "email"),
                              mycontrller: controller.email,
                              hintText: "Enter your email",
                              iconData: Icons.email_outlined,
                              leabeltext: "Email",
                              isnumber: false,
                            ),
                            const SizedBox(height: 10),
                            const customtextandphotologin(
                              text: "  password  ",
                              photo1: AppImageAsset.Chield_check_duotone_line_1,
                            ),
                            const SizedBox(height: 10),
                            GetBuilder<LogincontrollerImp>(
                              builder: (_) => Customforfild(
                                obscureText: controller.isshowpassword,
                                onTapicon: controller.showpassword,
                                valid: (val) =>
                                    validInput(val!, 5, 30, "password"),
                                mycontrller: controller.password,
                                hintText: "Enter your password",
                                iconData: controller.isshowpassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                leabeltext: "password",
                                isnumber: true,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Custombuttion(
                                photo: AppImageAsset.login_icon,
                                text: "Log in",
                                onPressed: () {
                                  controller.login(context1);
                                }),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.help_outline,
                                    size: 18, color: AppColor.lightblue),
                                const SizedBox(width: 5),
                                InkWell(
                                  child: const Text(
                                    "forget your Password ?",
                                    style: TextStyle(
                                      color: AppColor.lightblue,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColor.lightblue,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  onTap: () {
                                    controller.gotofrgetpassword();
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.help_outline,
                                    size: 18, color: AppColor.lightblue),
                                const SizedBox(width: 5),
                                Customtextsininandsinup(
                                  textone: "if you already have an account? ",
                                  texttow: "Sign up",
                                  onTap: controller.gotosinup,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
        ),
      ),
    );
  }
}
