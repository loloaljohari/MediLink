// ignore: file_names
import 'package:MediLink/Controllers/doctors/Month.dart';
import 'package:MediLink/Controllers/home/NavigationCubit.dart';
import 'package:MediLink/Controllers/mydates/ButtonsDates.dart';
import 'package:MediLink/Controllers/services/DropdownCubit.dart';
import 'package:MediLink/Controllers/services/LangCubit.dart';
import 'package:MediLink/Controllers/services/darkcontrol.dart';
import 'package:MediLink/View/Home/AllDoctors.dart';
import 'package:MediLink/View/Home/MyMedicalRecord.dart';
import 'package:MediLink/View/Home/Mydates.dart';
import 'package:MediLink/View/Home/Settings.dart';
import 'package:MediLink/View/Home/home.dart';
import 'package:MediLink/main.dart';
import 'package:MediLink/widgets/HomeWidgets/PageContent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepages extends StatelessWidget {
  const Homepages({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavigationCubit(),),
        BlocProvider(create: (context) => Darkcontrol()),
        BlocProvider(create: (context) => LangCubit(),),
        BlocProvider(create: (context) => DropdownCubit(),),
        BlocProvider(create: (context) => Buttonsdates(),)],
      child: HomePages());
  }
}

class HomePages extends StatelessWidget {
  // ignore: use_super_parameters
  HomePages({Key? key}) : super(key: key);

  final List<Widget> pages = [
    PageContent(content: const Home()),
    PageContent(content:  MyMedicalRecord()),
    PageContent(content: const AllDoctors()),
    PageContent(content:  Mydates()),
    PageContent(content: const Settings())
  ];

  final List<String> imagesBefore = [
    'images/li_home.png',
    'images/Frame 8.png',
    'images/Group_light.png',
    'images/Vector33.png',
    'images/Frame 10.png'
  ];

  final List<String> imagesAfter = [
    'images/li_home (1).png',
    'images/Group.png',
    'images/Group_light (1).png',
    'images/Vector (1).png',
    'images/Vector (2).png'
  ];
  final List<String> namesButtons = [
    'Home',
    'Record',
    'doctors',
    'Dates',
    'Services'
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: BlocBuilder<NavigationCubit, int>(
        builder: (context, selectedIndex) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Container(
              key: ValueKey<int>(selectedIndex),
              child: pages[selectedIndex],
            ),
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
        builder: (context, selectedIndex) {
          final isRtl = Directionality.of(context) == TextDirection.rtl;

          final baseAlignments = [
            const Alignment(-1.0, 0),
            const Alignment(-0.5, 0),
            const Alignment(0.0, 0),
            const Alignment(0.5, 0),
            const Alignment(1.0, 0),
          ];
          final alignments =
              isRtl ? baseAlignments.reversed.toList() : baseAlignments;

          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            height: 80,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // الأزرار غير النشطة
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(5, (index) {
                    if (index == selectedIndex) {
                      return const SizedBox(width: 40); // مكان الزر النشط
                    }

                    double offsetX = 0;
                    if (index < selectedIndex) {
                      offsetX = isRtl ? 10 : -10;
                    } else if (index > selectedIndex) {
                      offsetX = isRtl ? -10 : 10;
                    }

                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      transform: Matrix4.translationValues(offsetX, 0, 0),
                      child: InkWell(
                        onTap: () {
                          context.read<NavigationCubit>().changePage(index);
                        },
                        child: SizedBox(
                          width: (index == 3 || index == 0)
                              ? 25
                              : index == 2
                                  ? 40
                                  : 50,
                          height: (index == 3 || index == 0) ? 25 : 50,
                          child: Image.asset(
                            imagesBefore[index],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  }),
                ),

                // الزر النشط المتحرك
                AnimatedAlign(
                  alignment: alignments[selectedIndex],
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: Container(
                    height: 40,
                    width: selectedIndex == 4 ? 110 : 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromRGBO(38, 115, 221, 1),
                    ),
                    child: InkWell(
                      onTap: () {}, // تقدر تخليها فارغة أو تغير الصفحة لنفسها
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, left: 8.0),
                            child: Image.asset(imagesAfter[selectedIndex]),
                          ),
                          Text(
                            namesButtons[selectedIndex],
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
