import 'package:MediLink/lojain/Controllers/mydates/ButtonsDates.dart';
import 'package:MediLink/lojain/Controllers/onboarding/SelectionTheme.dart';
import 'package:MediLink/lojain/Static/Static.dart';
import 'package:MediLink/lojain/models/Dates/getDates.dart';
import 'package:MediLink/lojain/models/Dates/getNearestdate.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Mydate/DateWidget.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/home/theNearestDate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Controllers/onboarding/SelectionLang.dart';

class Mydates extends StatelessWidget {
  Mydates({Key? key}) : super(key: key);
  int Select = 0;
  @override
  Widget build(BuildContext context) {
    
    context.read<GetDatesCubit>().fetchProfile();
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child:  Text(
          context.watch<Selection>().state == 1 ? 'مواعيدي'   :'My Dates',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),

        )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          children: [
            // Row(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(left: 19.0),
            //       child: Image.asset('images/Vector4.png'),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.only(left: 15.0),
            //       child: Text(
            //         'Upcoming Date',
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontWeight: FontWeight.w700,
            //             fontSize: 20),
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 7,
            // ),
            BlocBuilder<GetNearestdateCubit, GetNearestdateState>(
              builder: (context, state) {
                if (state is GetNearestdateLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is GetNearestdateLoaded) {
                  return state.dates['appointment'] == null
                      ? SizedBox()
                      : Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 19.0),
                                  child: Image.asset('images/Vector4.png'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                   context.watch<Selection>().state == 1 ? 'الموعد الاقرب'   :    'Upcoming Date',
                                    style: TextStyle(
                                        // color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            TheNearestDate(
                              Dates: true,
                              idApp: state.dates['appointment']['id'],
                              Imagepath: state.dates['appointment']
                                  ['doctor_photo'],
                              medSpecialty: state.dates['appointment']
                                  ['specialization'],
                              namedoctor:
                                  "Dr. ${state.dates['appointment']['doctor_name']}",
                              Date:
                                  '${state.dates['appointment']['date']} , ${state.dates['appointment']['day']}',
                              Time:
                                  '${state.dates['appointment']['start_time'].toString().substring(0, 5)}-${state.dates['appointment']['end_time'].toString().substring(0, 5)}',
                            ),
                             SizedBox(
              height: 15,
            ),
                          ],
                        );
                } else
                  return SizedBox();
              },
            ),

           
            BlocBuilder<Buttonsdates, int>(builder: (context, index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: index == 0
                                  ? WidgetStatePropertyAll(
                                      Color.fromRGBO(38, 115, 221, 1))
                                  : WidgetStatePropertyAll(context.watch<SelectionTheme>().state==4?Color.fromRGBO(221, 221, 221, 1): Colors.transparent),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: Color.fromRGBO(
                                              38, 115, 221, 0.3))))),
                          onPressed: () {
                            context.read<Buttonsdates>().selectButton(0);
                          },
                          child: Text(
                             context.watch<Selection>().state == 1 ? 'المؤكدة'   :  'Confirmed',
                            style: TextStyle(
                                color:index==0? Colors.white: (context.watch<SelectionTheme>().state ==4)? Color.fromRGBO(38, 115, 221, 1): Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          )),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: index == 1
                                  ? WidgetStatePropertyAll(
                                      Color.fromRGBO(38, 115, 221, 1))
                                  : WidgetStatePropertyAll(context.watch<SelectionTheme>().state==4?Color.fromRGBO(221, 221, 221, 1): Colors.transparent),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: Color.fromRGBO(
                                              38, 115, 221, 0.3))))),
                          onPressed: () {
                            context.read<Buttonsdates>().selectButton(1);
                          },
                          child: Text(
                           context.watch<Selection>().state == 1 ? 'قيد الانتظار'   :    'Pending',
                            style: TextStyle(
                                color:index==1? Colors.white: (context.watch<SelectionTheme>().state ==4)? Color.fromRGBO(38, 115, 221, 1): Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          )),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: index == 2
                                  ? WidgetStatePropertyAll(
                                      Color.fromRGBO(38, 115, 221, 1))
                                  : WidgetStatePropertyAll(context.watch<SelectionTheme>().state==4?Color.fromRGBO(221, 221, 221, 1): Colors.transparent),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: Color.fromRGBO(
                                              38, 115, 221, 0.3))))),
                          onPressed: () {
                            context.read<Buttonsdates>().selectButton(2);
                          },
                          child: Text(
                             context.watch<Selection>().state == 1 ? 'الملغاة'   :  'Canceled',
                            style: TextStyle(
                                color:index==2? Colors.white: (context.watch<SelectionTheme>().state ==4)? Color.fromRGBO(38, 115, 221, 1): Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          )),
                    ],
                  ),
                  index == 0
                      ? BlocBuilder<GetDatesCubit, GetDatesState>(
                          builder: (context, state) {
                            if (state is GetDatesLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (state is GetDatesLoaded) {
                              if (state.dates.containsKey('appointments')) {
                                return state.dates['appointments']['confirmed']
                                        .isEmpty
                                    ? Text('no thing')
                                    : Column(
                                        children: List.generate(
                                        state.dates['appointments']['confirmed']
                                            .length,
                                        (index) {
                                          return DateWidget(
                                            status: false,
                                            idApp: state.dates['appointments']
                                                ['confirmed'][index]['id'],
                                            Imagepath:
                                                state.dates['appointments']
                                                        ['confirmed'][index]
                                                    ['doctor_photo'],
                                            namedoctor:
                                                state.dates['appointments']
                                                        ['confirmed'][index]
                                                    ['doctor_name'],
                                            time:
                                                '${state.dates['appointments']['confirmed'][index]['start_time'].toString().substring(0, 5)}-${state.dates['appointments']['confirmed'][index]['end_time'].toString().substring(0, 5)}',
                                            date:
                                                '${state.dates['appointments']['confirmed'][index]['date']}',
                                          );
                                        },
                                      ));
                              } else
                                return Text('');
                            } else
                              return SizedBox();
                          },
                        )
                      : index == 1
                          ? BlocBuilder<GetDatesCubit, GetDatesState>(
                              builder: (context, state) {
                                if (state is GetDatesLoading) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                if (state is GetDatesLoaded) {
                                  if (state.dates.containsKey('appointments')) {
                                    return state
                                            .dates['appointments']['pending']
                                            .isEmpty
                                        ? Text('no thing')
                                        : Column(
                                            children: List.generate(
                                            state
                                                .dates['appointments']
                                                    ['pending']
                                                .length,
                                            (index) {
                                              return DateWidget(
                                                status: false,
                                                idApp: state
                                                        .dates['appointments']
                                                    ['pending'][index]['id'],
                                                Imagepath:
                                                    state.dates['appointments']
                                                            ['pending'][index]
                                                        ['doctor_photo'],
                                                namedoctor:
                                                    state.dates['appointments']
                                                            ['pending'][index]
                                                        ['doctor_name'],
                                                time:
                                                    '${state.dates['appointments']['pending'][index]['start_time'].toString().substring(0, 5)}-${state.dates['appointments']['pending'][index]['end_time'].toString().substring(0, 5)}',
                                                date:
                                                    '${state.dates['appointments']['pending'][index]['date']}',
                                              );
                                            },
                                          ));
                                  } else
                                    return Text('');
                                } else
                                  return SizedBox();
                              },
                            )
                          : BlocBuilder<GetDatesCubit, GetDatesState>(
                              builder: (context, state) {
                                if (state is GetDatesLoading) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                if (state is GetDatesLoaded) {
                                  if (state.dates.containsKey('appointments')) {
                                    return Container(
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                           context.watch<Selection>().state == 1
                                    ? 'بواسطة المريض':   'By Patient',
                                            style: TextStyle(
                                                // color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20),
                                          ),
                                          state
                                                  .dates['appointments']
                                                      ['canceled_by_patient']
                                                  .isEmpty
                                              ? Text(context.watch<Selection>().state == 1
                                    ? 'لا شيء': 'no thing')
                                              : Column(
                                                  children: List.generate(
                                                  state
                                                      .dates['appointments'][
                                                          'canceled_by_patient']
                                                      .length,
                                                  (index) {
                                                    return DateWidget(
                                                      status: true,
                                                      idApp: state.dates[
                                                                  'appointments']
                                                              [
                                                              'canceled_by_patient']
                                                          [index]['id'],
                                                      Imagepath: state.dates[
                                                                  'appointments']
                                                              [
                                                              'canceled_by_patient']
                                                          [
                                                          index]['doctor_photo'],
                                                      namedoctor: state.dates[
                                                                  'appointments']
                                                              [
                                                              'canceled_by_patient']
                                                          [
                                                          index]['doctor_name'],
                                                      time:
                                                          '${state.dates['appointments']['canceled_by_patient'][index]['start_time'].toString().substring(0, 5)}-${state.dates['appointments']['canceled_by_patient'][index]['end_time'].toString().substring(0, 5)}',
                                                      date:
                                                          '${state.dates['appointments']['canceled_by_patient'][index]['date']}',
                                                    );
                                                  },
                                                )),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Divider(),
                                          Text(
                                         context.watch<Selection>().state == 1
                                    ? 'بواسطة الطبيب':    'By Doctor',
                                            style: TextStyle(
                                                // color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20),
                                          ),
                                          state
                                                  .dates['appointments']
                                                      ['canceled_by_doctor']
                                                  .isEmpty
                                              ? Text(context.watch<Selection>().state == 1
                                    ? 'لا شيء': 'no thing')
                                              : Column(
                                                  children: List.generate(
                                                  state
                                                      .dates['appointments']
                                                          ['canceled_by_doctor']
                                                      .length,
                                                  (index) {
                                                    return DateWidget(
                                                      status: true,
                                                      idApp: state.dates[
                                                                  'appointments']
                                                              [
                                                              'canceled_by_doctor']
                                                          [index]['id'],
                                                      Imagepath: state.dates[
                                                                  'appointments']
                                                              [
                                                              'canceled_by_doctor']
                                                          [
                                                          index]['doctor_photo'],
                                                      namedoctor: state.dates[
                                                                  'appointments']
                                                              [
                                                              'canceled_by_doctor']
                                                          [
                                                          index]['doctor_name'],
                                                      time:
                                                          '${state.dates['appointments']['canceled_by_doctor'][index]['start_time'].toString().substring(0, 5)}-${state.dates['appointments']['canceled_by_doctor'][index]['end_time'].toString().substring(0, 5)}',
                                                      date:
                                                          '${state.dates['appointments']['canceled_by_doctor'][index]['date']}',
                                                    );
                                                  },
                                                )),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Divider(),
                                          Text(
                                          context.watch<Selection>().state == 1
                                    ? 'بواسطة السكرتيرة':   'By Secretary',
                                            style: TextStyle(
                                                // color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20),
                                          ),
                                          state
                                                  .dates['appointments']
                                                      ['canceled_by_secretary']
                                                  .isEmpty
                                              ? Text('no thing')
                                              : Column(
                                                  children: List.generate(
                                                  state
                                                      .dates['appointments'][
                                                          'canceled_by_secretary']
                                                      .length,
                                                  (index) {
                                                    return DateWidget(
                                                      status: true,
                                                      idApp: state.dates[
                                                                  'appointments']
                                                              [
                                                              'canceled_by_secretary']
                                                          [index]['id'],
                                                      Imagepath: state.dates[
                                                                  'appointments']
                                                              [
                                                              'canceled_by_secretary']
                                                          [
                                                          index]['doctor_photo'],
                                                      namedoctor: state.dates[
                                                                  'appointments']
                                                              [
                                                              'canceled_by_secretary']
                                                          [
                                                          index]['doctor_name'],
                                                      time:
                                                          '${state.dates['appointments']['canceled_by_secretary'][index]['start_time'].toString().substring(0, 5)}-${state.dates['appointments']['canceled_by_secretary'][index]['end_time'].toString().substring(0, 5)}',
                                                      date:
                                                          '${state.dates['appointments']['canceled_by_secretary'][index]['date']}',
                                                    );
                                                  },
                                                )),
                                        ],
                                      ),
                                    );
                                  } else
                                    return Text('');
                                } else
                                  return SizedBox();
                              },
                            )
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
