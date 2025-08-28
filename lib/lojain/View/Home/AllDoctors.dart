import 'package:MediLink/lojain/models/Doctors/getDoctors.dart';
import 'package:MediLink/lojain/models/Visits/getallvisits.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Doctors/LastVisit.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Doctors/doctorWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Controllers/onboarding/SelectionLang.dart';

class AllDoctors extends StatelessWidget {
  const AllDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GetDoctorsCubit>().fetchProfile();
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        // backgroundColor: Colors.black,
        title: Center(
            child: const Text(
          'All Doctors',
          // style: TextStyle(color: Colors.white),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  BlocBuilder<GetallvisitsCubit, GetallvisitsState>(
                    builder: (context, state) {
                    if(state is GetallvisitsLoaded)  {return Column(
                            children: [
                                Row(
                            children: [
                              Image.asset('images/Group 929.png'),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  context.watch<Selection>().state == 1
                                      ? 'آخر زيارة'
                                      : 'Last Visit',
                                  style: TextStyle(
                                      // color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Lastvisit(
                            imagePath: state.visits['data'][state.visits['data'].length-1]['doctor']['photo'],
                            day:  state.visits['data'][state.visits['data'].length-1]['date'],
                            date: state.visits['data'][state.visits['data'].length-1]['date'],
                            medSpecialty: state.visits['data'][state.visits['data'].length-1]['doctor']['specialization'],
                            namedoctor: state.visits['data'][state.visits['data'].length-1]['doctor']['name'],
                          ),
                            ],
                          );
                     
                   } 
                   else return SizedBox();
                   },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Image.asset('images/Vector20.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                          context.watch<Selection>().state == 1
                              ? 'الأطباء المتاحين'
                              : 'Available Doctor',
                          style: TextStyle(
                              // color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<GetDoctorsCubit, GetDoctorsState>(
              builder: (context, state) {
                if (state is GetDoctorsLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetDoctorsLoaded) {
                  return Expanded(
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 25,
                            mainAxisExtent: 265,
                            mainAxisSpacing: 10),
                        children: List.generate(
                          state.doctors['data'].length,
                          (index) {
                            return DoctorWidget(
                              id: state.doctors['data'][index]["id"],
                              showStar: false,
                              imageDoctor: state.doctors['data'][index]
                                  ["photo"],
                              medSpecialty:
                                  '${state.doctors['data'][index]['specialization']}',
                              namedoctor: context.watch<Selection>().state == 1
                                  ? 'د. ${state.doctors['data'][index]['name']}'
                                  : 'Dr. ${state.doctors['data'][index]['name']}',
                              star:
                                  '  ${state.doctors['data'][index]['rating']}',
                            );
                          },
                        )),
                  );
                } else
                  return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
