import 'package:MediLink/ammar/lib/core/constant/color.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class customtextandphotosinup extends StatelessWidget {
  final String text;

  final dynamic photo1;
  const customtextandphotosinup({
    super.key,
    required this.text,
    this.photo1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(photo1, height: 20, width: 20),

// SizedBox(width: 5,),

        Text(
          text,
          style: TextStyle(
              fontSize: 16, color: AppColor.dark, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
