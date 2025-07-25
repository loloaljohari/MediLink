import 'package:MediLink/lojain/widgets/HomeWidgets/Services/PrescriptionWidget/Exportprescription.dart';
import 'package:flutter/material.dart';

class Prescription extends StatelessWidget {
  Prescription({Key? key}) : super(key: key);
  List list = [
    {
      'date': '15 / 5 / 2025',
      'doctorname': 'Ali Kane ',
      'pataintname': 'Omar abo hawa',
      "medicine":
  [   {
        'id':1,
        'Medicalname':'Aspiren 81 ',
        'alternative':'Aspiren 81 ',
        'Tradename':'Aspiren 81 ',
      }
       ,{
        'id':2,
        'Medicalname':'Aspiren 81 ',
        'alternative':'Aspiren 81 ',
        'Tradename':'Aspiren 81 ',
      }]
    },
    {
      'date': '9 / 2 / 2025',
      'doctorname': 'Ali Kane ',
      'pataintname': 'Lojain Aljohari',
        "medicine":
     [ 
       {
        'id':1,
        'Medicalname':'Aspiren 81 ',
        'alternative':'Aspiren 81 ',
        'Tradename':'Aspiren 81 ',
      }
      ,{
        'id':2,
        'Medicalname':'Aspiren 81 ',
        'alternative':'Aspiren 81 ',
        'Tradename':'Aspiren 81 ',
      }]
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
        title: const Center(
          child: Text(
            'Medical prescription',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Exportprescription(
              id: index+1,
              date: list[index]['date'],
              doctorname: list[index]['doctorname'],
              patientname: list[index]['pataintname'], medicine: list[index]['medicine'],
            );
          },
        ),
      ),
    );
  }
}
