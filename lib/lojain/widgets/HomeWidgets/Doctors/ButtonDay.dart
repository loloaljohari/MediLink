import 'package:MediLink/lojain/Controllers/doctors/Selecttheday.dart';
import 'package:MediLink/lojain/Controllers/onboarding/SelectionTheme.dart';
import 'package:MediLink/lojain/models/Doctors/getTimes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonDay extends StatelessWidget {
  final bool isfall;
  final color;
  final date;
  final id;
  final String day;

  const ButtonDay(
      {Key? key,
      required this.isfall,
      required this.date,
      required this.day,
      required this.color,required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
     var mode = context.watch<SelectionTheme>().state;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: BlocBuilder<Selecttheday, dynamic>(builder: (context, i) {
        return InkWell(
          onTap: () {
            if (color == '#0000FF') {
              context.read<Selecttheday>().selectLang(date);
              var day = context.read<Selecttheday>().state;
              context.read<GetTimesCubit>().fetchProfile(id: id, date: day);
            } else if (color == '#FFFFFF') {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                    content: Text(
                        'the day there is work<, but it is completely booked!')),
              );
            } else if (color == '#FF0000') {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    backgroundColor: Color.fromRGBO(175, 11, 11, 1),
                    content: Text('there is no work in this day')),
              );
            } else
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    backgroundColor: Color.fromARGB(255, 213, 46, 127),
                    content: Text('the date is old')),
              );
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: (i == date && isfall == false)
                    ? mode==4? Color.fromRGBO(38, 115, 221, 1):  Color.fromRGBO(116, 164, 232, 1)
                    : Colors.transparent,
                border: (i != date)
                    ? Border.all(
                        color: color == '#FF0000'
                            ? Color.fromRGBO(175, 11, 11, 1)
                            : color == '#FFFFFF'
                                ? Colors.white
                                : color == '#FFC0CB'
                                    ? const Color.fromARGB(255, 213, 46, 127)
                                    : Color.fromRGBO(37, 111, 213, 0.964),
                        width: 1)
                    : Border(),
                borderRadius: BorderRadius.circular(4)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date.substring(date.toString().length - 2),
                  style: TextStyle(
                      color: mode==4? i==date ? Colors.white: Colors.black: i==date ? Colors.black: Colors.white  ,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  day,
                  style: TextStyle(
                      color: mode==4? i==date ? Colors.white: Colors.black: i==date ? Colors.black: Colors.white  ,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
