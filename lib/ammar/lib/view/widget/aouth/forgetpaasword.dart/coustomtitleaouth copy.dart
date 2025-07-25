
import 'package:MediLink/ammar/lib/core/constant/color.dart';
import 'package:flutter/material.dart';

class Coustomtitleforgetpassword extends StatelessWidget {
  final String text;
  final String text1;
  const Coustomtitleforgetpassword(
      {super.key, required this.text, required this.text1});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        text,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: AppColor.lightdark,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
          width: 358,
          height: 36,
          child: Text(
            text1,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: AppColor.lightgrey,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              // fontFamily: "PlayfairDisplay"
            ),
          )),
    ]);
  }
}
