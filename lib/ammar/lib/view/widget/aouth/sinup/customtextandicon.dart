import 'package:MediLink/ammar/lib/core/constant/color.dart';

import 'package:flutter/material.dart';

class customtextandiconsinup extends StatelessWidget {
  final String text;
  final dynamic icon1;

  const customtextandiconsinup({
    super.key,
    required this.text,
    this.icon1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon1,
          size: 20,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 16, color: AppColor.dark),
        ),
      ],
    );
  }
}
