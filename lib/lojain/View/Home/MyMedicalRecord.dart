import 'package:MediLink/lojain/Controllers/mydates/ButtonsDates.dart';
import 'package:MediLink/lojain/models/Visits/getLastvisit.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Doctors/LastVisit.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Record/lastupdate.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Record/recordsection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Controllers/onboarding/SelectionLang.dart';

// ignore: must_be_immutable
class MyMedicalRecord extends StatelessWidget {
  MyMedicalRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GetLastvisitCubit>().fetchProfile();
    List list = [
      {
        'id': '1',
        'image': 'images/Group 942.png',
        'text': context.watch<Selection>().state == 1 ? 'العامة' : 'Public',
      },
      {
        'id': '2',
        'image': 'images/Group 978.png',
        'text': context.watch<Selection>().state == 1 ? 'الزيارات' : 'Visits',
      },
      {
        'id': '3',
        'image': 'images/Group 957.png',
        'text': context.watch<Selection>().state == 1 ? 'الأدوية' : 'Medicine',
      },
      {
        'id': '4',
        'image': 'images/Group 953 (2).png',
        'text': context.watch<Selection>().state == 1 ? 'الأمراض' : 'Illness',
      },
      {
        'id': '5',
        'image': 'images/Group 950.png',
        'text':
            context.watch<Selection>().state == 1 ? 'الحساسية' : 'Sensitivity',
      },
      {
        'id': '6',
        'image': 'images/Group 964.png',
        'text': context.watch<Selection>().state == 1
            ? 'العمليات الجراحية'
            : 'Surgical operations',
      },
      {
        'id': '7',
        'image': 'images/Group 968.png',
        'text': context.watch<Selection>().state == 1
            ? 'التحاليل الطبية'
            : 'Medical examinations',
      },
      {
        'id': '8',
        'image': 'images/Group 973.png',
        'text': context.watch<Selection>().state == 1
            ? 'الأشعة الطبية'
            : 'Medical file',
      },
    ];
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => Buttonsdates())],
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            context.watch<Selection>().state == 1
                ? " السجل الصحي"
                : 'My Medical Record',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          )),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<GetLastvisitCubit, GetLastvisitState>(
                builder: (context, state) {
                if(state is GetLastvisitLoaded) {
               if(state.visits['status']==true)  {  return Column(
                    children: [
                      Row(
                        children: [
                          Image.asset('images/Group 929.png'),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            context.watch<Selection>().state == 1
                                ? 'اخر تحديث'
                                : 'Last Update',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Lastupdate(
                        imagePath: state.visits['doctor_photo'],
                        date: '${state.visits['year'] } ${state.visits['month_name'] } ',
                        medSpecialty: '${state.visits['doctor_specialist'] }',
                        namedoctor: 'Dr. Ali ${state.visits['name'] }',
                      ),
                    ],
                  );
            }  
            else return SizedBox(); }
               else return SizedBox();
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Image.asset('images/Mask group.png'),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    context.watch<Selection>().state == 1
                        ? 'قسم السجل'
                        : 'Record Section',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 25,
                      mainAxisExtent: 170,
                      mainAxisSpacing: 10),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Recordsection(
                      image: list[index]['image'],
                      text: list[index]['text'],
                      id: list[index]['id'],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
