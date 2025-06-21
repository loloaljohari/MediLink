import 'dart:math';

import 'package:alarm/alarm.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class AddAlarm extends StatelessWidget {

  final List<String> listMedicine ;
  final List<String> listRedundancy ;
  final List<String> listQuantity ;
  AddAlarm({super.key, required this.listMedicine, required this.listRedundancy, required this.listQuantity});
  void setAlarm(BuildContext context) {
    final now = DateTime.now();
    DateTime alarmtime = DateTime(now.year, now.month, now.day, 8, 30);

    if (alarmtime.isBefore(now)) {
      alarmtime = alarmtime.add(const Duration(days: 1));
    }

    final alarmSettings = AlarmSettings(
      id: 1,
      dateTime: DateTime.now().add(const Duration(seconds: 10)),
      assetAudioPath: 'assets/telephone-ring-03b.wav',
      loopAudio: true,
      vibrate: false,
      androidFullScreenIntent: true,
      volume: 0.8,
      notificationSettings: const NotificationSettings(
        
        title: 'title',
        body: 'body',
        stopButton: "stop",
      ),
    );

    Alarm.set(alarmSettings: alarmSettings);

    showDialog(
      
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor:Color.fromRGBO(38, 115, 221, 1) ,
          title: const Text('تم ضبط المنبه',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700)),
          content: Text(
              "تم الضبط على الساعة ${alarmtime.hour}:${alarmtime.minute.toString().padLeft(2, '0')} ",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w400)),
        );
      },
    );
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
                      closedFillColor: const Color.fromRGBO(34, 34, 34, 1),
                      expandedFillColor: Colors.black,
                      headerStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                      listItemStyle: const TextStyle(
                          color: Colors.white,
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
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400)),

                  // closedHeaderPadding: EdgeInsets.all(5),
                  disabledDecoration: const CustomDropdownDisabledDecoration(
                      fillColor: Colors.transparent),
                  items: listMedicine,

                  hintText: 'Selection your Medicine',
                  onChanged: (value) {},
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
                    child: CustomDropdown<String>(
                      // hideSelectedFieldWhenExpanded: true,
                      decoration: CustomDropdownDecoration(
                          closedFillColor: const Color.fromRGBO(34, 34, 34, 1),
                          expandedFillColor: Colors.black,
                          headerStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                          listItemStyle: const TextStyle(
                              color: Colors.white,
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
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),

                      // closedHeaderPadding: EdgeInsets.all(5),
                      disabledDecoration:
                          const CustomDropdownDisabledDecoration(
                              fillColor: Colors.transparent),
                      items: listRedundancy,

                      hintText: 'Redundancy',
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(
                    width: 169,
                    height: 58,
                    child: CustomDropdown<String>(
                      // hideSelectedFieldWhenExpanded: true,
                      decoration: CustomDropdownDecoration(
                          closedFillColor: const Color.fromRGBO(34, 34, 34, 1),
                          expandedFillColor: Colors.black,
                          headerStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                          listItemStyle: const TextStyle(
                              color: Colors.white,
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
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),

                      // closedHeaderPadding: EdgeInsets.all(5),
                      disabledDecoration:
                          const CustomDropdownDisabledDecoration(
                              fillColor: Colors.transparent),
                      items: listQuantity,

                      hintText: 'Quantity',
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
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
                onPressed: () {
                  setAlarm(context);
                },
                child: const Text(
                  'Add Now',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20),
                )),
          )
        ],
      ),
    );
  }
}
