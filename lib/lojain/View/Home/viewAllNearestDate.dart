import 'package:MediLink/lojain/Controllers/onboarding/SelectionTheme.dart';
import 'package:MediLink/lojain/models/Dates/getAllNearestdate.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/home/theNearestDate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Controllers/onboarding/SelectionLang.dart';

class ViewAllNearestDate extends StatelessWidget {
  const ViewAllNearestDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GetAllNearestdateCubit>().fetchProfile();
    var mode = context.watch<SelectionTheme>().state;
    return Scaffold(
      backgroundColor: mode == 4 ? Colors.white : Colors.black,
      appBar: AppBar(
        backgroundColor: mode == 4 ? Colors.white : Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromRGBO(38, 115, 221, 1),
          ),
        ),
        title: Text(
       context.watch<Selection>().state == 1
                                    ? 'أقرب المواعيد لجميع الأيام':    'Nearest Appointments to all days',
          style: TextStyle(
              color: mode == 4 ? Colors.black : Colors.white, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: BlocBuilder<GetAllNearestdateCubit, GetAllNearestdateState>(
          builder: (context, state) {
            if (state is GetAllNearestdateLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GetAllNearestdateLoaded) {
              final date = state.dates['appointments'].entries
                  .where(
                    (element) => (element.value as List).isNotEmpty,
                  )
                  .toList();

              return ListView.builder(
                itemCount: date.length,
                itemBuilder: (context, index) {
                  final nearestdate = date[index];
                  print(nearestdate);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${nearestdate.key}',
                        style: TextStyle(
                            color: mode == 4 ? Colors.black : Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: List.generate(
                          nearestdate.value.length,
                          (index) {
                            return TheNearestDate(
                              idApp:  nearestdate.value[index]['id'],
                              Dates: true,
                              Imagepath:  nearestdate.value[index]
                                  ['doctor_photo'],
                              medSpecialty:  nearestdate.value[index]
                                  ['specialization'],
                              namedoctor:
                                  "Dr. ${ nearestdate.value[index]['doctor_name']}",
                              Date:
                                  '${ nearestdate.value[index]['date']} , ${ nearestdate.value[index]['day']}',
                              Time:
                                  '${ nearestdate.value[index]['start_time'].toString().substring(0, 5)}-${ nearestdate.value[index]['end_time'].toString().substring(0, 5)}',
                            );
                          },
                        ),
                      )
                      ,SizedBox(height: 20,)
                    ],
                  );
                },
              );
            }
            return Text('');
          },
        ),
      ),
    );
  }
}
