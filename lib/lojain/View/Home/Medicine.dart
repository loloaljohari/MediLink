import 'package:MediLink/lojain/Controllers/mydates/ButtonsDates.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Record/Medicine/NowMedicine.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Record/Medicine/Temporary%20medicines.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Medicine extends StatelessWidget {
  const Medicine({Key? key}) : super(key: key);

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
              'Medicine',
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
                              'Now',
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
                                'Archive',
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
                        ? NowMedicine()
                        : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                              children: [
                                TemporaryMedicines(
                                  temporarymedicinesname: 'proven',
                                  startdate: '30 /3 /2025',
                                  enddate: '12 / 4 / 2025',
                                  doctorname: 'Amar',
                                  time: 'After eating',
                                  dosage: 'one pill',
                                  repeat: 'one a Day',
                                  per: 24,
                                  max: 24,
                                ),
                                TemporaryMedicines(
                                  temporarymedicinesname: 'proven',
                                  startdate: '30 /3 /2025',
                                  enddate: '12 / 4 / 2025',
                                  doctorname: 'Amar',
                                  time: 'After eating',
                                  dosage: 'one pill',
                                  repeat: 'one a Day',
                                  per: 14,
                                  max: 18,
                                ),
                                TemporaryMedicines(
                                      temporarymedicinesname: 'proven',
                                      startdate: '30 /3 /2025',
                                      enddate: '12 / 4 / 2025',
                                      doctorname: 'Amar',
                                      time: 'After eating',
                                      dosage: 'one pill',
                                      repeat: 'one a Day',
                                      per: 14,
                                      max: 14,
                                    ),
                                    TemporaryMedicines(
                                      temporarymedicinesname: 'proven',
                                      startdate: '30 /3 /2025',
                                      enddate: '12 / 4 / 2025',
                                      doctorname: 'Amar',
                                      time: 'After eating',
                                      dosage: 'one pill',
                                      repeat: 'one a Day',
                                      per: 6,
                                      max: 24,
                                    )
                                    ,
                              ],
                            ),
                        )
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
