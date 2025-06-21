import 'package:MediLink/widgets/HomeWidgets/Record/enumeration.dart';
import 'package:flutter/material.dart';
    
class SensitivityWidget extends StatelessWidget {
  final String senstype;
  final String type;
  final String reason;
  final String treatment;
  const SensitivityWidget({ Key? key, required this.senstype, required this.type, required this.reason, required this.treatment }) : super(key: key);
  
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
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(255, 255, 255, 0.87)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 17),
                      height: 151,
                      width: double.infinity,
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
                                      'Type',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(255, 255, 255, 0.38)),
                                    ), Text(
                                      type,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(255, 255, 255, 1)),
                                    ),
                                  ],
                                ),
                                 Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Reasons',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(255, 255, 255, 0.38)),
                                    ), Text(
                                      reason,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(255, 255, 255, 1)),
                                    ),
                                  ],
                                ),
                               Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Treatment',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(255, 255, 255, 0.38)),
                                    ), Text(
                                      treatment,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(255, 255, 255, 1)),
                                    ),
                                  ],
                                ),
                              
                              ],
                            ),
                            const Divider(color: Color.fromRGBO(255, 255, 255, 0.38),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            const   Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Prevention',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(16, 175, 11, 1)),
                                    ),
                                    Enumeration(text: 'Wearing a muzzle Wear protective'),
                                    Enumeration(text: 'Wear protective glasses'),
                                   
                                ],
                              ),
                              Container(width: 1,height:66,color:Color.fromRGBO(255, 255, 255, 0.38) ,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Reasons',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(175, 11, 11, 1)),
                                    ),
                                    Enumeration(text: 'Wearing a muzzle Wear protective'),
                                    Enumeration(text: 'Wear protective glasses'),
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
    )
           ;
  }
}