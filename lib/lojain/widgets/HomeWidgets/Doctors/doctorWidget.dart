import 'package:MediLink/lojain/widgets/HomeWidgets/Doctors/DoctorInfo.dart';
import 'package:flutter/material.dart';

class DoctorWidget extends StatelessWidget {
  final bool showStar;
  final String imageDoctor;
  final String namedoctor;
  final String medSpecialty;
  final id;
  String star;
  DoctorWidget(
      {super.key,
      required this.imageDoctor,
      required this.namedoctor,
      required this.medSpecialty,
      required this.star,
      required this.showStar,required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  DoctorInfo(id:id),
              transitionDuration: Duration(milliseconds: 300),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var curve = CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeIn,
                );
                return FadeTransition(
                  opacity: curve,
                  child: child,
                );
              },
            ));
      },
      child: Column(
        children: [
          showStar == false
              ? Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: 169,
                      height: 205,
                    
                    ),
                    Container(
                      width: 169,
                      height: 152,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(38, 115, 221, 0.2),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                              bottomLeft: Radius.circular(100))),
                    ),
                    ClipRRect(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(100)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 7.0, bottom: 2),
                          child: Container(
                              width: 160,
                              height: 190,
                              child: Image.network(imageDoctor)),
                        ))
                  ],
                )
              : Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          width: 169,
                          height: 205,
                         
                        ),
                        Container(
                          width: 169,
                          height: 152,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(38, 115, 221, 0.2),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32),
                                  topRight: Radius.circular(32),
                                  bottomLeft: Radius.circular(100))),
                        ),
                        ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 7.0, bottom: 2),
                              child: Container(
                                  width: 160,
                                  height: 190,
                                  child: Image.network(imageDoctor)),
                            ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 125.0),
                      child: Row(
                        children: [
                          Text(
                            star,
                            style: TextStyle(
                                 
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Icon(
                            Icons.star,
                            color: Color.fromRGBO(212, 184, 41, 1),
                            size: 16.7,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          SizedBox(
            height: 4,
          ),
          Container(
              padding: EdgeInsets.only(left: 20),
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('images/Vector15.png'),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    namedoctor,
                    style: TextStyle(
                         
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  )
                ],
              )),
          Container(
              padding: EdgeInsets.only(left: 20, top: 2),
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('images/Vector16.png'),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    medSpecialty,
                    style: TextStyle(
                         
                        fontWeight: FontWeight.w700,
                        fontSize: 10),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
