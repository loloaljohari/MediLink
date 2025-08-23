import 'package:MediLink/ammar/lib/core/constant/color.dart';
import 'package:MediLink/ammar/lib/view/screen/aouth/sinup.dart';
import 'package:MediLink/lojain/Controllers/onboarding/SelectionTheme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:context.watch<SelectionTheme>().state==3? Colors.white: Colors.black
          ),
          child: SvgPicture.asset(photo1, height: 20, width: 20)),

// SizedBox(width: 5,),

        Text(
          text,
          style: TextStyle(
              fontSize: 16,  fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
