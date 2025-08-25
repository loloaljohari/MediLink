import 'package:MediLink/ammar/lib/core/constant/color.dart';
import 'package:flutter/material.dart';

class Coustomtitlesucssful extends StatelessWidget {
  final String text;
  final String text1;
  const Coustomtitlesucssful(
      {super.key, required this.text, required this.text1});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(

          // color: AppColor.lightdark,
        ),
      ),
   const   SizedBox(
        height: 10,
      ),
      Text(
        text1,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColor.lightgrey,

        ),
      )
    ]));
  }
}
