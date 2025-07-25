import 'package:MediLink/ammar/lib/core/constant/color.dart';
import 'package:flutter/material.dart';

class customtextandphoto extends StatelessWidget {
  final String text;
  final dynamic photo;
  const customtextandphoto({
    super.key,
    required this.text,
    required this.photo,
    required Null Function() onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
//Icon(icon1,size: 20,),
        Image.asset(photo),

        Text(
          text,
          style: TextStyle(fontSize: 16, color: AppColor.dark),
        ),
      ],
    );
  }
}
