import 'package:flutter/material.dart';
    
class Onboarding extends StatelessWidget {

  const Onboarding({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Locale locale=Localizations.localeOf(context);
    return Scaffold(
      appBar: AppBar(
        title:  Text('${locale.languageCode}'),
      ),
      body: Container(),
    );
  }
}