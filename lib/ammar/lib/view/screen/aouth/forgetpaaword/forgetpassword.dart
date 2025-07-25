

import 'package:MediLink/ammar/lib/controller/aouth/forgetpaasword.dart';
import 'package:MediLink/ammar/lib/core/class/statusrequest.dart';
import 'package:MediLink/ammar/lib/core/constant/color.dart';
import 'package:MediLink/ammar/lib/core/constant/imageasset.dart';
import 'package:MediLink/ammar/lib/core/functions/alertexitapp.dart';
import 'package:MediLink/ammar/lib/core/functions/validinput.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/forgetpaasword.dart/Photologin.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/forgetpaasword.dart/coustomtitleaouth%20copy.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/forgetpaasword.dart/custombuttion.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/login/coustomformfild.dart';
import 'package:MediLink/ammar/lib/view/widget/aouth/sinup/customtextandicon%20copy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Forgetpassword extends StatelessWidget {
 const  Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetpasswordcontrolarImp controlle =
        Get.put(ForgetpasswordcontrolarImp());
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
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
  child: GetBuilder<ForgetpasswordcontrolarImp>(
    builder: (controller) => 
      controller.statusrequest == Statusrequest.loding
        ? Center(child: Lottie.asset(AppImageAsset.loding))
        : controller.statusrequest == Statusrequest.serverExecption
          ? Center(child: Lottie.asset(AppImageAsset.serverfailur))
              
                
               : 
        
        
        
        
        
        
        
        
        
      
        
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: controlle.formstate,
            child: ListView(children: [
              ///////////////////////////
              Photoforgetpasssword(),

              const SizedBox(
                height: 20,
              ),
              Coustomtitleforgetpassword(
                  text: "Forgot password",
                  text1: "Please enter your email to reset the password"),
              const SizedBox(
                height: 20,
              ),
              const customtextandphotosinup(
                text: "  your email  ",
                photo1: AppImageAsset.Message_light,
              ),
              SizedBox(
                height: 10,
              ),

              Customforfild(
                valid: (val) {
                  return validInput(val!, 5, 30, "email");
                },
                mycontrller: controlle.email,

                hintText: "Enter your email",

                ///////////////////////////

                leabeltext: "Email",
                isnumber: false,
              ),
              const SizedBox(height: 30),

              Custombuttionforgetpasssword(
                  text: "Reset Password",
                  photo: AppImageAsset.restpassword,
                  onPressed: () {
                    controlle.gotoverifcode();
                  }),
              SizedBox(
                height: 30,
              ),
            ]),
          ),
                          ))   ));
  }
}
