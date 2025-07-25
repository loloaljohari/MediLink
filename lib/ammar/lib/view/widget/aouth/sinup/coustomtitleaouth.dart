import 'package:MediLink/ammar/lib/core/constant/color.dart';

import 'package:flutter/material.dart';

class Coustomtitleaouthsinup extends StatelessWidget {
  final String text;
  const Coustomtitleaouthsinup({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 32,
          // fontFamily: "PlayfairDisplay",
          fontWeight: FontWeight.bold,
          color: AppColor.lightblue,
        ),
      ),
    );
  }
}
