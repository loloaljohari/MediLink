import 'package:MediLink/ammar/lib/view/screen/aouth/sinup.dart';
import 'package:MediLink/lojain/Controllers/doctors/Month.dart';
import 'package:MediLink/lojain/Controllers/doctors/SelectThetime.dart';
import 'package:MediLink/lojain/Controllers/doctors/Selecttheday.dart';
import 'package:MediLink/lojain/Controllers/onboarding/SelectionLang.dart';
import 'package:MediLink/lojain/Controllers/onboarding/SelectionTheme.dart';
import 'package:MediLink/lojain/View/Home/FillOutRecord.dart';
import 'package:MediLink/lojain/models/Doctors/getDaysForDoctor.dart';
import 'package:MediLink/lojain/models/Doctors/getDoctorinfo.dart';
import 'package:MediLink/lojain/models/Doctors/getTimes.dart';
import 'package:MediLink/lojain/models/Doctors/postArriveClinic.dart';
import 'package:MediLink/lojain/models/Doctors/postBook.dart';
import 'package:MediLink/lojain/models/record/Getpatientrecord/pulbicmodel.dart';
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
                    border: Border.all(width: 1),
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
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    blurRadius: 0.3,
                                    color: const Color.fromARGB(214, 0, 0, 0),
                                    offset: Offset(0, 4))
                              ], borderRadius: BorderRadius.circular(3)),
                            ),
                            Container(
                              height: 20,
                              width: 8,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    blurRadius: 0.3,
                                    color: const Color.fromARGB(214, 0, 0, 0),
                                    offset: Offset(0, 4))
                              ], borderRadius: BorderRadius.circular(3)),
                            ),
                            Container(
                              height: 20,
                              width: 8,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    blurRadius: 0.3,
                                    color: const Color.fromARGB(214, 0, 0, 0),
                                    offset: Offset(0, 4))
                              ], borderRadius: BorderRadius.circular(3)),
                            ),
                            Container(
                              height: 20,
                              width: 8,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    blurRadius: 0.3,
                                    color: const Color.fromARGB(214, 0, 0, 0),
                                    offset: Offset(0, 4))
                              ], borderRadius: BorderRadius.circular(3)),
                            ),
                            Container(
                              height: 20,
                              width: 8,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    blurRadius: 0.3,
                                    color: const Color.fromARGB(214, 0, 0, 0),
                                    offset: Offset(0, 4))
                              ], borderRadius: BorderRadius.circular(3)),
                            ),
                            Container(
                              height: 20,
                              width: 8,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    blurRadius: 0.3,
                                    color: const Color.fromARGB(214, 0, 0, 0),
                                    offset: Offset(0, 4))
                              ], borderRadius: BorderRadius.circular(3)),
                            ),
                            Container(
                              height: 20,
                              width: 8,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    blurRadius: 0.3,
                                    color: const Color.fromARGB(214, 0, 0, 0),
                                    offset: Offset(0, 4))
                              ], borderRadius: BorderRadius.circular(3)),
                            ),
                            Container(
                              height: 20,
                              width: 8,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    blurRadius: 0.3,
                                    color: const Color.fromARGB(214, 0, 0, 0),
                                    offset: Offset(0, 4))
                              ], borderRadius: BorderRadius.circular(3)),
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

  void showBookedDialog(BuildContext context, BuildContext scaffold, id) {
    var mode = context.read<SelectionTheme>().state;

    TextEditingController controller = TextEditingController();
    showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(31, 90, 172, 0.961),
          content: Container(
            height: 150,
            child: Column(
              children: [
                Text(
                  style: TextStyle(color: mode == 4 ? Colors.white : Colors.black),
                      context.read<Selection>().state == 1
                                  ? 'تمت حجز الموعد، ولكننا بحاجة إلى معرفة كم من الوقت سيستغرق وصولك إلى العيادة!'
                                  :   'The reservation has been made , but we need to know how long it will take you to arrive at the clinic!'),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  cursorColor: Colors.white,
                  controller: controller,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 18,color:mode == 4 ? Colors.white : Colors.black ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: mode == 4 ? Colors.white : Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: mode == 4 ? Colors.white : Colors.black)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: mode == 4 ? Colors.white : Colors.black)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: mode == 4 ? Colors.white : Colors.black)),
                      labelStyle: TextStyle(fontSize: 18,color:mode == 4 ? Colors.white : Colors.black ),
                      labelText:     context.read<Selection>().state == 1
                                  ? ' ادخل الوقت (دقيقة)'
                                  :  'enter the time  (minute)'),
                )
              ],
            ),
          ),
          actions: [
            BlocBuilder<PostArriveClinic, bool>(
              builder: (context, state) {
                return ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                      mode == 4 ? Colors.white : Colors.black,
                    )),
                    onPressed: () async {
                      bool isSuccess = await context
                          .read<PostArriveClinic>()
                          .post(id: id, arrivved_time: controller.text);
                      if (isSuccess) {
                        ScaffoldMessenger.of(scaffold).showSnackBar(
                          SnackBar(
                            backgroundColor: Color.fromRGBO(20, 210, 86, 1),
                            content: Text('success'),
                          ),
                        );
                        Get.back();
                      } else
                        ScaffoldMessenger.of(scaffold).showSnackBar(
                          SnackBar(
                            backgroundColor: Color.fromRGBO(210, 48, 20, 1),
                            content: Text('error'),
                          ),
                        );
                    },
                    child: state
                        ? CircularProgressIndicator(
                            color: Color.fromRGBO(31, 90, 172, 0.961),
                          )
                        : Text(
                           context.watch<Selection>().state == 1
                                  ? 'حفظ'
                                  :   'save',
                            style: TextStyle(
                                color: Color.fromRGBO(31, 90, 172, 0.961),
                                fontSize: 18),
                          ));
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var mode = context.watch<SelectionTheme>().state;

    var date = context.read<MonthCubit>().state;
    context
        .read<GetDaysForDoctorCubit>()
        .fetchProfile(id: id, year: date.year, month: date.month);
    context.read<GetDoctorinfoCubit>().fetchProfile(id);
    var day = context.read<Selecttheday>().state;
    context.read<GetTimesCubit>().fetchProfile(id: id, date: day);

    return Scaffold(
      // background ,
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
        title: Padding(
          padding: EdgeInsets.only(left: 70, right: 70),
          child: Text(
            context.watch<Selection>().state == 1
                ? 'معلومات الطبيب'
                : 'Doctor’s info',
            // style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: BlocBuilder<GetDoctorinfoCubit, GetDoctorinfoState>(
        builder: (context, state) {
          if (state is GetDoctorinfoLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: mode == 4 ? Colors.black : Colors.white,
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
                                context.watch<Selection>().state == 1
                                    ? 'د. ${state.info['data']['name']}'
                                    : "Dr. ${state.info['data']['name']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 24),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${state.info['data']['rating']}",
                                    style: const TextStyle(
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
                                      Text(
                                        context.watch<Selection>().state == 1
                                            ? 'الأختصاص'
                                            : 'Assignment',
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
                                      Text(
                                        context.watch<Selection>().state == 1
                                            ? 'الخبرة'
                                            : 'Experience',
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
                                      Text(
                                        context.watch<Selection>().state == 1
                                            ? 'الوقت'
                                            : 'Time',
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
                          Text(
                            context.watch<Selection>().state == 1
                                ? 'نبذة عني'
                                : 'About me',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 20),
                          ),
                          Expanded(
                              child: RichText(
                                  text: TextSpan(
                            children: [
                              TextSpan(
                                  style: TextStyle(
                                      color: mode == 4
                                          ? const Color.fromARGB(
                                              255, 117, 117, 117)
                                          : Color.fromRGBO(255, 255, 255, 0.6),
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
                              Text(
                                context.watch<Selection>().state == 1
                                    ? 'اليوم'
                                    : 'Day',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 20),
                              ),
                              BlocBuilder<MonthCubit, DateTime>(
                                  builder: (context, selectedMonth) {
                                String monthName = DateFormat(
                                        'MMMM yyyy',
                                        context.watch<Selection>().state == 1
                                            ? 'ar'
                                            : 'en')
                                    .format(selectedMonth);

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
                                  child: CircularProgressIndicator(
                                      color: context
                                                  .watch<SelectionTheme>()
                                                  .state ==
                                              3
                                          ? Colors.white
                                          : Colors.black),
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
                                                ['day_name']=='Wednesday' ?'Wednes' : state.days['data'][index]
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
                           Text(
 context.watch<Selection>().state == 1
                                  ? 'الوقت'
                                  : 'Time',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 20),
                          ),
                          BlocBuilder<GetTimesCubit, GetTimesState>(
                            builder: (context, state) {
                              if (state is GetTimesLoading) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color:
                                        mode == 4 ? Colors.black : Colors.white,
                                  ),
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
                                  return SizedBox(
                                    child: Text(
                                      context.watch<Selection>().state == 1
                                  ? 'عليك اختيار اليوم اولا!'
                                  :  'you should choice the day! '),
                                  );
                              } else
                                return SizedBox(
                                  child: Text(   context.watch<Selection>().state == 1
                                  ? 'عليك اختيار اليوم اولا!'
                                  :  'you should choice the day! '),
                                );
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
                                    backgroundColor: WidgetStatePropertyAll(
                                        mode == 4
                                            ? Color.fromRGBO(38, 115, 221, 1)
                                            : Color.fromRGBO(
                                                116, 164, 232, 1))),
                                onPressed: () async {
                                  Map data= await context.read<GetPublicCubit>().fetch();
                                  print(data);
                                  if (data.containsKey('message')&& data['message']== "Data has not been entered yet") {
                                  Get.to(FillOutRecord(
                                      cont: context,
                                    ));
                                    
                                  } else if(data.containsKey('data')){
                                  var time =
                                        context.read<Selectthetime>().state;
                                    var day =
                                        context.read<Selecttheday>().state;
                                    print(day);
                                    Map isSuccess = await context
                                        .read<PostBook>()
                                        .post(id: id, date: day, time: time);
                                    if (isSuccess.containsKey('appointment')) {
                                      showBookedDialog(context, context,
                                          isSuccess['appointment']['id']);
                                    } else {
                                         ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            backgroundColor:
                                                Color.fromRGBO(179, 38, 38, 1),
                                            content: Row(
                                              children: [
                                                Text(
                                                    'error'),
                                              
                                              ],
                                            )),
                                      );
                                     
                                    }
                                  }
                                  else{
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
                                     
                                  }
                                    
                                },
                                child: state
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : Text(
                                           context.watch<Selection>().state == 1
                                  ? 'احجز الآن'
                                  :  'Book Now',
                                        style: TextStyle(
                                            color: mode == 4
                                                ? Colors.white
                                                : Colors.black,
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
