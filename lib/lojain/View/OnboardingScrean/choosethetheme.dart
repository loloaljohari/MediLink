import 'package:MediLink/lojain/Controllers/onboarding/SelectionLang.dart';
import 'package:MediLink/lojain/View/OnboardingScrean/onboarding.dart';
import 'package:MediLink/main.dart';
import 'package:MediLink/lojain/widgets/SelectThemeWidgets/ColorsButtons.dart';
import 'package:MediLink/lojain/widgets/SelectThemeWidgets/ExpansionWidget.dart';
import 'package:MediLink/lojain/widgets/SelectThemeWidgets/OptionLang.dart';
import 'package:MediLink/lojain/widgets/SelectThemeWidgets/generaltext.dart';
import 'package:MediLink/lojain/widgets/SelectThemeWidgets/themeWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../ammar/lib/view/screen/onboarding.dart';
import '../../Controllers/onboarding/SelectionTheme.dart';

class Choosethetheme extends StatelessWidget {
  const Choosethetheme({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Selection(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    context.watch<Selection>().state == 2
                        ? 'Welcome to'
                        : 'مرحباً بك في ',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 24),
                  ),
                  Text(
                    context.watch<Selection>().state == 2
                        ? ' MediLink 👋'
                        : 'ميديالينك 👋',
                    style: const TextStyle(
                        color: Color.fromRGBO(64, 123, 255, 1),
                        fontWeight: FontWeight.w700,
                        fontSize: 24),
                  ),
                ],
              ),
              Image.asset("images/Untitled-1 1.png"),
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
            Text(
              context.watch<Selection>().state == 2
                  ? 'Before we begin, we/'
                      'd like to help you customize your experience to be convenient and easy to use.'
                  : "قبل أن نبدأ، نود مساعدتك في تخصيص تجربتك لتكون مريحة وسهلة الاستخدام.",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
              textAlign: TextAlign.right,
            ),
            Generaltext(
              text: context.watch<Selection>().state == 2
                  ? ' Choose your preferred language :'
                  : "اختر لغتك المفضلة : ",
            ),
            buildOptionButton(),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            Generaltext(
              text: context.watch<Selection>().state == 2
                  ? ' Choose font size :'
                  : "اختر حجم الخط : ",
            ),
            Expansionwidget(),
            Generaltext(
              text: context.watch<Selection>().state == 2
                  ? ' Choose the mode : '
                  : 'اختر الوضع :',
            ),
            const ThemeWidget(),
            Expanded(
                child: Generaltext(
                    text: context.watch<Selection>().state == 2
                        ? 'Choose colors that look like they don\'t match their name:'
                        : 'اختر الالوان التي لا تتطابق رؤيتها مع اسمها :')),
            const ColorsButtons(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromRGBO(64, 123, 255, 1))),
                  onPressed: () async {
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    var fontType = sharedPreferences.getString('fontType');
                    if (fontType == null) {
                      sharedPreferences.setString('fontType', 'medium');
                    }
                    var lang = sharedPreferences.getString('lang').toString();
                    var theme = sharedPreferences.getString('theme').toString();

                    print(lang);
                    print(theme);

                    // ignore: unnecessary_null_comparison
                    if (lang == null && theme == null) {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(context.watch<Selection>().state == 2
                            ? 'You must choose the language, font size, mode, and color.'
                            : 'يجب اختيار اللغة وحجم الخط و الوضع واللون'),
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 2),
                      ));
                    } else {
                      context.read<Selection>().loadLang();
                      context.read<SelectionTheme>().loadTheme();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const onBording()),
                          (route) => false);
                    }
                  },
                  child: Text(
                    context.watch<Selection>().state == 2
                        ? 'Start now'
                        : 'ابدأ الآن',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                textAlign: TextAlign.center,
                context.watch<Selection>().state == 2
                    ? 'You can modify these settings at any time through the Settings menu.'
                    : 'يمكنك تعديل هذه الإعدادات في أي وقت من خلال قائمة الإعدادات.',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
