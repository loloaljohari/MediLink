import 'package:MediLink/widgets/HomeWidgets/Record/Medicine/Permanent%20medicines.dart';
import 'package:MediLink/widgets/HomeWidgets/Record/Medicine/Temporary%20medicines.dart';
import 'package:flutter/material.dart';

class NowMedicine extends StatelessWidget {
  const NowMedicine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Permanent medicines',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          PermanentMedicines(
            Permanentmedicinesname: 'Aspirin 81',
            date: '20 / 12 / 2015',
            amount: '305 pill',
            time: 'After eating',
            dosage: 'One pill',
            repeat: 'Twice a day',
          ),
          PermanentMedicines(
            Permanentmedicinesname: 'Bisoprolol',
            date: '15 / 11 / 2024',
            amount: '113 pill',
            time: 'before sleep',
            dosage: 'Tow pill',
            repeat: 'one a week',
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Temporary medicines',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          TemporaryMedicines(
            temporarymedicinesname: 'proven',
            startdate: '30 /3 /2025',
            enddate: '12 / 4 / 2025',
            doctorname: 'Amar',
            time: 'After eating',
            dosage: 'one pill',
            repeat: 'one a Day',
            per: 19,
            max: 24,
          )
         , TemporaryMedicines(
            temporarymedicinesname: 'proven',
            startdate: '30 /3 /2025',
            enddate: '12 / 4 / 2025',
            doctorname: 'Amar',
            time: 'After eating',
            dosage: 'one pill',
            repeat: 'one a Day',
            per: 10,
            max: 18,
          )
        
        ],
      ),
    );
  }
}
