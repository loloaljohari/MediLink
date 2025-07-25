import 'package:MediLink/ammar/lib/core/constant/color.dart';
import 'package:flutter/material.dart';

class Custombuttion extends StatelessWidget {
  final String text;
  final dynamic icon1;
  final dynamic photo;
  final void Function()? onPressed;

  const Custombuttion(
      {super.key, required this.text, this.onPressed, this.icon1, this.photo});

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
                  Image.asset(
                    photo,
                    height: 20,
                    width: 20,
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
