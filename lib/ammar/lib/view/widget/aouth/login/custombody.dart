import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Costombody extends StatelessWidget {
  final dynamic photo1;
  const Costombody({super.key, this.photo1});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      SvgPicture.asset(
        photo1,
        height: 18,
        width: 139,
      )
    ]);
  }
}
