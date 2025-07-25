import 'package:MediLink/lojain/models/alarm/deleteAlarm.dart';
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlarmContainer extends StatelessWidget {
  final String alarm_timing;
  final String alarm_time;
  final String alarm_frequency;
  final int id;
  final int idMed;
  final String med_name;
  final String alarm_dose;
  AlarmContainer(
      {Key? key,
      required this.alarm_timing,
      required this.alarm_time,
      required this.alarm_frequency,
      required this.alarm_dose,
      required this.med_name,
      required this.id,
      required this.idMed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        width: double.infinity,
        height: 86,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Color.fromRGBO(38, 115, 221, 0.1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 37,
              height: 37,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset('images/Group 1017.png'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '$alarm_time '.substring(0, 5),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      alarm_timing == "morinng" ? 'AM' : "PM",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Text(alarm_frequency,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset('images/Vector (9).png'),
                    SizedBox(
                      width: 3,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text('$med_name',
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              overflow: TextOverflow.fade,
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('images/Vector (10).png'),
                    SizedBox(
                      width: 3,
                    ),
                    Text('$alarm_dose',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ],
            ),
            BlocBuilder<DeleteAlarm, bool>(
              builder: (context, state) {
                return InkWell(
                    onTap: () async {
                      var isSuccess = await context.read< DeleteAlarm>().delete(id);
                      print(idMed +
                          int.parse('$alarm_time '.substring(0, 2)) +
                          int.parse('$alarm_time '.substring(3, 5)));
                      // Alarm.stop(idMed +
                      //     int.parse('alarm_time '.substring(0, 2)) +
                      //     int.parse('alarm_time '.substring(3, 5)));
                      if (isSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('success'),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 2),
                        ));
                        Navigator.of(context).pop();
                      } else {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('error'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ));
                      }
                    },
                    child:state? CircularProgressIndicator(): Icon(
                      Icons.delete_outline,
                      color: Color.fromRGBO(38, 115, 221, 1),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
