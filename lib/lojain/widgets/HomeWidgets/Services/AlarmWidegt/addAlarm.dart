import 'dart:math';

import 'package:MediLink/lojain/Class/Alarm.dart';
import 'package:MediLink/lojain/Controllers/onboarding/SelectionTheme.dart';
import 'package:MediLink/lojain/models/alarm/postalarm.dart';
import 'package:alarm/alarm.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Controllers/onboarding/SelectionLang.dart';
import '../../../../models/alarm/getAlarms.dart';

class AddAlarm extends StatefulWidget {
  final med;
  final List<String> listMedicine;
  final List<Map> listRedundancy;
  final List<Map> listQuantity;
  AddAlarm(
      {super.key,
      required this.listMedicine,
      required this.listRedundancy,
      required this.listQuantity,
      this.med});

  @override
  State<AddAlarm> createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  var l;
  var k;
  TextEditingController hour = TextEditingController();
  TextEditingController minuite = TextEditingController();

  Future<dynamic> setAlarm(BuildContext context, med, q) async {
    final now = DateTime.now();
    DateTime alarmtime = DateTime(now.year, now.month, now.day,
        int.parse(hour.text) ?? 10, int.parse(minuite.text) ?? 10);
    if (alarmtime.isBefore(now)) {
      alarmtime = alarmtime.add(const Duration(days: 1));
    }

    final alarmSettings = AlarmSettings(
      id: widget.med
              .where(
                (element) => element['name'] == l,
              )
              .map(
                (e) => e['id'] as int,
              )
              .first +
          int.parse(minuite.text) +
          int.parse(hour.text),
      dateTime: alarmtime,
      assetAudioPath: 'assets/telephone-ring-03b.wav',
      loopAudio: true,
      vibrate: false,
      androidFullScreenIntent: true,
      volume: 0.8,
      
      notificationSettings: NotificationSettings(

        title: 'حان موعد الدواء ',
        body: '$q يجب ان تأخذ    $medان الدواء هو',
        stopButton: "stop",
      ),
    );

    Alarm.set(alarmSettings: alarmSettings);

    

    Alarm.setWarningNotificationOnKill(
        'حان موعد الدواء ', '$q يجب ان تأخذ    $medان الدواء هو');

    showDialog(
      context: context,
      builder: (context) {

        return AlertDialog(
          backgroundColor: Color.fromRGBO(38, 115, 221, 1),
          title: const Text('تم ضبط المنبه',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700)),
          content: Text(
              "تم الضبط على الساعة ${alarmtime.hour}:${alarmtime.minute.toString().padLeft(2, '0')} ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400)),
        );
      },
    );
     context.read<GetAlarmsCubit>().fetch();
     
    return ;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 17),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(38, 115, 221, 0.2),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: ListView(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Container(
                      width: 97,
                      height: 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color.fromRGBO(255, 255, 255, 1)),
                    )),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: 357,
                      height: 58,
                      child: CustomDropdown<String>(
                        // hideSelectedFieldWhenExpanded: true,
                        decoration: CustomDropdownDecoration(
                             closedFillColor:
                                    const Color.fromARGB(255, 143, 143, 143),
                                expandedFillColor: const Color.fromARGB(255, 129, 129, 129),
                            headerStyle: const TextStyle(
                                // color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                            listItemStyle: const TextStyle(
                                // color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                            expandedBorder: Border.all(
                                color: const Color.fromRGBO(38, 115, 221, 1)),
                            closedSuffixIcon: Transform.rotate(
                                angle: 90 * (-pi / 180),
                                child: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Color.fromRGBO(38, 115, 221, 1),
                                  size: 20,
                                )),
                            hintStyle: const TextStyle(
                                // color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400)),

                        // closedHeaderPadding: EdgeInsets.all(5),
                        disabledDecoration:
                            const CustomDropdownDisabledDecoration(
                                fillColor: Colors.transparent),
                        items: widget.listMedicine,

                        hintText:  context.watch<Selection>().state == 1
                                    ? 'اختر دواءك' :'Selection your Medicine',
                        onChanged: (value) {
                          setState(() {
                            l = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 169,
                          height: 58,
                          child: CustomDropdown<dynamic>(
                            // hideSelectedFieldWhenExpanded: true,
                            decoration: CustomDropdownDecoration(
                                closedFillColor:
                                    const Color.fromARGB(255, 143, 143, 143),
                                expandedFillColor: const Color.fromARGB(255, 129, 129, 129),
                                headerStyle: const TextStyle(
                                    // color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                                listItemStyle: const TextStyle(
                                    // color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                                expandedBorder: Border.all(
                                    color:
                                        const Color.fromRGBO(38, 115, 221, 1)),
                                closedSuffixIcon: Transform.rotate(
                                    angle: 90 * (-pi / 180),
                                    child: const Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Color.fromRGBO(38, 115, 221, 1),
                                      size: 20,
                                    )),
                                hintStyle: const TextStyle(
                                    // color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400)),

                            // closedHeaderPadding: EdgeInsets.all(5),
                            disabledDecoration:
                                const CustomDropdownDisabledDecoration(
                                    fillColor: Colors.transparent),
                            items: widget.listRedundancy
                                .where(
                                  (element) => element['name'] == l,
                                )
                                .map(
                                  (e) => e['redundancy'] as String,
                                )
                                .toList(),

                            hintText:   context.watch<Selection>().state == 1
                                    ? 'التكرار ':'Redundancy',
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(
                          width: 169,
                          height: 58,
                          child: CustomDropdown<dynamic>(
                            // hideSelectedFieldWhenExpanded: true,
                            decoration: CustomDropdownDecoration(
                                closedFillColor:
                                    const Color.fromARGB(255, 143, 143, 143),
                                expandedFillColor: const Color.fromARGB(255, 129, 129, 129),
                                headerStyle: const TextStyle(
                                    // color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                                listItemStyle: const TextStyle(
                                    // color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                                expandedBorder: Border.all(
                                    color:
                                        const Color.fromRGBO(38, 115, 221, 1)),
                                closedSuffixIcon: Transform.rotate(
                                    angle: 90 * (-pi / 180),
                                    child: const Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Color.fromRGBO(38, 115, 221, 1),
                                      size: 20,
                                    )),
                                hintStyle: const TextStyle(
                                    // color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400)),

                            // closedHeaderPadding: EdgeInsets.all(5),
                            disabledDecoration:
                                const CustomDropdownDisabledDecoration(
                                    fillColor: Colors.transparent),
                            items: widget.listQuantity
                                .where(
                                  (element) => element['name'] == l,
                                )
                                .map(
                                  (e) => e['quantity'] as String,
                                )
                                .toList(),

                            hintText: context.watch<Selection>().state == 1
                                    ? 'الكمية': 'Quantity',
                            onChanged: (value) {
                              setState(() {
                                k = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(context.watch<Selection>().state == 1
                                    ? 'الوقت:':  'The Time:'),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color:context.watch<SelectionTheme>().state==3? Color.fromRGBO(34, 34, 34, 1):Colors.white  ,
                            ),
                            height: 52,
                            width: 54,
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Expanded(
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                    textSelectionTheme:
                                        const TextSelectionThemeData(
                                            selectionColor: Colors.white,
                                            selectionHandleColor: Colors.white,
                                            cursorColor: Colors.white)),
                                child: TextFormField(
                                  // cursorColor: Colors.white,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    hintText: 'HH',
                                    hintStyle: TextStyle(
                                        // color: Colors.white,
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400),
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                  controller: hour,
                                  style: const TextStyle(
                                      // color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            ":",
                            style: TextStyle(fontSize: 40),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color:context.watch<SelectionTheme>().state==3? Color.fromRGBO(34, 34, 34, 1):Colors.white  ,
                            ),
                            height: 52,
                            width: 54,
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Expanded(
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                    textSelectionTheme:
                                        const TextSelectionThemeData(
                                            selectionColor: Colors.white,
                                            selectionHandleColor: Colors.white,
                                            cursorColor: Colors.white)),
                                child: TextFormField(
                                  // cursorColor: Colors.white,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    hintText: 'MM',
                                    hintStyle: TextStyle(
                                        // color: Colors.white,
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400),
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                  controller: minuite,
                                  style: const TextStyle(
                                      // color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          fixedSize:
                              WidgetStatePropertyAll(Size(double.infinity, 54)),
                          backgroundColor: WidgetStatePropertyAll(
                              Color.fromRGBO(38, 115, 221, 1))),
                      onPressed: () async {
                        bool isSuccess = await Postalarm().post(
                            widget.med
                                .where(
                                  (element) => element['name'] == l,
                                )
                                .map(
                                  (e) => e['id'] as int,
                                )
                                .first,
                            '${hour.text}:${minuite.text}');
                        if (isSuccess) {
                         await setAlarm(context, l, k);
                       
                        } else
                          print('error');
                      },
                      child:  Text(
                      context.watch<Selection>().state == 1
                                    ? 'اضف الآن':   'Add Now',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
