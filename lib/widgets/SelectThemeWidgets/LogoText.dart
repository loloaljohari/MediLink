import 'package:flutter/material.dart';

class Logotext extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return   Center(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(alignment: Alignment.center,child: Image.asset('images/Vector.png')),
                  Column(
                    children: [
                      SizedBox(
                        height: 386,
                      ),
                      Container(
                          width: 150,
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Atik gohel",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              foreground: Paint()
                                ..shader = LinearGradient(
                                  colors: [
                                    Colors.white,
                                    Colors.white,
                                    Color.fromRGBO(64, 123, 255, 1)
                                  ],
                                  stops: [0, 0.6, 1],
                                  begin: Alignment.center,
                                  end: Alignment.centerRight,
                                ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                            ),
                          )),
                     Container(
                          alignment: Alignment.centerLeft,
                          color: Color.fromRGBO(64, 123, 255, 1),
                          width: 157,
                          height: 0.9,
                        ),
                    
                      Container(
                        width: 157,
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Your Health out wealth',
                            style: TextStyle(color: Colors.white),
                          )),
                      Container(
                        width: 157,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            color: Color.fromRGBO(64, 123, 255, 1),
                            width: 149,
                            height: 0.9,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
