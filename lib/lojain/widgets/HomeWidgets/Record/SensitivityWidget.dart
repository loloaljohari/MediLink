import 'package:MediLink/lojain/widgets/HomeWidgets/Record/enumeration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controllers/onboarding/SelectionLang.dart';
import '../../../Controllers/onboarding/SelectionTheme.dart';

class SensitivityWidget extends StatelessWidget {
  final String senstype;
  final String type;
  final String reason;
  final String treatment;
  final String pervention;
  final String reasons;
  final double width;
  const SensitivityWidget(
      {Key? key,
      required this.senstype,
      required this.type,
      required this.reason,
      required this.treatment,
      required this.pervention,
      required this.reasons,required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            senstype,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 17),
            height: 151,
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(colors: [
                  Color.fromRGBO(64, 124, 255, 0.086),
                  Color.fromRGBO(48, 92, 188, 0.655)
                ])),
            child: Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                           context.watch<Selection>().state==1?'النوع':  'Type',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,),
                          ),
                          Text(
                            type,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                           context.watch<Selection>().state==1?'الاسباب':  'Reasons',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,),
                          ),
                          Text(
                            reason,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                          context.watch<Selection>().state==1?'العلاج':   'Treatment',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,),
                          ),
                          Text(
                            treatment,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,),
                          ),
                        ],
                      ),
                    ],
                  ),
                   Divider(
            color: context.watch<SelectionTheme>().state==3? Color.fromRGBO(255, 255, 255, 0.38):Colors.black ,

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                         context.watch<Selection>().state==1?'الوقاية':    'Prevention',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(16, 175, 11, 1)),
                          ),
                          Enumeration(text: pervention),
                        ],
                      ),
                      Container(
                        width: 1,
                        height: 66,
                        color: context.watch<SelectionTheme>().state==3? Color.fromRGBO(255, 255, 255, 0.38):Colors.black ,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                        context.watch<Selection>().state==1?'الأسباب':     'Reasons',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(175, 11, 11, 1)),
                          ),
                          Enumeration(text: reasons),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
