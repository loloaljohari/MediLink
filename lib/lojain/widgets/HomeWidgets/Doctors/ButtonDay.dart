import 'package:MediLink/lojain/Controllers/doctors/Selecttheday.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonDay extends StatelessWidget {
  final bool isfall;
  final int date;
  final String day;

  const ButtonDay(
      {Key? key, required this.isfall, required this.date, required this.day})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: BlocBuilder<Selecttheday, int?>(builder: (context, i) {
        return InkWell(
          onTap: () {
            if (isfall == false) {
              context.read<Selecttheday>().selectLang(date);
            } else
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Color.fromRGBO(175, 11, 11, 1),
                    content: Text('the date is fall you can\'t book in it!  ')),
              );
            ;
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: (i == date && isfall == false)
                    ? Color.fromRGBO(15, 102, 222, 1)
                    : Colors.transparent,
                border: (i != date)
                    ? Border.all(
                        color: isfall
                            ? Color.fromRGBO(175, 11, 11, 1)
                            : Color.fromRGBO(38, 115, 221, 0.3),
                        width: 1)
                    : Border(),
                borderRadius: BorderRadius.circular(4)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  day,
                  style: TextStyle(
                      color: Colors.white,
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
