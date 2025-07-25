
import 'package:MediLink/ammar/lib/core/class/statusrequest.dart';
import 'package:MediLink/ammar/lib/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingData_view extends StatelessWidget {
  final Statusrequest statusrequest;

  final Widget widget;

  const HandlingData_view(
      {super.key, required this.statusrequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusrequest == Statusrequest.loding
        ? Center(
            child: Lottie.asset(
            AppImageAsset.loding,
          ))
        : statusrequest == Statusrequest.offlinefailure
            ? const Center(
                child: Text("offlinefailure"),
              )
            : statusrequest == Statusrequest.serverfailur
                ? Center(
                    child: Lottie.asset(
                      AppImageAsset.serverfailur,
                    ),
                  )
                : statusrequest == Statusrequest.failure
                    ? const Center(child: Text("No data"))
                    : widget;
  }
}
