import 'package:MediLink/lojain/models/alarm/getAlarms.dart';
import 'package:MediLink/lojain/models/record/Getpatientrecord/medicinemodel.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Services/AlarmWidegt/AlarmContainer.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Services/AlarmWidegt/addAlarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlarmMadicen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<GetmedicineCubit>().fetch();
    context.read<GetAlarmsCubit>().fetch();
    
    return Scaffold(
      key: scaffold,
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
        title: const Padding(
          padding: EdgeInsets.only(left: 70),
          child: Text(
            'My medication alarms',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            BlocBuilder<GetAlarmsCubit, GetAlarmsState>(
              builder: (context, state) {
                if (state is GetAlarmsLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetAlarmsLoaded) {
                  return Column(
                    children: List.generate(
                      state.alarms['data'].length,
                      (index) {
                        return AlarmContainer(
                          id:state.alarms['data'][index]
                                ['id'] ,
                            alarm_timing: state.alarms['data'][index]
                                ['alarm_timing'],
                            alarm_time: state.alarms['data'][index]
                                ['alarm_time'],
                            alarm_frequency: state.alarms['data'][index]
                                ['alarm_frequency'],
                            alarm_dose: state.alarms['data'][index]
                                ['alarm_dose'],
                            med_name: state.alarms['data'][index]['medication']
                                ['med_name'], idMed: state.alarms['data'][index]['medication_id'] );
                      },
                    ),
                  );
                } else
                  return Text('================');
              },
            ),
            Center(
              child: IconButton(
                onPressed: () {
                  // setAlarm(context);
                  scaffold.currentState!.showBottomSheet(
                      backgroundColor: Colors.black,
                      (context) =>
                          BlocBuilder<GetmedicineCubit, GetmedicineState>(
                            builder: (context, state) {
                              if (state is GetmedicineLoaded) {
                                return AddAlarm(
                                  med: List.generate(
                                      state.medicine['now'].length, (index) {
                                    return {
                                      'name': state.medicine['now'][index]
                                          ['med_name'],
                                      'id': state.medicine['now'][index]['id'],
                                    };
                                  }),
                                  listMedicine: List.generate(
                                      state.medicine['now'].length, (index) {
                                    return state.medicine['now'][index]
                                        ['med_name'];
                                  }),
                                  listRedundancy: List.generate(
                                      state.medicine['now'].length, (index) {
                                    return {
                                      'name': state.medicine['now'][index]
                                          ['med_name'],
                                      'redundancy': state.medicine['now'][index]
                                          ['timing'],
                                    };
                                  }),
                                  listQuantity: List.generate(
                                      state.medicine['now'].length, (index) {
                                    return {
                                      'name': state.medicine['now'][index]
                                          ['med_name'],
                                      'quantity': state.medicine['now'][index]
                                          ['dose'],
                                    };
                                  }),
                                );
                              } else
                                return Text('error');
                            },
                          ));
                },
                icon: const Icon(
                  Icons.add_circle_outline_sharp,
                  size: 71,
                  color: Color.fromRGBO(38, 115, 221, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
