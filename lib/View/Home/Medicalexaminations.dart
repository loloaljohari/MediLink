import 'package:MediLink/Controllers/mydates/ButtonsDates.dart';
import 'package:MediLink/widgets/HomeWidgets/Record/Exarnination/FancyImageSwipe.dart';

import 'package:MediLink/widgets/HomeWidgets/Record/Exarnination/PdfExarninatin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/HomeWidgets/Record/Exarnination/ImageExarnination.dart';

class Medicalexaminations extends StatelessWidget {
  const Medicalexaminations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Color.fromRGBO(38, 115, 221, 1),
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              'Medical examinations',
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
                              'Image',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: index == 0
                                      ? Color.fromRGBO(15, 102, 222, 1)
                                      : Colors.white),
                            )),
                            height: 35,
                            width: 178.2811279296875,
                            decoration: BoxDecoration(
                                color: index == 0
                                    ? Color.fromRGBO(38, 115, 221, 0.3)
                                    : Color.fromRGBO(38, 115, 221, 0.1),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    topLeft: Radius.circular(8))),
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
                                        : Colors.white),
                              )),
                              height: 35,
                              width: 178.2811279296875,
                              decoration: BoxDecoration(
                                  color: index == 1
                                      ? Color.fromRGBO(38, 115, 221, 0.3)
                                      : Color.fromRGBO(38, 115, 221, 0.1),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(8),
                                      topRight: Radius.circular(8))))),
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
