import 'package:flutter/material.dart';

class Medicinewidget extends StatelessWidget {
 
 final int id;
 final String  Medicalname;
 final String  Tradename;
 final String  alternative;

 const Medicinewidget({super.key, required this.id, required this.Medicalname, required this.Tradename, required this.alternative});
    
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset('images/Vector (9).png'),
            SizedBox(
              width: 3,
            ),
            Text(
              'Medicine_$id:',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Medical name',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.38),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                 Medicalname,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
           SizedBox(width: 40,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Trade name',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.38),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  Tradename,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(width: 40,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'alternative',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.38),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  alternative,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
