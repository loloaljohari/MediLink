import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Controllers/onboarding/SelectionLang.dart';

class PermanentMedicines extends StatelessWidget {
  final String Permanentmedicinesname;
  final String date;
  final String amount;
  final String time;
  final String  dosage;
  final String repeat;
  const PermanentMedicines({Key? key, required this.Permanentmedicinesname, required this.date, required this.amount, required this.time, required this.dosage, required this.repeat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('images/Vector (23).png'),
              SizedBox(
                width: 10,
              ),
              Text(
                Permanentmedicinesname,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 113,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(19, 48, 110, 1),
                  Color.fromRGBO(64, 124, 255, 0.07)
                ])),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('images/Group 1079.png'),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                            context.watch<Selection>().state==1?'بدء الأخذ':   'Start taken',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Text(
                          date,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(54, 133, 243, 1)),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('images/Vector (24).png'),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                               context.watch<Selection>().state==1?'الكمية المأخوذة':   'Amount taken',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Text(
                          amount,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(54, 133, 243, 1)),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: Color.fromRGBO(255, 255, 255, 0.6),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('images/Group (5).png'),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                               context.watch<Selection>().state==1?'التكرار':   'Repeatability',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                 ),
                            ),
                          ],
                        ),
                        Text(
                         repeat,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              ),
                        ),
                      ],
                    ),
                    Container(
                      height: 28,
                      width: 1,
                      color: Color.fromRGBO(255, 255, 255, 0.38),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('images/Group (6).png'),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                               context.watch<Selection>().state==1?'الجرعة':   'Dosage',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                             ),
                            ),
                          ],
                        ),
                        Text(
                          dosage,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                             ),
                        ),
                      ],
                    ),
                    Container(
                      height: 28,
                      width: 1,
                      color: Color.fromRGBO(255, 255, 255, 0.38),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('images/Vector (25).png'),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                               context.watch<Selection>().state==1?'وقت الجرعة':   'Time dosage',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                 ),
                            ),
                          ],
                        ),
                        Text(
                          time,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                             ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
