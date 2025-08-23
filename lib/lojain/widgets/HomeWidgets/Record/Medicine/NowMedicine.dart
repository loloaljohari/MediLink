import 'package:MediLink/lojain/models/record/Getpatientrecord/medicinemodel.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Record/Medicine/Permanent%20medicines.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Record/Medicine/Temporary%20medicines.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../ammar/lib/view/screen/aouth/sinup.dart';
import '../../../../Controllers/onboarding/SelectionLang.dart';
import '../../../../Controllers/onboarding/SelectionTheme.dart';

class NowMedicine extends StatelessWidget {
  const NowMedicine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GetmedicineCubit>().fetch();
    return BlocBuilder<GetmedicineCubit, GetmedicineState>(
        builder: (context, state) {
      if (state is GetmedicineLoading) {
        return Center(
          child: CircularProgressIndicator(
              color: context.watch<SelectionTheme>().state == 3
                  ? Colors.white
                  : Colors.black),
        );
      } else if (state is GetmedicineLoaded) {
        if (state.medicine.containsKey('now')) {
          if (state.medicine['now'].isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.watch<Selection>().state == 1
                        ? 'الأدوية الدائمة'
                        : 'Permanent medicines',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Column(
                      children: List.generate(
                    state.medicine['now']
                        .where((med) => med['med_type'] == 'Chronic')
                        .length,
                    (index) {
                      return Column(
                        children: [
                          state.medicine['now'][index]['med_type'] == 'Chronic'
                              ? PermanentMedicines(
                                  Permanentmedicinesname:
                                      "${state.medicine['now'][index]['med_name']}",
                                  date:
                                      "${state.medicine['now'][index]['start_date']}",
                                  amount:
                                      '${state.medicine['now'][index]['med_total_quantity']}',
                                  time:
                                      "${state.medicine['now'][index]['timing']}",
                                  dosage:
                                      "${state.medicine['now'][index]['dose']} ml",
                                  repeat:
                                      "${state.medicine['now'][index]['frequency']}",
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },
                  )),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    context.watch<Selection>().state == 1
                        ? 'الأدوية المؤقتة'
                        : 'Temporary medicines',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Column(
                      children: List.generate(
                    state.medicine['now']
                        .where((med) => med['med_type'] != 'Chronic')
                        .length,
                    (index) {
                      return Column(
                        children: [
                          state.medicine['now'][index]['med_type'] != 'Chronic'
                              ? TemporaryMedicines(
                                  temporarymedicinesname:
                                      '${state.medicine['now'][index]['med_name']}',
                                  startdate:
                                      '${state.medicine['now'][index]['start_date']}',
                                  enddate:
                                      '${state.medicine['now'][index]['end_date']}',
                                  doctorname:
                                      '${state.medicine['now'][index]['med_prescribed_by_doctor']}',
                                  time:
                                      '${state.medicine['now'][index]['timing']}',
                                  dosage:
                                      '${state.medicine['now'][index]['dose']}',
                                  repeat:
                                      '${state.medicine['now'][index]['frequency']}',
                                  per: state.medicine['now'][index]
                                      ['taken_till_now'],
                                  max: state.medicine['now'][index]
                                      ['med_total_quantity'],
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },
                  )),
                ],
              ),
            );
          } else
            return Center(
                child: Text(
                    context.watch<Selection>().state == 1 ? 'فارغ' : 'empty'));
        } else {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              padding: EdgeInsets.all(20),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(130, 182, 255, 1),
                      blurRadius: 18,
                      spreadRadius: 1),
                ],
                color: Color.fromRGBO(21, 62, 120, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      context.watch<Selection>().state == 1
                          ? 'للاطلاع على سجلك الطبي، يجب أن يكون لديك حساب على التطبيق. سجل في تطبيقنا للوصول إلى خدماتنا.'
                          : '${state.medicine['message']}: To view your medical record, you must have an account on the app. Sign up for our app to access our services.'),
                  ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: WidgetStatePropertyAll(Size(120, 20)),
                          backgroundColor: WidgetStatePropertyAll(
                              Color.fromRGBO(38, 115, 221, 1))),
                      onPressed: () {
                        Get.to(Sinup(
                          conte: context,
                        ));
                      },
                      child: Text(
                        context.watch<Selection>().state == 1
                            ? 'اشتراك'
                            : 'Register',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ),
          ));
        }
      } else if (state is GetmedicineError) {
        return Text(state.messageError.toString());
      } else
        return SizedBox();
    });
  }
}
