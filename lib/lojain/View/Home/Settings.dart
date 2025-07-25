import 'package:MediLink/lojain/widgets/HomeWidgets/Services/AlarmWidegt/My%20Alarm%20medication.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Services/PrescriptionWidget/MyMedicalprescription.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Services/Profile/MyProfile.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Services/MySetting.dart';
import 'package:flutter/material.dart';
class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'My Services',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
        child: ListView(
          children: [
           MyProfile(),
           SizedBox(height: 10,),
           MyMedicalprescription(),
           SizedBox(height: 10,),
           MyAlarmMedication(),
           MySetting(),
            ],
        ),
      ),
    );
  }
}
