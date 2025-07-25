import 'package:MediLink/ammar/lib/core/constant/imageasset.dart';

import 'package:flutter/material.dart';

class Photosucssful extends StatelessWidget {
  const Photosucssful({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 123,
        width: 123,
        child: Image.asset(
          AppImageAsset.sucssful,
        ));
  }
}
