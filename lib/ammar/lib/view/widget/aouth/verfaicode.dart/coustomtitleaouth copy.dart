import 'package:MediLink/ammar/lib/core/constant/color.dart';

import 'package:flutter/material.dart';

class Coustomtitleverfaicode extends StatelessWidget {
  final String text;
  final String text1;
  final String text2;
  const Coustomtitleverfaicode(
      {super.key,
      required this.text,
      required this.text1,
      required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
//crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(

              // fontFamily: "PlayfairDisplay",
              fontWeight: FontWeight.w700,
              color: AppColor.lightblue,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              text1,
              textAlign: TextAlign.start,
              style: const TextStyle(
                // color: AppColor.dark,
                fontWeight: FontWeight.w700,

                // fontFamily: "PlayfairDisplay"
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text2,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: AppColor.lightgrey,
                fontWeight: FontWeight.w500,

                // fontFamily: "PlayfairDisplay"
              ),
            )
          ])
        ]));
  }
}
