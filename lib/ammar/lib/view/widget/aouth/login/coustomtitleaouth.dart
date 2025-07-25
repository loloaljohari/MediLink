import 'package:MediLink/ammar/lib/core/constant/color.dart';
import 'package:flutter/material.dart';

class Coustomtitleaouth extends StatelessWidget {
  final String text;
  const Coustomtitleaouth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 20,
          // fontFamily: "PlayfairDisplay",
          fontWeight: FontWeight.w700,
          color: AppColor.lightblue,
        ),
      ),
    );
  }
}
