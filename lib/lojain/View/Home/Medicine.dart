import 'package:MediLink/lojain/Controllers/mydates/ButtonsDates.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Record/Medicine/ArchiveMedicine.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Record/Medicine/NowMedicine.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Record/Medicine/Temporary%20medicines.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Controllers/onboarding/SelectionLang.dart';
import '../../Controllers/onboarding/SelectionTheme.dart';

class Medicine extends StatelessWidget {
  const Medicine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Color.fromRGBO(38, 115, 221, 1),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(left: 70, right: 70),
            child: Text(
              context.watch<Selection>().state == 1 ? 'الأدوية' : 'Medicine',
              style: TextStyle(),
            ),
          ),
        ),
        body: BlocBuilder<Buttonsdates, int>(builder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                          onTap: () {
                            context.read<Buttonsdates>().selectButton(0);
                          },
                          child: Container(
                            child: Center(
                                child: Text(
                              context.watch<Selection>().state == 1
                                  ? 'الآن'
                                  : 'Now',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: index == 0
                                      ? Color.fromRGBO(15, 102, 222, 1)
                                      : context.watch<SelectionTheme>().state ==
                                              3
                                          ? Colors.white
                                          : Colors.black),
                            )),
                            height: 35,
                            width: 178.2811279296875,
                            decoration: BoxDecoration(
                              color: index == 0
                                  ? Color.fromRGBO(38, 115, 221, 0.3)
                                  : Color.fromRGBO(38, 115, 221, 0.1),
                            ),
                          )),
                    ),
                    Expanded(
                      child: InkWell(
                          onTap: () {
                            context.read<Buttonsdates>().selectButton(1);
                          },
                          child: Container(
                              child: Center(
                                  child: Text(
                                context.watch<Selection>().state == 1
                                    ? 'الأرشيف'
                                    : 'Archive',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: index == 1
                                        ? Color.fromRGBO(15, 102, 222, 1)
                                        : context
                                                    .watch<SelectionTheme>()
                                                    .state ==
                                                3
                                            ? Colors.white
                                            : Colors.black),
                              )),
                              height: 35,
                              width: 178.2811279296875,
                              decoration: BoxDecoration(
                                color: index == 1
                                    ? Color.fromRGBO(38, 115, 221, 0.3)
                                    : Color.fromRGBO(38, 115, 221, 0.1),
                              ))),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [index == 0 ? NowMedicine() : ArchiveMedicine()],
                ),
              ),
            ],
          );
        }));
  }
}
