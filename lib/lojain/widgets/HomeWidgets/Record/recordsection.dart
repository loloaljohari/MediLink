import 'package:MediLink/lojain/View/Home/Medical%20file.dart';
import 'package:MediLink/lojain/View/Home/Medicalexaminations.dart';
import 'package:MediLink/lojain/View/Home/Medicine.dart';
import 'package:MediLink/lojain/View/Home/Puplic.dart';
import 'package:MediLink/lojain/View/Home/Sensitivity.dart';
import 'package:MediLink/lojain/View/Home/Surgicaloperations.dart';
import 'package:MediLink/lojain/View/Home/Visits.dart';
import 'package:MediLink/lojain/View/Home/illness.dart';
import 'package:flutter/material.dart';

class Recordsection extends StatelessWidget {
  final String id;
  final String image;
  final String text;
  const Recordsection(
      {Key? key, required this.image, required this.text, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (id == '1') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Puplic(),
          ));
        } else if (id == '2')
          // ignore: curly_braces_in_flow_control_structures
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>  Visits(),
          ));
        else if (id == '3')

          // ignore: curly_braces_in_flow_control_structures
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>  Medicine(),
          ));
        else if (id == '4')
          // ignore: curly_braces_in_flow_control_structures
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>  Illness(),
          ));
        else if (id == '5')
          // ignore: curly_braces_in_flow_control_structures
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>  Sensitivity(),
          ));
        else if (id == '6')
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Surgicaloperations(),
          ));
        else if (id == '7')
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Medicalexaminations(),
          ));
        else
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const MedicalFile(),
          ));
      },
      child: Container(
        width: 169,
        height: 171,
        child: Column(
          children: [
            Image.asset(image),
            Container(
              width: 159,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    text,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  )),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(38, 115, 221, 0.08)),
                    child: const Icon(Icons.arrow_outward_rounded),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
