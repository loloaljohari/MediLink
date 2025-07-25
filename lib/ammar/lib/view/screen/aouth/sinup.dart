import 'package:MediLink/ammar/lib/controller/aouth/sinup.dart';
import 'package:MediLink/ammar/lib/core/class/statusrequest.dart';
import 'package:MediLink/ammar/lib/core/constant/color.dart';
import 'package:MediLink/ammar/lib/core/constant/imageasset.dart';
import 'package:MediLink/ammar/lib/core/functions/alertexitapp.dart';
import 'package:MediLink/ammar/lib/core/functions/validinput.dart';
import 'package:MediLink/ammar/lib/view/screen/aouth/login.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/login/customtextsininandsinup.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/sinup/coustomformfild.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/sinup/coustomtitleaouth.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/sinup/custombuttion%20_sinup.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/sinup/customtextandicon%20copy.dart';
import 'package:MediLink/lojain/Controllers/doctors/Month.dart';
import 'package:MediLink/lojain/Controllers/onboarding/SelectionLang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Sinup extends StatelessWidget {
  final BuildContext conte;
   Sinup({super.key,  required this.conte });

  @override
  Widget build(BuildContext context) {
    var lang= context.read<Selection>().state==1?'ar':'en';
    // Get.lazyPut(()=> SinupcontrollerImp());
    SinupcontrollerImp controlle = Get.put(SinupcontrollerImp());
    return Directionality(
      textDirection:    lang== 'ar' ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
          backgroundColor: AppColor.backgroundColor,
          body:
      // ignore: deprecated_member_use
              Expanded(
               
                  child: GetBuilder<SinupcontrollerImp>(
                      builder: ((controller) => controlle.statusrequest ==
                              Statusrequest.loding
                          ? Center(child: Lottie.asset(AppImageAsset.loding))
                          : controlle.statusrequest ==
                                  Statusrequest.serverExecption
                              ? Center(
                                  child: Lottie.asset(
                                  AppImageAsset.serverfailur,
                                ))
                              : Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 25),
                                  child: Form(
                                    key: controller.formstate,
                                    child: ListView(children: [
                                      const SizedBox(
                                        height: 60,
                                      ),
                                      Coustomtitleaouthsinup(
                                          text: "Register Now"),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      const customtextandphotosinup(
                                        text: "  User Name  ",
                                        photo1: AppImageAsset.User_alt_light,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Customforfildsinup(
                                        valid: (val) {
                                          return validInput(
                                              val!, 5, 30, "username");
                                        },
                                        mycontrller: controller.name,
                                        hintText: "Enter your user Name",
                                        leabeltext: "User Name",
                                        isnumber: false,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const customtextandphotosinup(
                                        text: "  your email  ",
                                        photo1: AppImageAsset.Message_light,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Customforfildsinup(
                                        valid: (val) {
                                          return validInput(
                                              val!, 5, 100, "email");
                                        },
                                        mycontrller: controller.email,
                                        isnumber: false,
                                      ),
                                      const SizedBox(height: 10),
                                      const customtextandphotosinup(
                                        text: "  number your phone  ",
                                        photo1: AppImageAsset.solar_phone_outline,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Customforfildsinup(
                                        valid: (val) {
                                          return validInput(val!, 5, 30, "phone");
                                        },
                                        mycontrller: controller.phone,
                                        isnumber: true,
                                      ),
                                      const SizedBox(height: 10),
                                      const customtextandphotosinup(
                                        text: "  password  ",
                                        photo1: AppImageAsset
                                            .Chield_check_duotone_line,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      GetBuilder<SinupcontrollerImp>(
                                        builder: (controller) =>
                                            Customforfildsinup(
                                          obscureText: controlle.isshowpassword,
                                          onTapicon: () {
                                            controlle.showpassword();
                                          },
                                          valid: (val) {
                                            return validInput(
                                                val!, 5, 30, "password");
                                          },
                                          mycontrller: controlle.password,
                                          hintText: "Enter your password",
                                          iconData:
                                              controlle.isshowpassword == true
                                                  ? Icons.visibility_off_outlined
                                                  : Icons.visibility_outlined,
                                          leabeltext: "password",
                                          isnumber: true,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const customtextandphotosinup(
                                        text: "  password  ",
                                        photo1: AppImageAsset
                                            .Chield_check_duotone_line,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      GetBuilder<SinupcontrollerImp>(
                                        builder: (controller) =>
                                            Customforfildsinup(
                                          obscureText: controlle.isshowpassword,
                                          onTapicon: () {
                                            controlle.showpassword();
                                          },
                                          valid: (val) {
                                            return validInput(
                                                val!, 5, 30, "password");
                                          },
                                          mycontrller:
                                              controlle.password_confirmation,
                                          iconData:
                                              controlle.isshowpassword == true
                                                  ? Icons.visibility_off_outlined
                                                  : Icons.visibility_outlined,
                                          isnumber: true,
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                      Custombuttion_sinup(
                                          text: "Register",
                                          icon1: Icons.person_add,
                                          onPressed: () {
                                            controller.gotoverfaicode(conte);
                                          }),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.help_outline,
                                              size: 18,
                                              color: AppColor.lightblue,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Customtextsininandsinup(
                                                textone:
                                                    "if you aleady have an account  ",
                                                texttow: "Log in",
                                                onTap: () {
                                                 Get.to(login(context1: conte,));
                                                })
                                          ])
                                    ]),
                                  ),
                                ))))),
    );
  }
}
