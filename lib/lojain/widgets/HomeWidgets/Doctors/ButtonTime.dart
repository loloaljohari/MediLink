import 'package:MediLink/lojain/Controllers/doctors/SelectThetime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonTime extends StatelessWidget {
    final bool isfall;
  final String date;

  const ButtonTime({Key? key, required this.isfall, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: BlocBuilder<Selectthetime, String?>(builder: (context, i) {
        return InkWell(
          onTap: () {
            if (isfall == false) {
              context.read<Selectthetime>().selectLang(date);
            } else
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    backgroundColor: Color.fromRGBO(175, 11, 11, 1),
                    content: Text('the date is fall you can\'t book in it!  ')),
              );
            ;
          },
          child: Container(
           
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
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text(
                date.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        );
      }),
    );
  }
}
