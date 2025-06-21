import 'package:flutter/material.dart';

class Lastvisit extends StatelessWidget {
  
final String imagePath;
final String day;
final String date;
final String namedoctor;
final String medSpecialty;

  const Lastvisit({Key? key, required this.imagePath, required this.day, required this.date, required this.namedoctor, required this.medSpecialty}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 72,
      decoration: BoxDecoration(
          color: Color.fromRGBO(38, 115, 221, 1),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 54,
            height: 52,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),
            child: Image.asset(imagePath),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('images/Vector333.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        namedoctor,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      )
                    ],
                  )),
              Container(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('images/Vector9.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        medSpecialty,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 10),
                      )
                    ],
                  )),
            ],
          ),
          Container(
              width: 31,
              height: 34,
              child: Image.asset(
                'images/Vector (1).png',
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Column(
              children: [
                Text(date,
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                Text(day,
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
