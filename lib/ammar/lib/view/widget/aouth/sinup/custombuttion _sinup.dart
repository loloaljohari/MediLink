import 'package:MediLink/ammar/lib/core/constant/color.dart';

import 'package:flutter/material.dart';

class Custombuttion_sinup extends StatelessWidget {
  final String text;
  final dynamic icon1;

  final void Function()? onPressed;

  const Custombuttion_sinup({
    super.key,
    required this.text,
    this.onPressed,
    this.icon1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 3),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),

//  padding: const EdgeInsets.symmetric(vertical: 15),

          onPressed: onPressed,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon1,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    text,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "PlayfairDisplay",
                        fontSize: 15),
                  ),
                ],
              )),
          color: AppColor.lightblue,
        ));
  }
}
