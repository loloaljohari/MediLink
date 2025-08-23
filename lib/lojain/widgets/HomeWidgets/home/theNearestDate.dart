import 'package:MediLink/ammar/lib/view/screen/aouth/sinup.dart';
import 'package:MediLink/lojain/models/Dates/deleteDate.dart';
import 'package:MediLink/lojain/models/Dates/getDates.dart';
import 'package:MediLink/lojain/models/Dates/getNearestdate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controllers/home/NavigationCubit.dart';
import '../../../Controllers/onboarding/SelectionLang.dart';
import '../../../Controllers/onboarding/SelectionTheme.dart';

class TheNearestDate extends StatelessWidget {
  final String Imagepath;
  final String namedoctor;
  final String medSpecialty;
  final String Date;
  final String Time;
  final bool Dates;
  final idApp;
  const TheNearestDate(
      {Key? key,
      required this.Imagepath,
      required this.namedoctor,
      required this.medSpecialty,
      required this.Date,
      required this.Time,
      required this.Dates,
      required this.idApp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mode = context.watch<SelectionTheme>().state;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 358,
          height: Dates ? 185 : 229,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(38, 115, 221, 1).withOpacity(0.20),
              borderRadius: BorderRadius.circular(20)),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          width: 358,
          height: Dates ? 175 : 219,
          decoration: BoxDecoration(
              color: mode == 4
                  ? Color.fromRGBO(35, 103, 198, 0.742)
                  : const Color.fromRGBO(38, 115, 221, 1),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 62,
                    height: 62,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            width: 2,
                            color: mode == 4
                                ? Color.fromRGBO(35, 103, 198, 0.742)
                                : const Color.fromRGBO(38, 115, 221, 1)),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.881),
                              blurRadius: 2,
                              offset: Offset(0, 2),
                              spreadRadius: 0)
                        ]),
                    child: ClipOval(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 2.3),
                        child: Container(
                          width: 62,
                          height: 62,
                          decoration: BoxDecoration(
                              color: mode == 4
                                  ? Color.fromRGBO(35, 103, 198, 0.742)
                                  : const Color.fromRGBO(38, 115, 221, 1),
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    blurRadius: 2,
                                    offset: Offset(0, -290),
                                    spreadRadius: 9)
                              ]),
                          child: ClipOval(
                              child: Padding(
                            padding: const EdgeInsets.only(
                                top: 3.0, left: 8, right: 8),
                            child: Image.network(
                              Imagepath,
                              fit: BoxFit.fill,
                            ),
                          )),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('images/Vector333.png'),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                namedoctor,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 14),
                              )
                            ],
                          )),
                      SizedBox(
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('images/Vector9.png'),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                medSpecialty,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 10),
                              )
                            ],
                          )),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Dates
                      ? BlocBuilder<DeleteDate, dynamic>(
                          builder: (context, state) {
                            return InkWell(
                              onTap: () async {
                                bool isSuccess = await context
                                    .read<DeleteDate>()
                                    .post(idApp: idApp);
                                if (isSuccess) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor:
                                          Color.fromRGBO(20, 210, 23, 1),
                                      content: Text('success'),
                                    ),
                                  );
                                  context
                                      .read<GetNearestdateCubit>()
                                      .fetchProfile();
                                } else
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor:
                                          Color.fromRGBO(210, 48, 20, 1),
                                      content: Text('error'),
                                    ),
                                  );
                              },
                              child: state == idApp
                                  ? CircularProgressIndicator()
                                  : Column(
                                      children: [
                                        Icon(
                                          Icons.cancel_outlined,
                                          size: 36,
                                          color: Color.fromRGBO(168, 40, 48, 1),
                                        ),
                                        Text(
                                          context.watch<Selection>().state == 1
                                              ? 'الغاء'
                                              : 'Cancel',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  168, 40, 48, 1),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                            );
                          },
                        )
                      : const SizedBox()
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('images/Group 830.png'),
                  const SizedBox(
                    width: 9,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 80,
                        child: Text(
                          textAlign: TextAlign.left,
                          context.watch<Selection>().state == 1
                              ? 'التاريخ'
                              : 'Date',
                          style: const TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.6),
                              fontWeight: FontWeight.w700,
                              fontSize: 10),
                        ),
                      ),
                      Text(
                        Date,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 10),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Image.asset('images/Group 832.png'),
                  const SizedBox(
                    width: 9,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 70,
                        child: Text(
                          textAlign: TextAlign.left,
                          context.watch<Selection>().state == 1
                              ? 'الوقت'
                              : 'Time',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.6),
                              fontWeight: FontWeight.w700,
                              fontSize: 10),
                        ),
                      ),
                      Text(
                        Time,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 10),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Dates
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BlocBuilder<NavigationCubit, int>(
                          builder: (context, state) {
                            return ElevatedButton(
                                style: ButtonStyle(
                                    overlayColor:
                                        WidgetStatePropertyAll(Colors.white30),
                                    fixedSize:
                                        WidgetStatePropertyAll(Size(123, 35)),
                                    backgroundColor: WidgetStatePropertyAll(
                                        mode == 4
                                            ? Color.fromRGBO(
                                                221, 220, 220, 0.785)
                                            : Color.fromRGBO(18, 18, 18, 1))),
                                onPressed: () {
                                  context.read<NavigationCubit>().changePage(3);
                                },
                                child: Row(
                                  children: [
                                    Image.asset('images/Vector11.png'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      context.watch<Selection>().state==1?'التفاصيل': 'Details',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: mode == 4
                                              ? Colors.black
                                              : Color.fromRGBO(
                                                  38, 115, 221, 1)),
                                    )
                                  ],
                                ));
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        BlocBuilder<DeleteDate, dynamic>(
                          builder: (context, state) {
                            return ElevatedButton(
                                style: ButtonStyle(
                                    overlayColor:
                                        WidgetStatePropertyAll(Colors.white30),
                                    fixedSize:
                                        WidgetStatePropertyAll(Size(123, 35)),
                                    backgroundColor: WidgetStatePropertyAll(
                                        Color.fromRGBO(168, 40, 48, 1))),
                                onPressed: () async {
                                  bool isSuccess = await context
                                      .read<DeleteDate>()
                                      .post(idApp: idApp);
                                  if (isSuccess) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor:
                                            Color.fromRGBO(20, 210, 23, 1),
                                        content: Text('success'),
                                      ),
                                    );
                                    context
                                        .read<GetNearestdateCubit>()
                                        .fetchProfile();
                                  } else
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor:
                                            Color.fromRGBO(210, 48, 20, 1),
                                        content: Text('error'),
                                      ),
                                    );
                                },
                                child: state == idApp
                                    ? CircularProgressIndicator()
                                    : Row(
                                        children: [
                                          Image.asset('images/Vector12.png'),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            context.watch<Selection>().state ==
                                                    1
                                                ? 'الغاء'
                                                : 'Cancel',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          )
                                        ],
                                      ));
                          },
                        )
                      ],
                    )
            ],
          ),
        ),
      ],
    );
  }
}
