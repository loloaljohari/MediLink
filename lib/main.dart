import 'package:MediLink/ammar/lib/binding/initialbinding.dart';
import 'package:MediLink/ammar/lib/core/services/services.dart';
import 'package:MediLink/ammar/lib/routes.dart';
import 'package:MediLink/lojain/Controllers/doctors/Month.dart';
import 'package:MediLink/lojain/Controllers/doctors/SelectThetime.dart';
import 'package:MediLink/lojain/Controllers/doctors/Selecttheday.dart';
import 'package:MediLink/lojain/Controllers/home/NavigationCubit.dart';
import 'package:MediLink/lojain/Controllers/mydates/ButtonsDates.dart';
import 'package:MediLink/lojain/Controllers/onboarding/SelectionLang.dart';
import 'package:MediLink/lojain/Controllers/onboarding/SelectionTheme.dart';
import 'package:MediLink/lojain/Controllers/onboarding/SelectionType.dart';
import 'package:MediLink/lojain/Controllers/record/SliderValueCubit.dart';
import 'package:MediLink/lojain/Controllers/record/dropgeneral.dart';
import 'package:MediLink/lojain/Controllers/services/darkcontrol.dart';

import 'package:MediLink/lojain/View/SplashScrean/splashscreen.dart';
import 'package:MediLink/lojain/models/Aouth/changeAccount.dart';
import 'package:MediLink/lojain/models/Dates/deleteDate.dart';
import 'package:MediLink/lojain/models/Dates/getAllNearestdate.dart';
import 'package:MediLink/lojain/models/Dates/getDates.dart';
import 'package:MediLink/lojain/models/Dates/getNearestdate.dart';
import 'package:MediLink/lojain/models/Doctors/getDaysForDoctor.dart';
import 'package:MediLink/lojain/models/Doctors/getDoctorinfo.dart';
import 'package:MediLink/lojain/models/Doctors/getDoctors.dart';
import 'package:MediLink/lojain/models/Doctors/getTimes.dart';
import 'package:MediLink/lojain/models/Doctors/postArriveClinic.dart';
import 'package:MediLink/lojain/models/Doctors/postBook.dart';
import 'package:MediLink/lojain/models/Proflie/updateProfile.dart';
import 'package:MediLink/lojain/models/alarm/deleteAlarm.dart';
import 'package:MediLink/lojain/models/alarm/getAlarms.dart';
import 'package:MediLink/lojain/models/alarm/postalarm.dart';
import 'package:MediLink/lojain/models/record/FillOutRecord/postAllinfornation.dart';
import 'package:MediLink/lojain/models/record/FillOutRecord/postMedicalexaminations.dart';
import 'package:MediLink/lojain/models/record/FillOutRecord/postOperations.dart';
import 'package:MediLink/lojain/models/record/FillOutRecord/postillness.dart';
import 'package:MediLink/lojain/models/record/FillOutRecord/postmedicalfile.dart';
import 'package:MediLink/lojain/models/record/FillOutRecord/postmedicine.dart';
import 'package:MediLink/lojain/models/record/FillOutRecord/postpublic.dart';
import 'package:MediLink/lojain/models/record/FillOutRecord/postsensitivity.dart';
import 'package:MediLink/lojain/models/record/Getpatientrecord/Medicalexaminationsmodel.dart';
import 'package:MediLink/lojain/models/record/Getpatientrecord/pulbicmodel.dart';
import 'package:alarm/alarm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'dart:ui';

import 'lojain/Controllers/record/checkAddictions.dart';
import 'lojain/Controllers/services/DropdownCubit.dart';
import 'lojain/models/Proflie/getProfile.dart';
import 'lojain/models/record/Getpatientrecord/Sensitivitymodel.dart';
import 'lojain/models/record/Getpatientrecord/medicalFilemodel.dart';
import 'lojain/models/record/Getpatientrecord/medicinemodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

//notifications
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  // طلب صلاحية الإشعارات
  await messaging.requestPermission();
  // الحصول على الـ token
  String? token = await messaging.getToken();
  print("FCM Token: $token");
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    late RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    print(
        'the title: ${notification!.title} \n the body: ${notification.body}  ');
  });

