import 'package:MediLink/ammar/lib/view/screen/aouth/sinup.dart';
import 'package:MediLink/lojain/Controllers/home/NavigationCubit.dart';
import 'package:MediLink/lojain/models/Proflie/getProfile.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Doctors/doctorWidget.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/home/theNearestDate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<GetprofileCubit>().fetchProfile();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: BlocBuilder<GetprofileCubit, GetProfileState>(
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
                      backgroundImage: NetworkImage(state.myprofile['photo']),
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
                        fixedSize: WidgetStatePropertyAll(Size(60, 20)),
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
        ),
        leadingWidth: 200,
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
                BlocBuilder<NavigationCubit, int>(
                  builder: (context, state) {
                    return TextButton(
                        onPressed: () {
                          context.read<NavigationCubit>().changePage(3);
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
            const TheNearestDate(
              Dates: false,
              Imagepath: 'images/unsplash_7bMdiIqz_J4 (2).png',
              medSpecialty: 'Cardiomyopathy',
              namedoctor: 'Dr. Ali Kane',
              Date: '15 May , Monday',
              Time: '8:00 - 9:00 PM',
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                DoctorWidget(
                  showStar: true,
                  imageDoctor: 'images/unsplash_7bMdiIqz_J4 (2).png',
                  medSpecialty: 'Cardiomyopathy',
                  namedoctor: 'Dr. Ali Kane',
                  star: '  4.5',
                ),
                DoctorWidget(
                  showStar: true,
                  imageDoctor: 'images/unsplash_NMkGww4E7B0.png',
                  medSpecialty: 'Psychiatry',
                  namedoctor: 'Dr. Alaa',
                  star: '4.8',
                ),
                DoctorWidget(
                  showStar: true,
                  imageDoctor: 'images/unsplash_jnodpAk8H7c.png',
                  medSpecialty: 'Cardiomyopathy',
                  namedoctor: 'Dr. Ali Kane',
                  star: '4.6',
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
