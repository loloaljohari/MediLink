import 'package:MediLink/widgets/HomeWidgets/Record/Exarnination/pdfwidgetExarnination.dart';
import 'package:flutter/material.dart';

class PdfExarninatin extends StatelessWidget {
   PdfExarninatin({Key? key}) : super(key: key);
  List list=[
    {
      'name': 'Alaa Medca', 'date': '22/3/2020',
    },{
      'name': 'Alaa Medca', 'date': '22/3/2020',
    }, 
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('images/Group (4).png'),
              SizedBox(
                width: 10,
              ),
              Text(
                'Diabetic analysis',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              )
            ],
          ),
        
          Column(
            children: List.generate(list.length, (index) {
              return PdfwidgetExarnination(name: list[index]['name'], date: list[index]['date'],);
            },),
          )
        ,
        SizedBox(height: 20,), 
        Row(
            children: [
              Image.asset('images/Group (4).png'),
              SizedBox(
                width: 10,
              ),
              Text(
                'Pressure analysis',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              )
            ],
          ),
        Column(
            children: List.generate(list.length, (index) {
              return PdfwidgetExarnination(name: list[index]['name'], date: list[index]['date'],);
            },),
          )
        ,
        ],
      ),
    );
  }
}
