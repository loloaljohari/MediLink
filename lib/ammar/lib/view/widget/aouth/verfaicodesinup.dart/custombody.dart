import 'package:MediLink/ammar/lib/core/constant/color.dart';

import 'package:flutter/material.dart';

class Costombodyverfaicode extends StatelessWidget {
  final String body;
  final String body1;
  const Costombodyverfaicode(
      {super.key, required this.body, required this.body1});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        body,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColor.lightgrey,

          fontSize: 16,
          // fontFamily: "PlayfairDisplay"
        ),
      ),
      Text(
        body1,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColor.lightblue,

          fontSize: 16,
          // fontFamily: "PlayfairDisplay"
        ),
      )
    ]);
  }
}
