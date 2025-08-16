import 'package:MediLink/ammar/lib/view/screen/aouth/sinup.dart';
import 'package:MediLink/lojain/Controllers/home/NavigationCubit.dart';
import 'package:MediLink/lojain/Static/Static.dart';
import 'package:MediLink/lojain/View/Home/viewAllNearestDate.dart';
import 'package:MediLink/lojain/models/Doctors/getDoctors.dart';
import 'package:MediLink/lojain/models/Proflie/getProfile.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Doctors/doctorWidget.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/home/theNearestDate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../models/Dates/getNearestdate.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<GetprofileCubit>().fetchProfile();
    context.read<GetNearestdateCubit>().fetchProfile();
    context.read<GetDoctorsCubit>().fetchProfile();

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<GetprofileCubit, GetProfileState>(
                  builder: (context, state) {
                if (state is GetProfileLoading) {
                  return const Align(
                    alignment: Alignment.centerLeft,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                } else if (state is GetProfileLoaded) {
                  if (state.myprofile.containsKey('name')) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: (state.myprofile['photo'] ==
                                      '$Imagepathurl/storage/avatars/defaults.jpg' ||
                                  state.myprofile['photo'] ==
                                      '$Imagepathurl/storage/avatars/6681221.png')
                              ? AssetImage(
                                  'images/Group 1013.png',
                                )
                              : NetworkImage(state.myprofile['photo']),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Good morning 🙋‍♂️',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 0.6),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(state.myprofile['name'],
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w700)),
                          ],
                        )
                      ],
                    );
                  } else {
                    return ElevatedButton(
                        style: ButtonStyle(
                            fixedSize: WidgetStatePropertyAll(Size(110, 20)),
                            backgroundColor: WidgetStatePropertyAll(
                                Color.fromRGBO(38, 115, 221, 1))),
                        onPressed: () {
                          Get.to(Sinup(
                            conte: context,
                          ));
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ));
                  }
                } else if (state is GetProfileError) {
                  return SizedBox(
                    child: Row(
                      children: [
                        const Text('Error'),
                        ElevatedButton(
                            onPressed: () {
                              context.read<GetprofileCubit>().fetchProfile();
                            },
                            child: const Text('try again'))
                      ],
                    ),
                  );
                }
                return const SizedBox();
              }),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_active_outlined,
                    color: Color.fromRGBO(37, 111, 213, 0.964),
                    size: 30,
                  ))
            ],
          ),
        ),
        leadingWidth: MediaQuery.of(context).size.width,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 10),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Image.asset('images/Vector0.png'),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'How are your feeling today ?',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(left: 19.0),
            //       child: Image.asset('images/Vector4.png'),
            //     ),
            //     const Padding(
            //       padding: EdgeInsets.only(left: 15.0),
            //       child: Text(
            //         'Upcoming Appointments',
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontWeight: FontWeight.w700,
            //             fontSize: 20),
            //       ),
            //     ),
            //     BlocBuilder<NavigationCubit, int>(
            //       builder: (context, state) {
            //         return TextButton(
            //             onPressed: () {
            //               context.read<NavigationCubit>().changePage(3);
            //             },
            //             child: const Text('view all',
            //                 style: TextStyle(
            //                     color: Color.fromRGBO(38, 115, 221, 1),
            //                     fontWeight: FontWeight.w400,
            //                     fontSize: 16)));
            //       },
            //     )
            //   ],
            // ),
            BlocBuilder<GetNearestdateCubit, GetNearestdateState>(
              builder: (context, state) {
                if (state is GetNearestdateLoading) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  ));
                } else if (state is GetNearestdateLoaded) {
                  return state.dates['appointment'] == null
                      ? Text('')
                      : Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 19.0),
                                  child: Image.asset('images/Vector4.png'),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    'Upcoming Appointments',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Get.to(ViewAllNearestDate());
                                    },
                                    child: const Text('view all',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(38, 115, 221, 1),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16))),
                              ],
                            ),
                            TheNearestDate(
                              idApp: state.dates['appointment']['id'],
                              Dates: false,
                              Imagepath: state.dates['appointment']
                                  ['doctor_photo'],
                              medSpecialty: state.dates['appointment']
                                  ['specialization'],
                              namedoctor:
                                  "Dr. ${state.dates['appointment']['doctor_name']}",
                              Date:
                                  '${state.dates['appointment']['date']} , ${state.dates['appointment']['day']}',
                              Time:
                                  '${state.dates['appointment']['start_time'].toString().substring(0, 5)}-${state.dates['appointment']['end_time'].toString().substring(0, 5)}',
                            ),
                          ],
                        );
                } else
                  return SizedBox();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Image.asset('images/Vector13.png'),
                ),
                const Text(
                  'Available Doctor',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 80,
                ),
                BlocBuilder<NavigationCubit, int>(
                  builder: (context, state) {
                    return TextButton(
                        onPressed: () {
                          context.read<NavigationCubit>().changePage(2);
                        },
                        child: const Text('view all',
                            style: TextStyle(
                                color: Color.fromRGBO(38, 115, 221, 1),
                                fontWeight: FontWeight.w400,
                                fontSize: 16)));
                  },
                )
              ],
            ),
            BlocBuilder<GetDoctorsCubit, GetDoctorsState>(
              builder: (context, state) {
                if (state is GetDoctorsLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                } else if (state is GetDoctorsLoaded) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(
                      state.doctors['data'].length,
                      (index) {
                        return DoctorWidget(
                          id: state.doctors['data'][index]["id"],
                          showStar: true,
                          imageDoctor: state.doctors['data'][index]["photo"],
                          medSpecialty:
                              '${state.doctors['data'][index]['specialization']}',
                          namedoctor:
                              'Dr. ${state.doctors['data'][index]['name']}',
                          star: '  ${state.doctors['data'][index]['rating']}',
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
