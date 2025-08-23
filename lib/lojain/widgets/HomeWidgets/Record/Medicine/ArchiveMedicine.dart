import 'package:MediLink/lojain/models/record/Getpatientrecord/medicinemodel.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Record/Medicine/Temporary%20medicines.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Controllers/onboarding/SelectionTheme.dart';

class ArchiveMedicine extends StatelessWidget {
  const ArchiveMedicine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GetmedicineCubit>().fetch();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: BlocBuilder<GetmedicineCubit, GetmedicineState>(
        builder: (context, state) {
          if (state is GetmedicineLoading) {
            return Center(
              child: CircularProgressIndicator(
               color:  context.watch<SelectionTheme>().state==3?Colors.white :Colors.black),
            );
          } else if (state is GetmedicineLoaded) {
            return state.medicine['archive'].isEmpty
                ? SizedBox()
                : Column(
                    children: List.generate(
                    state.medicine['archive'].length,
                    (index) {
                      return TemporaryMedicines(
                        temporarymedicinesname: state.medicine['archive'][index]
                            ['med_name'],
                        startdate: state.medicine['archive'][index]
                            ['start_date'],
                        enddate: state.medicine['archive'][index]['end_date'],
                        doctorname: state.medicine['archive'][index]
                            ['med_prescribed_by_doctor'],
                        time: state.medicine['archive'][index]['timing'],
                        dosage: state.medicine['archive'][index]['dose'],
                        repeat: state.medicine['archive'][index]['frequency'],
                        per: state.medicine['archive'][index]['progress_info']
                            ['taken_till_now'],
                        max: state.medicine['archive'][index]
                            ['med_total_quantity'],
                      );
                    },
                  ));
          } else
            return SizedBox();
        },
      ),
    );
  }
}
