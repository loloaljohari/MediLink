import 'package:MediLink/ammar/lib/view/screen/aouth/sinup.dart';
import 'package:MediLink/lojain/Controllers/doctors/Month.dart';
import 'package:MediLink/lojain/Controllers/doctors/SelectThetime.dart';
import 'package:MediLink/lojain/Controllers/doctors/Selecttheday.dart';
import 'package:MediLink/lojain/Controllers/onboarding/SelectionLang.dart';
import 'package:MediLink/lojain/View/Home/FillOutRecord.dart';
import 'package:MediLink/lojain/models/Doctors/getDaysForDoctor.dart';
import 'package:MediLink/lojain/models/Doctors/getDoctorinfo.dart';
import 'package:MediLink/lojain/models/Doctors/getTimes.dart';
import 'package:MediLink/lojain/models/Doctors/postArriveClinic.dart';
import 'package:MediLink/lojain/models/Doctors/postBook.dart';
import 'package:MediLink/main.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Doctors/ButtonDay.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Doctors/ButtonTime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorInfo extends StatelessWidget {
  final id;

  DoctorInfo({super.key, required this.id});

  void showMonthDialog(BuildContext context) {
    final baseMonth = DateTime(DateTime.now().year, DateTime.now().month);

    final months = List.generate(12, (index) {
      return DateTime(baseMonth.year, baseMonth.month + index);
    });

    showDialog(
      context: context,
      builder: (context) {
        String langCode = context.watch<Selection>().state == 1 ? 'ar' : 'en';
        return AlertDialog(
          backgroundColor: Color.fromRGBO(113, 172, 255, 0.607),
          contentPadding: const EdgeInsets.symmetric(vertical: 1),
          content: SizedBox(
            width: double.maxFinite,
            height: 390,
            child: Center(
              child: Container(
                padding: EdgeInsets.only(top: 3),
                height: 370,
                width: 310,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 350,
                            width: 320,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(15, 102, 222, 1)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 8,
                                            color: const Color.fromARGB(
                                                214, 0, 0, 0),
                                            offset: Offset(0, 4))
                                      ],
                                      color: Color.fromRGBO(85, 156, 255, 1),
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: GridView.builder(
                                      padding: EdgeInsets.all(5),
                                      shrinkWrap: true,
                                      itemCount: months.length,
                                      itemBuilder: (context, index) {
                                        final month = months[index];
                                        final label =
                                            DateFormat('MMMM yyyy', langCode)
                                                .format(month);
                                        return InkWell(
                                          onTap: () {
                                            context
                                                .read<MonthCubit>()
                                                .selectMonth(month);
                                            var date = context
                                                .read<MonthCubit>()
                                                .state;
                                            context
                                                .read<GetDaysForDoctorCubit>()
                                                .fetchProfile(
                                                    id: id,
                                                    year: date.year,
                                                    month: date.month);
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 0.3,
                                                    color: Color.fromRGBO(
                                                        23, 54, 97, 1),
                                                    offset: Offset(0, 4))
                                              ],
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                child: Text(
                                                  label,
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          15, 102, 222, 1),
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 4,
                                              mainAxisExtent: 50,
                                              mainAxisSpacing: 35,
                                              crossAxisSpacing: 8)),
                                ),
                              ],
                            )),
                      ),
                      Container(
                        width: 200,
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 20,
                              width: 8,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 0.3,
                                        color:
                                            const Color.fromARGB(214, 0, 0, 0),
                                        offset: Offset(0, 4))
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                            Container(
                              height: 20,
                              width: 8,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 0.3,
                                        color:
                                            const Color.fromARGB(214, 0, 0, 0),
                                        offset: Offset(0, 4))
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                            Container(
                              height: 20,
                              width: 8,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 0.3,
                                        color:
                                            const Color.fromARGB(214, 0, 0, 0),
                                        offset: Offset(0, 4))
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                            Container(
                              height: 20,
                              width: 8,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 0.3,
                                        color:
                                            const Color.fromARGB(214, 0, 0, 0),
                                        offset: Offset(0, 4))
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                            Container(
                              height: 20,
                              width: 8,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 0.3,
                                        color:
                                            const Color.fromARGB(214, 0, 0, 0),
                                        offset: Offset(0, 4))
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                            Container(
                              height: 20,
                              width: 8,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 0.3,
                                        color:
                                            const Color.fromARGB(214, 0, 0, 0),
                                        offset: Offset(0, 4))
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                            Container(
                              height: 20,
                              width: 8,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 0.3,
                                        color:
                                            const Color.fromARGB(214, 0, 0, 0),
                                        offset: Offset(0, 4))
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                            Container(
                              height: 20,
                              width: 8,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 0.3,
                                        color:
                                            const Color.fromARGB(214, 0, 0, 0),
                                        offset: Offset(0, 4))
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void showBookedDialog(BuildContext context, id) {
    TextEditingController controller = TextEditingController();
    showDialog(
      useRootNavigator: false,
      useSafeArea: false,
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 150,
            child: Column(
              children: [
                Text(
                    'The reservation has been made , but we need to know how long it will take you to arrive at the clinic!'),
                TextField(
                  controller: controller,
                  decoration:
                      InputDecoration(hintText: 'enter the time in minute'),
                )
              ],
            ),
          ),
          actions: [
            BlocBuilder<PostArriveClinic, bool>(
              builder: (context1, state) {
                return ElevatedButton(
                    onPressed: () async {
                      bool isSuccess = await context1
                          .read<PostArriveClinic>()
                          .post(id: id, arrivved_time: controller.text);
                      if (isSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Color.fromRGBO(20, 210, 86, 1),
                            content: Text('success'),
                          ),
                        );
                        Get.back();
                      } else
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Color.fromRGBO(210, 48, 20, 1),
                            content: Text('error'),
                          ),
                        );
                    },
                    child:state? CircularProgressIndicator(): Text('save'));
              }, 
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var date = context.read<MonthCubit>().state;
    context
        .read<GetDaysForDoctorCubit>()
        .fetchProfile(id: id, year: date.year, month: date.month);
    context.read<GetDoctorinfoCubit>().fetchProfile(id);
    var day = context.read<Selecttheday>().state;
    context.read<GetTimesCubit>().fetchProfile(id: id, date: day);

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
        title: const Padding(
          padding: EdgeInsets.only(left: 70),
          child: Text(
            'Doctor’s info',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: BlocBuilder<GetDoctorinfoCubit, GetDoctorinfoState>(
        builder: (context, state) {
          if (state is GetDoctorinfoLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (state is GetDoctorinfoLoaded) {
            return Column(
              children: [
                Container(
                  height: 264,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('images/Vector (4).png'),
                      Image.network(state.info['data']['photo'])
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(38, 115, 221, 0.1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    child: Expanded(
                      child: ListView(
                        children: [
                          const SizedBox(
                            height: 48,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Dr. ${state.info['data']['name']}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${state.info['data']['rating']}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(212, 184, 41, 1),
                                    size: 16.7,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Divider(
                              color: Color.fromRGBO(38, 115, 221, 0.3),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset('images/Vector (3).png'),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        'Assignment',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                125, 138, 149, 1),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    state.info['data']['specialty'],
                                    style: const TextStyle(
                                        color: Color.fromRGBO(145, 154, 162, 1),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset('images/Internship.png'),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        'Experience',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                125, 138, 149, 1),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    ' ${state.info['data']['experience_years']} Years',
                                    style: TextStyle(
                                        color: Color.fromRGBO(125, 138, 149, 1),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset('images/li_clock.png'),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        'Time',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                125, 138, 149, 1),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    '${state.info['data']['schedules'][0]['start_time']} - ${state.info['data']['schedules'][0]['end_time']}',
                                    style: TextStyle(
                                        color: Color.fromRGBO(125, 138, 149, 1),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'About me',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
                          ),
                          Expanded(
                              child: RichText(
                                  text: TextSpan(
                            children: [
                              TextSpan(
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 0.6),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                  text: state.info['data']['biography']),
                              TextSpan(
                                text: ' read more',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        Color.fromRGBO(38, 115, 221, 1),
                                    decorationThickness: 2,
                                    color: Color.fromRGBO(38, 115, 221, 1),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              )
                            ],
                          ))),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Day',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20),
                              ),
                              BlocBuilder<MonthCubit, DateTime>(
                                  builder: (context, selectedMonth) {
                                String monthName = DateFormat(
                                  'MMMM yyyy',
                                ).format(selectedMonth);

                                return InkWell(
                                    onTap: () {
                                      showMonthDialog(context);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          monthName,
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  38, 115, 221, 1),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 1.0, top: 1),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color:
                                                Color.fromRGBO(38, 115, 221, 1),
                                            size: 10,
                                          ),
                                        )
                                      ],
                                    ));
                              }),
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          BlocBuilder<GetDaysForDoctorCubit,
                              GetDaysForDoctorState>(
                            builder: (context, state) {
                              if (state is GetDaysForDoctorLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is GetDaysForDoctorLoaded) {
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                      children: List.generate(
                                    state.days['data'].length,
                                    (index) {
                                      return ButtonDay(
                                        id: id,
                                        isfall: state.days['data'][index]
                                            ['isfull'],
                                        date: state.days['data'][index]['date'],
                                        day: state.days['data'][index]
                                                ['day_name']
                                            .toString()
                                            .split('')
                                            .takeWhile((value) => value != 'd')
                                            .join(),
                                        color: state.days['data'][index]
                                            ['color'],
                                      );
                                    },
                                  )),
                                );
                              } else
                                return SizedBox();
                            },
                          ),
                          const SizedBox(
                            height: 19,
                          ),
                          const Text(
                            'Time',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
                          ),
                          BlocBuilder<GetTimesCubit, GetTimesState>(
                            builder: (context, state) {
                              if (state is GetTimesLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is GetTimesLoaded) {
                                if (state.times.containsKey('data')) {
                                  return Container(
                                      child: Expanded(
                                    child: GridView(
                                        shrinkWrap: true,
                                        children: List.generate(
                                          state.times['data'].length,
                                          (index) {
                                            if (index + 1 <
                                                state.times['data'].length)
                                              return ButtonTime(
                                                  isfall: state.times['data']
                                                      [index + 1]['isfull'],
                                                  date: state.times['data']
                                                      [index + 1]['time']);
                                            return SizedBox();
                                          },
                                        ),
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisExtent: 34,
                                          mainAxisSpacing: 10,
                                        )),
                                  ));
                                } else
                                  return SizedBox();
                              } else
                                return SizedBox();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BlocBuilder<PostBook, bool>(
                            builder: (context, state) {
                              return ElevatedButton(
                                style: ButtonStyle(
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16))),
                                    fixedSize: const WidgetStatePropertyAll(
                                        Size(double.infinity, 42)),
                                    backgroundColor:
                                        const WidgetStatePropertyAll(
                                            Color.fromRGBO(38, 115, 221, 1))),
                                onPressed: () async {
                                  SharedPreferences sharedPreferences =
                                      await SharedPreferences.getInstance();
                                  var saveInfoRecord = sharedPreferences
                                      .getBool('saveInfoRecord');
                                  if (saveInfoRecord!) {
                                    var time =
                                        context.read<Selectthetime>().state;
                                    var day =
                                        context.read<Selecttheday>().state;
                                    print(day);
                                    Map isSuccess = await context
                                        .read<PostBook>()
                                        .post(id: id, date: day, time: time);
                                    if (isSuccess.containsKey('appointment')) {
                                      showBookedDialog(context,
                                          isSuccess['appointment']['id']);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            backgroundColor:
                                                Color.fromRGBO(53, 139, 232, 1),
                                            content: Row(
                                              children: [
                                                Text(
                                                    'you should to have an account'),
                                                TextButton(
                                                    onPressed: () {
                                                      Get.to(Sinup(
                                                          conte: context));
                                                    },
                                                    child: Text('register'))
                                              ],
                                            )),
                                      );

                                      // ScaffoldMessenger.of(context).showSnackBar(
                                      //   SnackBar(
                                      //       backgroundColor:
                                      //           Color.fromRGBO(65, 206, 33, 1),
                                      //       content:
                                      //           Text('success , but you should '),

                                      //       ),
                                      // );
                                    }
                                  } else
                                    Get.to(FillOutRecord(
                                      cont: context,
                                    ));
                                },
                                child: state
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : Text(
                                        'Book Now',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          } else
            return SizedBox();
        },
      ),
    );
  }
}
