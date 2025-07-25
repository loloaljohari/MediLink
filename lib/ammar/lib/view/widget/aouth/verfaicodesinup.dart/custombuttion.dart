import 'package:MediLink/ammar/lib/core/constant/color.dart';

import 'package:flutter/material.dart';

class Custombuttionverfaicode extends StatelessWidget {
  final String text;
  final dynamic icon1;
  final void Function()? onPressed;
  const Custombuttionverfaicode(
      {super.key, required this.text, this.onPressed, this.icon1});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 358,
        height: 52,
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
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              )),
          color: AppColor.lightblue,
        ));
  }
}
