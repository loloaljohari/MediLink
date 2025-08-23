import 'package:MediLink/lojain/widgets/HomeWidgets/Services/AlarmWidegt/My%20Alarm%20medication.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Services/PrescriptionWidget/MyMedicalprescription.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Services/Profile/MyProfile.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Services/MySetting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Controllers/onboarding/SelectionLang.dart';
class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(

           context.watch<Selection>().state == 1
                                    ? 'خدماتي':  'My Services',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),

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
