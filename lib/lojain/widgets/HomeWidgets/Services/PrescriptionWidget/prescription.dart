import 'package:MediLink/lojain/models/Visits/getPrescriotions.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Services/PrescriptionWidget/Exportprescription.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Controllers/onboarding/SelectionLang.dart';

class Prescription extends StatelessWidget {
  Prescription({Key? key}) : super(key: key);
  List list = [
    {
      'date': '15 / 5 / 2025',
      'doctorname': 'Ali Kane ',
      'pataintname': 'Omar abo hawa',
      "medicine": [
        {
          'id': 1,
          'Medicalname': 'Aspiren 81 ',
          'alternative': 'Aspiren 81 ',
          'Tradename': 'Aspiren 81 ',
        },
        {
          'id': 2,
          'Medicalname': 'Aspiren 81 ',
          'alternative': 'Aspiren 81 ',
          'Tradename': 'Aspiren 81 ',
        }
      ]
    },
    {
      'date': '9 / 2 / 2025',
      'doctorname': 'Ali Kane ',
      'pataintname': 'Lojain Aljohari',
      "medicine": [
        {
          'id': 1,
          'Medicalname': 'Aspiren 81 ',
          'alternative': 'Aspiren 81 ',
          'Tradename': 'Aspiren 81 ',
        },
        {
          'id': 2,
          'Medicalname': 'Aspiren 81 ',
          'alternative': 'Aspiren 81 ',
          'Tradename': 'Aspiren 81 ',
        }
      ]
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        // backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromRGBO(38, 115, 221, 1),
          ),
        ),
        title: Center(
          child: Text(
            context.watch<Selection>().state == 1
                ? 'الوصفة الطبية'
                : 'Medical prescription',
            // style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: BlocBuilder<GetPrescriotionsCubit, GetPrescriotionsState>(
        builder: (context, state) {
       if(state is GetPrescriotionsLoaded)  {
        if(state.prescription['data'].length!=0) {return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
            child: ListView.builder(
              itemCount: state.prescription['data'].length,
              itemBuilder: (context, index) {
                return Column(
                  children:List.generate(state.prescription['data'][index]['prescriptions'].length, (index1) {
                    return  Exportprescription(
                      id:state.prescription['data'][index]['prescriptions'][index1]['prescription_id'],
                      date: state.prescription['data'][index]['visit_date'],
                      doctorname: state.prescription['data'][index]['doctor_name'],
                      patientname: state.prescription['data'][index]['name_patient'],
                      medicine: state.prescription['data'][index]['prescriptions'][index1]['items']
                    );
               
                  },)
                );
              },
            ),
          );
     }  
     else return SizedBox();
     }
       else return SizedBox();
        },
      ),
    );
  }
}
