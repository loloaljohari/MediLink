import 'package:MediLink/ammar/lib/core/constant/color.dart';
import 'package:flutter/material.dart';

class customtextandicon extends StatelessWidget {
  final String text;
  final dynamic icon1;
  const customtextandicon({
    super.key,
    required this.text,
    required this.icon1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon1,
          size: 15,
        ),
        Text(
          text,
          style: TextStyle(),
        ),
      ],
    );
  }
}
