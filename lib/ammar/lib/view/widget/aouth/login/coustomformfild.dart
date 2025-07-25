import 'package:MediLink/ammar/lib/core/constant/color.dart';
import 'package:flutter/material.dart';

class Customforfild extends StatelessWidget {
  final String hintText;
  final String leabeltext;
  final IconData? iconData;
  final TextEditingController mycontrller;
  final String? Function(String?) valid;
  final bool isnumber;
  final bool? obscureText;
  final void Function()? onTapicon;

  const Customforfild(
      {super.key,
      this.onTapicon,
      required this.hintText,
      required this.leabeltext,
      this.iconData,
      required this.mycontrller,
      required this.valid,
      required this.isnumber,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Color(0xFFDDDDDDDD),
            ),
            boxShadow: [
              BoxShadow(
                  color: AppColor.dark,
                  offset: Offset(0, -1),
                  blurStyle: BlurStyle.outer,
                  spreadRadius: -2,
                  blurRadius: 2)
            ]),




        child: TextFormField(
          style: TextStyle(color: AppColor.lightblue),
          cursorColor: Colors.blue,
          cursorWidth: 2.0,
          cursorRadius: Radius.circular(4),
          keyboardType: isnumber
              ? TextInputType.numberWithOptions(decimal: true)
              : TextInputType.text,
          validator: valid,
          controller: mycontrller,
          obscureText:
              obscureText == null || obscureText == false ? false : true,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
            suffixIcon: InkWell(
              child: Icon(
                iconData,
                color: AppColor.lightblue,
              ),
              onTap: onTapicon,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColor.lightgrey1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColor.lightblue),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.redAccent),
            ),
          ),
        ));
  }
}
