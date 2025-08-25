import 'package:MediLink/ammar/lib/core/constant/color.dart';

import 'package:flutter/material.dart';

class Coustomtitleaouthverfaicode extends StatelessWidget {
  final String text;
  const Coustomtitleaouthverfaicode({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(

          // fontFamily: "PlayfairDisplay",
          fontWeight: FontWeight.bold,
          // color: AppColor.dark,
        ),
      ),
    );
  }
}
