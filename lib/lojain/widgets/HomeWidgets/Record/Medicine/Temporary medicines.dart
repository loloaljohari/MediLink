import 'package:flutter/material.dart';

class TemporaryMedicines extends StatelessWidget {
  final String temporarymedicinesname;
  final String startdate;
  final String enddate;
  final String doctorname;
  final String time;
  final String dosage;
  final String repeat;
  final int per;
  final int max;
  const TemporaryMedicines(
      {Key? key,
      required this.temporarymedicinesname,
      required this.startdate,
      required this.enddate,
      required this.doctorname,
      required this.time,
      required this.dosage,
      required this.repeat,
      required this.per, required this.max})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var per1 = per / max;
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
                temporarymedicinesname,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 182,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(19, 48, 110, 1),
                  Color.fromRGBO(64, 124, 255, 0.07)
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 21,
                            height: 25,
                            child: Image.asset(
                              'images/Group 1079.png',
                              fit: BoxFit.cover,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Start taken',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 255, 255, 0.6)),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              startdate,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 255, 255, 0.87)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            width: 21,
                            height: 25,
                            child: Image.asset(
                              'images/Group 1078.png',
                              fit: BoxFit.cover,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'End taken',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 255, 255, 0.6)),
                            ),
                            Text(
                              enddate,
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.87),
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                              'images/Vector (26).png',
                              fit: BoxFit.cover,
                            ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Doctor',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 0.6),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              doctorname,
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.87),
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
                Column(
                  children: [
                    Container(
                      height: 30,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Positioned(
                            left: 310 * (per1),
                            top: 0,
                            child: Column(
                              children: [
                                Text('$per',
                                    style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400)),
                                Icon(Icons.arrow_drop_down_rounded,
                                    color: Colors.transparent, size: 30),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 310 * (per1),
                            child: Icon(Icons.arrow_drop_down_rounded,
                                color: Colors.blue, size: 30),
                          ),
                          Container(
                            height: 6,
                            width: 310,
                            child: Stack(
                              alignment: Alignment.centerRight,
                              children: [
                                Container(
                                  height: 6,
                                  width: 310,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromRGBO(16, 175, 11, 1),
                                          Color.fromRGBO(255, 159, 26, 1),
                                          Color.fromRGBO(175, 11, 11, 1)
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                                Container(
                                  height: 6,
                                  width: 310 * (1 - per1),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(6),
                                          bottomRight: Radius.circular(6))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 310,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 8,
                                width: 0.5,
                                color: Colors.white,
                              ),
                              Text(
                                '0',
                                style: TextStyle(
                                    fontSize: 8, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 8,
                                width: 0.5,
                                color: Colors.white,
                              ),
                              Text(
                                '$max',
                                style: TextStyle(
                                    fontSize: 8, fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Divider(
                  height: 1,
                  color: Color.fromRGBO(255, 255, 255, 0.6),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              'Repeatability',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 255, 255, 0.6)),
                            ),
                          ],
                        ),
                        Text(
                          repeat,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(255, 255, 255, 0.87)),
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
                              'Dosage',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 255, 255, 0.6)),
                            ),
                          ],
                        ),
                        Text(
                          dosage,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(255, 255, 255, 0.87)),
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
                              'Time dosage',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 255, 255, 0.6)),
                            ),
                          ],
                        ),
                        Text(
                          time,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(255, 255, 255, 0.87)),
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
