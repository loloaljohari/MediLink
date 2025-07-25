import 'package:MediLink/ammar/lib/core/constant/color.dart';

import 'package:flutter/material.dart';

class Customtextsininandsinup extends StatelessWidget {
  final String textone;
  final String texttow;
  final void Function() onTap;

  const Customtextsininandsinup(
      {super.key,
      required this.textone,
      required this.texttow,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text(
        textone,
        style: TextStyle(color: AppColor.lightdark),
      ),
      InkWell(
        onTap: onTap,
        child: Text(
          texttow,
          style: TextStyle(
            color: AppColor.lightblue,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
            decorationColor: AppColor.lightblue,
          ),
        ),
      )
    ]);
  }
}
