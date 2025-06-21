import 'package:MediLink/Controllers/doctors/Month.dart';
import 'package:MediLink/Controllers/onboarding/SelectionLang.dart';
import 'package:MediLink/main.dart';
import 'package:MediLink/widgets/HomeWidgets/Doctors/ButtonDay.dart';
import 'package:MediLink/widgets/HomeWidgets/Doctors/ButtonTime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DoctorInfo extends StatelessWidget {
  final String imageDoctor;
  final String namedoctor;
  final String medSpecialty;
  final String star;
  DoctorInfo(
      {super.key,
      required this.star,
      required this.imageDoctor,
      required this.namedoctor,
      required this.medSpecialty});

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
                                        final label = DateFormat('MMMM yyyy',langCode)
                                            .format(month);
                                        return InkWell(
                                          onTap: () {
                                            context
                                                .read<MonthCubit>()
                                                .selectMonth(month);
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
        title: const Padding(
          padding: EdgeInsets.only(left: 70),
          child: Text(
            'Doctor’s info',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 264,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('images/Vector (4).png'),
                Image.asset(imageDoctor)
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
                          namedoctor,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 24),
                        ),
                        Row(
                          children: [
                            Text(
                              star,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      color: Color.fromRGBO(125, 138, 149, 1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              medSpecialty,
                              style: const TextStyle(
                                  color: Color.fromRGBO(145, 154, 162, 1),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      color: Color.fromRGBO(125, 138, 149, 1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            const Text(
                              '15 Years',
                              style: TextStyle(
                                  color: Color.fromRGBO(125, 138, 149, 1),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      color: Color.fromRGBO(125, 138, 149, 1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            const Text(
                              '8:00 AM - 6:30 PM',
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
                            text: const TextSpan(
                      children: [
                        TextSpan(
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.6),
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                            text:
                                'I am a dedicated physician with over ten years of experience in the medical field. My passion lies in providing compassionate care to my patients and ensuring their well-being. '),
                        TextSpan(
                          text: ' read more',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Color.fromRGBO(38, 115, 221, 1),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    monthName,
                                    style: const TextStyle(
                                        color: Color.fromRGBO(38, 115, 221, 1),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 1.0, top: 1),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color.fromRGBO(38, 115, 221, 1),
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
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ButtonDay(
                            isfall: false,
                            date: 15,
                            day: 'Sun',
                          ),
                          ButtonDay(
                            isfall: false,
                            date: 16,
                            day: 'Sun',
                          ),
                          ButtonDay(
                            isfall: true,
                            date: 17,
                            day: 'Sun',
                          ),
                          ButtonDay(
                            isfall: false,
                            date: 18,
                            day: 'Sun',
                          ),
                          ButtonDay(
                            isfall: true,
                            date: 19,
                            day: 'Sun',
                          ),
                          ButtonDay(
                            isfall: false,
                            date: 20,
                            day: 'Sun',
                          ),
                          ButtonDay(
                            isfall: true,
                            date: 21,
                            day: 'Sun',
                          ),
                        ],
                      ),
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
                    Container(
                        child: Expanded(
                      child: GridView(
                          shrinkWrap: true,
                          children: [
                            ButtonTime(isfall: true, date: '09:00 - 10:00 AM'),
                            ButtonTime(isfall: false, date: '10:00 - 11:00 AM'),
                            ButtonTime(isfall: false, date: '11:00 - 12:00 AM'),
                            ButtonTime(isfall: true, date: '12:00 - 13:00 PM'),
                          ],
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisExtent: 34,
                            mainAxisSpacing: 10,
                          )),
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                          fixedSize: const WidgetStatePropertyAll(
                              Size(double.infinity, 42)),
                          backgroundColor: const WidgetStatePropertyAll(
                              Color.fromRGBO(38, 115, 221, 1))),
                      onPressed: () {},
                      child: const Text(
                        'Book Now',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
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
      ),
    );
  }
}
