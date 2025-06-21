import 'package:MediLink/widgets/HomeWidgets/Services/AlarmWidegt/AlarmContainer.dart';
import 'package:MediLink/widgets/HomeWidgets/Services/AlarmWidegt/addAlarm.dart';
import 'package:flutter/material.dart';

class AlarmMadicen extends StatelessWidget {


  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
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
            'My medication alarms',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
          AlarmContainer(),
            Center(
              child: IconButton(
                onPressed: () {
                  // setAlarm(context);
                  scaffold.currentState!.showBottomSheet(
                      backgroundColor: Colors.black, (context) => AddAlarm(listMedicine: [], listRedundancy: [], listQuantity: [],));
                },
                icon: const Icon(
                  Icons.add_circle_outline_sharp,
                  size: 71,
                  color: Color.fromRGBO(38, 115, 221, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
