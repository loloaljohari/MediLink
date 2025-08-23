import 'package:MediLink/lojain/models/alarm/getAlarms.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Services/AlarmWidegt/alarmMadicen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Controllers/onboarding/SelectionLang.dart';

class MyAlarmMedication extends StatelessWidget {
  const MyAlarmMedication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GetAlarmsCubit>().fetch();
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          child:  Text(
          context.watch<Selection>().state == 1
                                    ? 'منبهاتي الطبية':   'My Alarm medication',
            style: TextStyle(
                 fontWeight: FontWeight.w700, fontSize: 14),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AlarmMadicen(),
            ));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 4),
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            height: 86,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: const Color.fromRGBO(38, 115, 221, 0.1)),
            child: Row(
              children: [
                Container(
                  width: 37,
                  height: 37,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset('images/Group 1017.png'),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.66,
                        child: BlocBuilder<GetAlarmsCubit, GetAlarmsState>(
                            builder: (context, state) {
                          if (state is GetAlarmsLoaded) {
                         if(state.alarms.containsKey('data')&& state.alarms['data'].length!=0)  { return Text(
                              context.watch<Selection>().state == 1
                                    ? ' منبه ${state.alarms['data'].length}': '${state.alarms['data'].length} Alarm',
                              style: TextStyle(
                                  
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20),
                            );
                         } 
                         else return Text(
                              context.watch<Selection>().state == 1 ? 'اضفط لاضافة منبه \nلاجل تذكيرك بادويتك '   :   'click to add alarm \nfor remember your madicine',
                              style: TextStyle(
                                  
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15),
                            );

                         } else
                            return Text(
                           context.watch<Selection>().state == 1
                                    ? 'عدة منبهات':    'many Alarm',
                              style: TextStyle(
                                  
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20),
                            );
                        })),
                  //   SizedBox(
                  //       width: MediaQuery.of(context).size.width * 0.66,
                  //       child: Text(
                  //         'After 30 minute',
                  //         style: TextStyle(
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.w400,
                  //             fontSize: 12),
                  //       )),
                  // 
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Color.fromRGBO(38, 115, 221, 1),
                ),
              ],
            ),
          ),
        ),
      ],
    );
    
  }
}
