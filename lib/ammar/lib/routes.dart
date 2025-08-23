import 'package:MediLink/ammar/lib/test_view.dart';
import 'package:MediLink/ammar/lib/view/screen/aouth/forgetpaaword/forgetpassword.dart';
import 'package:MediLink/ammar/lib/view/screen/aouth/forgetpaaword/resetpassword.dart';
import 'package:MediLink/ammar/lib/view/screen/aouth/forgetpaaword/sucsseful_Restpassword.dart';
import 'package:MediLink/ammar/lib/view/screen/aouth/forgetpaaword/verifcode.dart';
import 'package:MediLink/ammar/lib/view/screen/aouth/login.dart';
import 'package:MediLink/ammar/lib/view/screen/aouth/sinup.dart';
import 'package:MediLink/ammar/lib/view/screen/aouth/sucssfulsinup.dart';
import 'package:MediLink/ammar/lib/view/screen/aouth/verfaicodesinup.dart';
import 'package:MediLink/ammar/lib/view/screen/onboarding.dart';
import 'package:MediLink/lojain/View/Home/HomePages.dart';
import 'package:flutter/material.dart';

import 'package:get/get_navigation/src/routes/get_route.dart';

import 'core/constant/routes.dart';
BuildContext? context;
List<GetPage<dynamic>>? routes = [
// GetPage(name: "/", page: ()=>const onBording(),middlewares:[
// Mymiddleware()
// ] ),

  GetPage(name: "/", page: () =>  onBording()),

  GetPage(name: Approut.login, page: () => login()),
  GetPage(name: Approut.testview, page: () => const Testview()),

  GetPage(name: Approut.onboarding, page: () => const onBording()),

  GetPage(name: Approut.Sinup, page: () =>  Sinup(conte:context!)),

  GetPage(name: Approut.verifcode, page: () => const verfaicode()),

  GetPage(name: Approut.verfaicodesinup, page: () =>  Verfaicodesinup(context1: context!,)),
  GetPage(name: Approut.Sucssfolsinup, page: () =>  Sucssfolsinup(context1: context!,)),
  GetPage(name: Approut.forgetpassword, page: () => const Forgetpassword()),

  GetPage(name: Approut.Restpassword, page: () => const Restpassword()),
  GetPage(
      name: Approut.Sucsseful_Restpassword,
      page: () => const Sucssfolrestpassword()),
];
