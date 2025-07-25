import 'package:MediLink/lojain/View/SplashScrean/secondscrean.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
 void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds:3200), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds:1200), // زمن التأخير
          pageBuilder: (context, animation, secondaryAnimation) => Secondscrean(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation.drive(CurveTween(curve: Curves.easeOut)), // تأثير Smart Animate مع EaseOut
              child: child,
            );
          },
 ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      // floatingActionButton: Image.asset('images/DOWN.png'),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 430,alignment: Alignment.bottomCenter,child: Image.asset('images/Vector.png')),
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
          ),
          SizedBox(height: 100,),
           Container(width: 400,alignment: Alignment.bottomRight,child: Image.asset('images/DOWN.png'))
        ],
      ),
    );
  }
}
