import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  final String Imagepath;
  final String namedoctor;
  final String time;
  final String date;
  const DateWidget({Key? key, required this.Imagepath, required this.namedoctor, required this.time, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(34, 34, 34, 1)),
      child: Row(
       children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Color.fromRGBO(38, 115, 221, 1)),
            width: 2,
            height: 80,
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            width: 68,
            height: 80,
            child: Image.asset(
              Imagepath,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 20),
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset('images/Vector (6).png'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            namedoctor,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          )
                        ],
                      )),

                  Center(
                    child: Container(
                   
                      child: Row(
                        
                        children: [
                          Container(
                              width: 18,
                              height: 18,
                              child: Image.asset(
                                'images/Vector (5).png',
                                fit: BoxFit.cover,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            date,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Row(
                        children: [
                          Icon(
                            Icons.cancel_outlined,
                            size: 20,
                            color: Color.fromRGBO(168, 40, 48, 1),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Cancel',
                            style: TextStyle(
                                color: Color.fromRGBO(168, 40, 48, 1),
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_alarms_rounded,
                          color: Color.fromRGBO(38, 115, 221, 1),
                          size: 20,
                        ),
                        Text(
                          '   $time',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
      
    );
  }
}
