import 'package:MediLink/Controllers/doctors/Month.dart';
import 'package:MediLink/Controllers/doctors/SelectThetime.dart';
import 'package:MediLink/Controllers/mydates/ButtonsDates.dart';
import 'package:MediLink/Controllers/onboarding/SelectionLang.dart';
import 'package:MediLink/Controllers/onboarding/SelectionTheme.dart';
import 'package:MediLink/Controllers/onboarding/SelectionType.dart';
import 'package:MediLink/Controllers/record/SliderValueCubit.dart';
import 'package:MediLink/View/Home/HomePages.dart';
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

import 'Controllers/doctors/Selecttheday.dart';


late String lang;
late String theme;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Alarm.init();
  Locale deviceLocale = PlatformDispatcher.instance.locale;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var l = preferences.getString('lang');
  l == null ? lang = deviceLocale.languageCode.toString() : lang = l.toString();

  final Brightness platformBrightness =
      PlatformDispatcher.instance.platformBrightness;

  var t = preferences.getString('theme');
  t == null
      ? theme = (platformBrightness == Brightness.dark ? 'naight' : 'light')
      : theme = t.toString();

  runApp(
    MultiBlocProvider(
      providers: [
          BlocProvider(create:  (context) => Buttonsdates()),
          BlocProvider(create:  (context) => SliderValueCubit()),
        BlocProvider(
            create: (_) => Selection()..selectLang(lang == 'ar' ? 1 : 2)),
        BlocProvider(
            create: (_) =>
                SelectionTheme()..selecttheme(theme == 'light' ? 4 : 3)),
        BlocProvider(
          create: (_) => MonthCubit(),
        ),
         BlocProvider(
          create: (_) => SelectionType(),
        ),
        BlocProvider(
          create: (_) => Selectthetime(),
        ),
        BlocProvider(
          create: (_) => Selecttheday(),
        )
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
       print('');
      String thememode = context.watch<SelectionTheme>().state == 4 ? 'light' : 'dark';
        String langCode = context.watch<Selection>().state == 1 ? 'ar' : 'en';
        TextDirection textDirection =
            langCode == 'ar' ? TextDirection.rtl : TextDirection.ltr;
      return  Directionality(
          textDirection: textDirection,
          child: MaterialApp(
            locale: Locale(langCode),
            supportedLocales: [Locale("en"), Locale("ar")],
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
          
            theme: thememode == 'light'
                ? ThemeData.light().copyWith(
                    scaffoldBackgroundColor: Colors.white,
                    appBarTheme: AppBarTheme(color: Colors.white),
                 cardColor: const Color.fromRGBO(221, 221, 221, 1),
                  canvasColor: Colors.black,
                    textTheme: ThemeData.light().textTheme.apply(bodyColor: Colors.black)
                    )
                : ThemeData.dark().copyWith(
                  textTheme: ThemeData.light().textTheme.apply(bodyColor: Colors.white),
                    scaffoldBackgroundColor: Colors.black,
                    appBarTheme: AppBarTheme(color: Colors.black),
                 cardColor: Color.fromRGBO(34, 34, 34, 1),
                 canvasColor: Colors.white
                ),
            debugShowCheckedModeBanner: false,
            home: Homepages(),
          ),
        );
      
  }
}


// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   String? savedLanguage = await getSavedLanguage();
//    Locale deviceLocale = PlatformDispatcher.instance.locale;
//    String lang=deviceLocale.languageCode;
//   runApp(MyApp(savedLanguage ?? lang));
// }

// Future<String?> getSavedLanguage() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getString('app_language');
// }

// Future<void> saveLanguage(String languageCode) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setString('app_language', languageCode);
// }

// class MyApp extends StatefulWidget {
//   final String initialLanguage;
//   MyApp(this.initialLanguage);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late String _locale;

//   @override
//   void initState() {
//     super.initState();
//     _locale = widget.initialLanguage;
//   }

//   void changeLanguage(String languageCode) async {
//     setState(() {
//       _locale = languageCode;
//     });
//     await saveLanguage(languageCode);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       locale: Locale(_locale),
//       supportedLocales: [Locale("en"), Locale("ar"), Locale("fr")],
//       localizationsDelegates: [
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//       ],
//       home: LanguageScreen(onLanguageChanged: changeLanguage),
//     );
//   }
// }

// class LanguageScreen extends StatelessWidget {
//   final Function(String) onLanguageChanged;

//   LanguageScreen({required this.onLanguageChanged});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("تغيير اللغة")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(onPressed: () => onLanguageChanged("en"), child: Text("English")),
//             ElevatedButton(onPressed: () => onLanguageChanged("ar"), child: Text("العربية")),
//             ElevatedButton(onPressed: () => onLanguageChanged("fr"), child: Text("Français")),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:ui' as ui;
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'package:flutter/rendering.dart';
// import 'package:permission_handler/permission_handler.dart';

// late String lang;

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   runApp(SaveImagePage());
//   ;
// }

// class SaveImagePage extends StatefulWidget {
//   @override
//   _SaveImagePageState createState() => _SaveImagePageState();
// }

// class _SaveImagePageState extends State<SaveImagePage> {
//   final GlobalKey _globalKey = GlobalKey();

//   Future<void> _saveContainerAsImage() async {
//     // 1. طلب صلاحية الوصول للتخزين
//     var status = await Permission.storage.request();
//     if (!status.isGranted) {
//       print("🚫 تم رفض صلاحية التخزين");
//       return;
//     }

//     try {
//       // 2. أخذ صورة من الـ Container
//       RenderRepaintBoundary boundary = _globalKey.currentContext!
//           .findRenderObject() as RenderRepaintBoundary;

//       ui.Image image = await boundary.toImage(pixelRatio: 3.0);
//       ByteData? byteData =
//           await image.toByteData(format: ui.ImageByteFormat.png);
//       Uint8List pngBytes = byteData!.buffer.asUint8List();

//       // 3. حفظ الصورة في المعرض
//       final result = await ImageGallerySaverPlus.saveImage(
//         pngBytes,
//         quality: 100,
//         name: "container_image_${DateTime.now().millisecondsSinceEpoch}",
//       );

//       print("✅ تم الحفظ: $result");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('✅ تم حفظ الصورة في المعرض')),
//       );
//     } catch (e) {
//       print("❌ خطأ أثناء الحفظ: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(title: Text("حفظ Container كصورة")),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               RepaintBoundary(
//                 key: _globalKey,
//                 child: Container(
//                   width: 250,
//                   padding: EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     color: Colors.amber,
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Column(
//                     children: [
//                       Icon(Icons.star, size: 60, color: Colors.white),
//                       SizedBox(height: 10),
//                       Text("هذا محتوى سيتم حفظه كصورة",
//                           style: TextStyle(fontSize: 16, color: Colors.black)),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 30),
//               ElevatedButton.icon(
//                 onPressed: _saveContainerAsImage,
//                 icon: Icon(Icons.save),
//                 label: Text("حفظ في المعرض"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
