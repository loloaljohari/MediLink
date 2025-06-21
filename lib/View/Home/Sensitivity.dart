import 'package:MediLink/widgets/HomeWidgets/Record/SensitivityWidget.dart';
import 'package:MediLink/widgets/HomeWidgets/Record/enumeration.dart';
import 'package:flutter/material.dart';

class Sensitivity extends StatelessWidget {
  Sensitivity({Key? key}) : super(key: key);
  List list = [
    {
      'senstype': 'Spring eyelash',
      'type': 'semester',
      'reason': 'Spring',
      'treatment': 'Eye drops'
    },
    {
      'senstype': 'allergy',
      'type': 'Animals',
      'reason': 'Cat',
      'treatment': 'Moisturizer'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromRGBO(38, 115, 221, 1),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 70),
          child: Text(
            'Sensitivity',
            style: TextStyle(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: ListView(
          children: [
            Row(
              children: [
                Image.asset('images/Group 1034.png'),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Strong Sensitivity',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                )
              ],
            ),
            Column(
              children: List.generate(
                list.length,
                (index) {
                  return SensitivityWidget(
                      senstype: list[index]['senstype'],
                      type: list[index]['type'],
                      reason: list[index]['reason'],
                      treatment: list[index]['treatment']);
                },
              ).toList(),
            )
             , 
             SizedBox(height: 20,),
             Row(
              children: [
                Image.asset('images/Group 1034 (1).png'),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Medium Sensitivity',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                )
              ],
            ),
             Column(
              children: List.generate(
                list.length,
                (index) {
                  return SensitivityWidget(
                      senstype: list[index]['senstype'],
                      type: list[index]['type'],
                      reason: list[index]['reason'],
                      treatment: list[index]['treatment']);
                },
              ).toList(),
            )
             ,SizedBox(height: 20,),
             Row(
              children: [
                Image.asset('images/Group 1034 (1).png'),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Weak Sensitivity',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                )
              ],
            ),
             Column(
              children: List.generate(
                list.length,
                (index) {
                  return SensitivityWidget(
                      senstype: list[index]['senstype'],
                      type: list[index]['type'],
                      reason: list[index]['reason'],
                      treatment: list[index]['treatment']);
                },
              ).toList(),
            )
             ,SizedBox(height: 20,),
            ],
        ),
      ),
    );
  }
}