// Alarm
  await initialservices();
  await Alarm.init();
  Alarm.stopAll();
  print(Alarm.getAlarms());

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetDoctorsCubit()),
        BlocProvider(create: (context) => GetAllNearestdateCubit()),
        BlocProvider(create: (context) => ChangeAccount()),
        BlocProvider(create: (context) => GetDatesCubit()),
        BlocProvider(create: (context) => DeleteDate()),
        BlocProvider(create: (context) => GetNearestdateCubit()),
        BlocProvider(create: (context) => PostBook()),
        BlocProvider(create: (context) => PostArriveClinic()),
        BlocProvider(create: (context) => GetTimesCubit()),
        BlocProvider(create: (context) => GetDaysForDoctorCubit()),
        BlocProvider(create: (context) => GetDoctorinfoCubit()),
        BlocProvider(create: (context) => DeleteAlarm()),
        BlocProvider(create: (context) => Buttonsdates()),
        BlocProvider(create: (context) => NavigationCubit()),
        BlocProvider(create: (context) => CheckAddictions()),
        BlocProvider(create: (context) => DropgeneralCubit()),
        BlocProvider(create: (context) => SliderValueCubit()),
        BlocProvider(create: (context) => Darkcontrol()),
        BlocProvider(create: (context) => DropdownCubit()),
        BlocProvider(create: (context) => Postalarm()),
        BlocProvider(create: (context) => GetprofileCubit()),
        BlocProvider(create: (context) => UpdateprofileCubit()),
        BlocProvider(create: (context) => PostAllinfornation()),
        BlocProvider(create: (context) => Postillness()),
        BlocProvider(create: (context) => postMedicalexaminations()),
        BlocProvider(create: (context) => Postmedicalfile()),
        BlocProvider(create: (context) => Postmedicine()),
        BlocProvider(create: (context) => PostOperations()),
        BlocProvider(create: (context) => PostpublicState()),
        BlocProvider(create: (context) => Postsensitivity()),
        BlocProvider(create: (context) => GetMedicalexaminationsCubit()),
        BlocProvider(create: (context) => GetmedicalfileCubit()),
        BlocProvider(create: (context) => GetmedicineCubit()),
        BlocProvider(create: (context) => GetAlarmsCubit()),
        BlocProvider(create: (context) => GetPublicCubit()),
        BlocProvider(create: (context) => GetSensitivityCubit()),
        BlocProvider(create: (context) => SliderValueCubit()),
        BlocProvider(create: (context) => Selection()..loadLang()),
        BlocProvider(create: (context) => SelectionTheme()),
        BlocProvider(create: (context) => MonthCubit()),
        BlocProvider(create: (context) => SelectionType()),
        BlocProvider(create: (context) => Selectthetime()),
        BlocProvider(create: (context) => Selecttheday())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return BlocBuilder<DropdownCubit, DropdownState?>(
      builder: (context, type) {
        return BlocBuilder<SelectionTheme, int?>(
          builder: (context, theme) {
            return BlocBuilder<Selection, int?>(
              builder: (context, lang) {
                return GetMaterialApp(
                  locale: lang == 1 ? const Locale("ar") : const Locale("en"),
                  supportedLocales: [Locale("en"), Locale("ar")],
                  localizationsDelegates: [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  theme: theme == 3
                      ? ThemeData.dark().copyWith(
                          textTheme: ThemeData.light().textTheme.apply(
                                bodyColor: Colors.white,
                              ),
                          scaffoldBackgroundColor: Colors.black,
                          appBarTheme: AppBarTheme(color: Colors.black),
                          cardColor: Color.fromRGBO(34, 34, 34, 1),
                          canvasColor: Colors.white)
                      : ThemeData.light().copyWith(
                          textTheme: ThemeData.light()
                              .textTheme
                              .apply(bodyColor: Colors.black),
                          scaffoldBackgroundColor: Colors.white,
                          appBarTheme: AppBarTheme(color: Colors.white),
                          cardColor: const Color.fromRGBO(221, 221, 221, 1),
                          canvasColor: Colors.black,
                        ),
                  debugShowCheckedModeBanner: false,
                  initialBinding: initialBindings(),
                  getPages: routes,
                  builder: (context, child) {
                    return Directionality(
                        textDirection:
                            lang == 1 ? TextDirection.rtl : TextDirection.ltr,
                        child: child!);
                  },
                  home: MaterialApp(
                    locale: lang == 1 ? const Locale("ar") : const Locale("en"),
                    supportedLocales: [Locale("en"), Locale("ar")],
                    localizationsDelegates: [
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    theme: theme == 3
                        ? ThemeData.dark().copyWith(
                            textTheme: ThemeData.light()
                                .textTheme
                                .apply(bodyColor: Colors.white),
                            scaffoldBackgroundColor: Colors.black,
                            appBarTheme: AppBarTheme(color: Colors.black),
                            cardColor: Color.fromRGBO(34, 34, 34, 1),
                            canvasColor: Colors.white)
                        : ThemeData.light().copyWith(
                            scaffoldBackgroundColor: Colors.white,
                            appBarTheme: AppBarTheme(color: Colors.white),
                            cardColor: const Color.fromRGBO(221, 221, 221, 1),
                            canvasColor: Colors.black,
                            textTheme: ThemeData.light()
                                .textTheme
                                .apply(bodyColor: Colors.black)),
                    debugShowCheckedModeBanner: false,
                    builder: (context, child) {
                      return Directionality(
                          textDirection:
                              lang == 1 ? TextDirection.rtl : TextDirection.ltr,
                          child: child!);
                    },
                    home: Directionality(
                        textDirection:
                            lang == 1 ? TextDirection.rtl : TextDirection.ltr,
                        child: Splashscreen()),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
