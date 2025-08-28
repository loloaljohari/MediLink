import 'package:MediLink/lojain/models/record/FillOutRecord/postAllinfornation.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Doctors/DoctorInfo.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/FillOutRecord/FillOutSensitivity.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/FillOutRecord/FillOutmedicine.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/FillOutRecord/FilloutMedicalexaminations.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/FillOutRecord/FilloutOperations.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/FillOutRecord/Filloutillness.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/FillOutRecord/Filloutmedicalfile.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/FillOutRecord/filloutpublic.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Controllers/onboarding/SelectionLang.dart';

class FillOutRecord extends StatelessWidget {
  final cont;
  final id;
  FillOutRecord({Key? key, this.cont ,required this. id}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
  Future<void> showMyDialog(BuildContext context ,id) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 117, 174, 255),
          title: Text(
         context.watch<Selection>().state == 1 ? 'حفظ المعلومات' :   'Save Information',
            style: TextStyle(
                color: const Color.fromRGBO(15, 102, 222, 1),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    style: TextStyle(color: Colors.white, fontSize: 12),
               context.watch<Selection>().state == 1 ? 'هل أنت متأكد أنك تريد حفظ المعلومات لأنك لن تتمكن من تعبئتها مرة أخرى أو تعديلها، فقط الأطباء الذين حجزت معهم يمكنهم تعديلها؟' :     'Are you sure you want to save the information because you will not be able to refill it or edit it and only the doctors you have booked with can edit it?'),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromRGBO(15, 102, 222, 1))),
                  child: Text(
                   context.watch<Selection>().state == 1 ? 'الغاء' : 'cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                BlocBuilder<PostAllinfornation, bool>(
                    builder: (context, state) {
                  return ElevatedButton(
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromRGBO(15, 102, 222, 1))),
                    child: state
                        ? CircularProgressIndicator(
                          
                          )
                        : Text(
                          context.watch<Selection>().state == 1 ? 'حفظ' :  'save',
                            style: TextStyle(color: Colors.white),
                          ),
                    onPressed: () async {
                      print('================');
                      var isSuccess =
                          await context.read<PostAllinfornation>().post();

                      if (isSuccess) {
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        preferences.setBool('saveInfoRecord', true);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('success'),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 2),
                        ));
                      Get.off(DoctorInfo(id: id));
                      } else {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('error'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ));
                        Navigator.of(context).pop();
                      }
                    },
                  );
                }),
              ],
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      key: scaffold,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Color.fromRGBO(15, 102, 222, 1), width: 2)),
                    child: Icon(
                      Icons.question_mark_rounded,
                      size: 20,
                      color: Color.fromRGBO(15, 102, 222, 1),
                    )),
                SizedBox(
                  width: 10,
                ),
                Text(
                 context.watch<Selection>().state == 1 ? 'رجاءاً قم بتعبئة معلوماتك الصحية' :  'Please fill in the health crisis information',
                  style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Filloutpublic(),
            Divider(
          
            ),
            FillOutSensitivity(),
            Divider(
            
            ),
            FillOutmedicine(),
            Divider(
            
            ),
            Filloutillness(),
            Divider(
            
            ),
            FilloutMedicalexaminations(),
            Divider(
            
            ),
            Filloutmedicalfile(),
            Divider(
            
            ),
            FilloutOperations(),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    fixedSize:
                        WidgetStatePropertyAll(Size(double.infinity, 54)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                    backgroundColor: WidgetStatePropertyAll(
                        Color.fromRGBO(15, 102, 222, 1))),
                onPressed: () async {
                  showMyDialog(context,id);
                },
                child: Text(
               context.watch<Selection>().state == 1 ? 'حفظ كل المعلومات' :   'save all information ',
                  style: TextStyle(
                    color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ))
          ],
        ),
      ),
    );
  }
}
