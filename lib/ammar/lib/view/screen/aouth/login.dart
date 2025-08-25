

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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../lojain/Controllers/onboarding/SelectionLang.dart';

class login extends StatelessWidget {
  // BuildContext context1;
   login({super.key,  });

  @override
  Widget build(BuildContext context) {
    //final LogincontrollerImp controller = Get.put(LogincontrollerImp());
    Get.lazyPut(() => LogincontrollerImp(), fenix: true);

    return  Scaffold(
        // backgroundColor: AppColor.backgroundColor,
        body: GetBuilder<LogincontrollerImp>(
            builder: (controller) => controller.statusrequest ==
                    Statusrequest.loding
                ? Center(child: Lottie.asset(AppImageAsset.loding))
                : controller.statusrequest == Statusrequest.serverExecption
                    ? Center(child: Lottie.asset(AppImageAsset.serverfailur))
                    : Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
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
                              Coustomtitleaouth(text: context.watch<Selection>().state == 1?'سجل دخول': "Log In"),
                              const SizedBox(height: 10),
                              const Costombody(
                                  photo1: AppImageAsset.Welcome_back),
                              const SizedBox(height: 40),
                              customtextandphotologin(
                                text: context.watch<Selection>().state == 1?'أيميلك': " your email  ",
                                photo1: AppImageAsset.Message_light,
                              ),
                              const SizedBox(height: 10),
                              Customforfild(
                                valid: (val) => validInput(val!, 5, 100,  "email"),
                                mycontrller: controller.email,
                                hintText:context.watch<Selection>().state == 1?'ادخل ايميلك': "Enter your email",
                                iconData: Icons.email_outlined,
                                leabeltext: context.watch<Selection>().state == 1?'الأيميل': "Email",
                                isnumber: false,
                              ),
                              const SizedBox(height: 10),
                               customtextandphotologin(
                                text: context.watch<Selection>().state == 1?'كلمة المرور':"  password  ",
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
                                  hintText:  context.watch<Selection>().state == 1? ' ادخل كلمة المرور ':"Enter your password",
                                  iconData: controller.isshowpassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  leabeltext: context.watch<Selection>().state == 1?'كلمة المرور': "password",
                                  isnumber: false,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Custombuttion(
                                  photo: AppImageAsset.login_icon,
                                  text:context.watch<Selection>().state == 1?'تسجيل دخول': "Log in",
                                  onPressed: () {
                                    controller.login();
                                  }),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.help_outline,
                                      size: 18, color: AppColor.lightblue),
                                  const SizedBox(width: 5),
                                  InkWell(
                                    child:  Text(
                                   context.watch<Selection>().state == 1?'نسيت كلمة مرورك؟':   "forget your Password ?",
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
                                    textone:  context.watch<Selection>().state == 1?'إذا كان ليس لديك حساب ؟':"if you do not have an account? ",
                                    texttow: context.watch<Selection>().state == 1?'اشترك':"Sign up",
                                    onTap: controller.gotosinup,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
          ),
        
      );
  }
}
