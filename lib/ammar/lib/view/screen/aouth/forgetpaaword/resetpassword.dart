
import 'package:MediLink/ammar/lib/controller/aouth/Restpassword.dart';
import 'package:MediLink/ammar/lib/core/class/statusrequest.dart';
import 'package:MediLink/ammar/lib/core/constant/color.dart';
import 'package:MediLink/ammar/lib/core/constant/imageasset.dart';
import 'package:MediLink/ammar/lib/core/functions/alertexitapp.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/forgetpaasword.dart/custombuttion.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/sinup/coustomformfild.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/sinup/customtextandicon.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/verfaicode.dart/coustomtitleaouth%20copy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/functions/validinput.dart';

class Restpassword extends StatelessWidget {
  const Restpassword({super.key});

  @override
  Widget build(BuildContext context) {
    RestpasswordcontrollerImp controlle = Get.put(RestpasswordcontrollerImp());
    return Scaffold(
        // backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          // backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              controlle.back1();
            },
            icon: Icon(Icons.arrow_back_ios, color: AppColor.lightblue),
          ),
        ),
        body: 
        
        
                   
                       // ignore: deprecated_member_use
                       WillPopScope(
  onWillPop: alertExitApp,
  child: GetBuilder<RestpasswordcontrollerImp>(
    builder: (controller) => 
      controller.statusrequest == Statusrequest.loding
        ? Center(child: Lottie.asset(AppImageAsset.loding))
        : controller.statusrequest == Statusrequest.serverExecption
          ? Center(child: Lottie.asset(AppImageAsset.serverfailur))
              
                
               : 
        
        
        
        
        
        
        
        
        
        
        
        
        
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: controlle.formstate,
            child: ListView(children: [
              SizedBox(
                height: 50,
              ),
              Coustomtitleverfaicode(
                  text: "New password",
                  text1: "Set a new password",
                  text2:
                      "Create a new password. Ensure it differs from previous ones for security"),
              const SizedBox(height: 30),
              const customtextandiconsinup(
                  text: "  new password ", icon1: Icons.verified_user_outlined),
              SizedBox(
                height: 10,
              ),
              GetBuilder<RestpasswordcontrollerImp>(
                builder: (controller) => Customforfildsinup(
                  obscureText: controlle.isshowpassword,
                  onTapicon: () {
                    controlle.showpassword();
                  },
                  valid: (val) {
                    return validInput(val!, 5, 30, "password");
                  },
                  mycontrller: controlle.password,
                  hintText: "Enter your password",
                  iconData: controlle.isshowpassword == true
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  leabeltext: "password",
                  isnumber: true,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              const customtextandiconsinup(
                  text: " confirm password  ",
                  icon1: Icons.verified_user_outlined),
              SizedBox(
                height: 10,
              ),
              GetBuilder<RestpasswordcontrollerImp>(
                builder: (controller) => Customforfildsinup(
                  obscureText: controlle.isshowpassword,
                  onTapicon: () {
                    controlle.showpassword();
                  },
                  valid: (val) {
                    return validInput(val!, 5, 30, "password");
                  },
                  mycontrller: controlle.password_confirmation,
                  iconData: controlle.isshowpassword == true
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  isnumber: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Custombuttionforgetpasssword(
                  text: "Reset Password",
                  photo: AppImageAsset.restpassword,
                  onPressed: () {
                    controlle.gotoSucsseful_Restpassword();
                  }),
            ]),
          ),
                        )) ));
  }
}
