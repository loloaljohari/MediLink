import 'package:MediLink/lojain/Controllers/mydates/ButtonsDates.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Record/Exarnination/FancyImageSwipe.dart';

import 'package:MediLink/lojain/widgets/HomeWidgets/Record/Exarnination/PdfExarninatin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Controllers/onboarding/SelectionLang.dart';
import '../../Controllers/onboarding/SelectionTheme.dart';
import '../../widgets/HomeWidgets/Record/Exarnination/ImageExarnination.dart';

class Medicalexaminations extends StatelessWidget {
  const Medicalexaminations({Key? key}) : super(key: key);

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
          title:  Padding(
            padding: EdgeInsets.only(left: 30,right: 30),
            child: Text(
            context.watch<Selection>().state==1?'التحاليل الطبية':   'Medical examinations',
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
                            context.watch<Selection>().state==1?'صورة':   'Image',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: index == 0
                                      ? Color.fromRGBO(15, 102, 222, 1)
                                      : context.watch<SelectionTheme>().state==3?Colors.white :Colors.black),
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
                                'PDF',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: index == 1
                                        ? Color.fromRGBO(15, 102, 222, 1)
                                      : context.watch<SelectionTheme>().state==3?Colors.white :Colors.black),
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
                  children: [
                    index == 0
                        ? ImageExarnination()
                        : PdfExarninatin()  
                        ],
                ),
              ),
            ],
          );
        }));
  }
}
