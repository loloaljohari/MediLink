import 'package:flutter/material.dart';

class Lastupdate extends StatelessWidget {
  final String imagePath;
  final String date;
  final String namedoctor;
  final String medSpecialty;

  const Lastupdate(
      {Key? key,
      required this.imagePath,
      required this.date,
      required this.namedoctor,
      required this.medSpecialty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 94,
      decoration: BoxDecoration(
        gradient: LinearGradient(
           
          colors: [Color.fromRGBO(64, 123, 255, 0.2),Color.fromRGBO(64, 123, 255, 0.9)]),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 54,
            height: 52,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),
            child: Image.network(imagePath),
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
                          color: Colors.white,
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
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.w700, fontSize: 10),
                      )
                    ],
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                        width: 16,
                        height: 18,
                        child: Image.asset(
                          'images/Vector (1).png',
                          fit: BoxFit.cover,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Text(date,
                        style: TextStyle(
                          color: Colors.white,
                            fontWeight: FontWeight.w400, fontSize: 12)),
                  ],
                ),
                 SizedBox(
                      height: 10,
                    ),
                InkWell(
                  onTap: () {
                    
                  },
                  child: Container(width: 69, height: 22,
                  decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1,color: Colors.white)
                  ),
                   child: Center(child: Text('view',style: TextStyle(color: Colors.white),))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
