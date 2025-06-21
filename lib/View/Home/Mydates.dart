import 'package:MediLink/Controllers/mydates/ButtonsDates.dart';
import 'package:MediLink/widgets/HomeWidgets/Mydate/DateWidget.dart';
import 'package:MediLink/widgets/HomeWidgets/home/theNearestDate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Mydates extends StatelessWidget {
  Mydates({Key? key}) : super(key: key);
  int Select = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
            child: const Text(
          'My Dates',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
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
                    'Upcoming Date',
                    style: TextStyle(
                        color: Colors.white,
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
              Imagepath: 'images/unsplash_7bMdiIqz_J4 (2).png',
              medSpecialty: 'Cardiomyopathy',
              namedoctor: 'Dr. Ali Kane',
              Date: '15 May , Monday',
              Time: '8:00 - 9:00 PM',
            ),
            SizedBox(
              height: 15,
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
                                  : WidgetStatePropertyAll(Colors.transparent),
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
                            'Confirmed',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          )),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: index == 1
                                  ? WidgetStatePropertyAll(
                                      Color.fromRGBO(38, 115, 221, 1))
                                  : WidgetStatePropertyAll(Colors.transparent),
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
                            'Pending',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          )),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: index == 2
                                  ? WidgetStatePropertyAll(
                                      Color.fromRGBO(38, 115, 221, 1))
                                  : WidgetStatePropertyAll(Colors.transparent),
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
                            'Canceled',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          )),
                    ],
                  ),
                  index == 0
                      ? Column(
                        children: [
                          const DateWidget(
                              Imagepath: 'images/Rectangle 675.png',
                              namedoctor: 'Dr. Amena',
                              time: '9:00 - 8:00',
                              date: '15 May',
                            ),
                               const DateWidget(
                              Imagepath: 'images/Rectangle 675.png',
                              namedoctor: 'Dr. Amena',
                              time: '9:00 - 8:00',
                              date: '15 May',
                            ),   const DateWidget(
                              Imagepath: 'images/Rectangle 675.png',
                              namedoctor: 'Dr. Amena',
                              time: '9:00 - 8:00',
                              date: '15 May',
                            ),   const DateWidget(
                              Imagepath: 'images/Rectangle 675.png',
                              namedoctor: 'Dr. Amena',
                              time: '9:00 - 8:00',
                              date: '15 May',
                            ),
                        ],
                      )
                      : index==1?Column(
                        children: [
                          const DateWidget(
                              Imagepath: 'images/Rectangle 675.png',
                              namedoctor: 'Dr. Amena',
                              time: '9:00 - 8:00',
                              date: '15 May',
                            ),
                               const DateWidget(
                              Imagepath: 'images/Rectangle 675.png',
                              namedoctor: 'Dr. Amena',
                              time: '9:00 - 8:00',
                              date: '15 May',
                            ),   
                        ],
                      ) : 
                      Text('')
                ],
              );
            }),
           
          ],
        ),
      ),
    );
  }
}
