import 'package:MediLink/View/OnboardingScrean/choosethetheme.dart';
import 'package:MediLink/widgets/SelectThemeWidgets/LogoText.dart';
import 'package:flutter/material.dart';

class Secondscrean extends StatefulWidget {
  const Secondscrean({Key? key}) : super(key: key);

  @override
  _SecondscreanState createState() => _SecondscreanState();
}

class _SecondscreanState extends State<Secondscrean> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(microseconds:100 ), () {
      Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 1500), // زمن التأخير
            pageBuilder: (context, animation, secondaryAnimation) =>
                MyWidget1(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation.drive(CurveTween(
                    curve: Curves.easeOut)), // تأثير Smart Animate مع EaseOut
                child: child,
              );
            },
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Align(
        alignment: Alignment(-0.07, -0.01),
        child: Container(
          width: 170,
          height: 170,
          decoration: BoxDecoration(
              color: Color.fromRGBO(38, 115, 221, 0.13),
              borderRadius: BorderRadius.circular(100)),
        ),
      ),
    );
  }
}

class MyWidget1 extends StatefulWidget {
  const MyWidget1({super.key});

  @override
  State<MyWidget1> createState() => _MyWidget1State();
}

class _MyWidget1State extends State<MyWidget1> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 900), () {
      Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 1500), // زمن التأخير
            pageBuilder: (context, animation, secondaryAnimation) =>
                MyWidget2(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation.drive(CurveTween(
                    curve: Curves.easeOut)), // تأثير Smart Animate مع EaseOut
                child: child,
              );
            },
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 371,
                height: 371,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(38, 115, 221, 0.13),
                    borderRadius: BorderRadius.circular(300)),
              ),
              Align(
                alignment: Alignment(-0.07, -0.01),
                child: Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(38, 115, 221, 0.13),
                      borderRadius: BorderRadius.circular(100)),
                ),
              ),
            ],
          ),
        ));
  }
}

class MyWidget2 extends StatefulWidget {
  const MyWidget2({super.key});

  @override
  State<MyWidget2> createState() => _MyWidget2State();
}

class _MyWidget2State extends State<MyWidget2> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 900), () {
      Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 1500), // زمن التأخير
            pageBuilder: (context, animation, secondaryAnimation) =>
                MyWidget3(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation.drive(CurveTween(
                    curve: Curves.easeOut)), // تأثير Smart Animate مع EaseOut
                child: child,
              );
            },
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 371,
                height: 371,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(38, 115, 221, 0.13),
                    borderRadius: BorderRadius.circular(300)),
              ),
              Align(
                alignment: Alignment(-0.07, -0.01),
                child: Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(38, 115, 221, 0.13),
                      borderRadius: BorderRadius.circular(100)),
                ),
              ),
              Logotext(),
            ],
          ),
        ));
  }
}

class MyWidget3 extends StatefulWidget {
  const MyWidget3({super.key});

  @override
  State<MyWidget3> createState() => _MyWidget3State();
}

class _MyWidget3State extends State<MyWidget3> {
  
 @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds:900), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds:1500), // زمن التأخير
          pageBuilder: (context, animation, secondaryAnimation) => MyWidget4(),
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
        backgroundColor: Colors.black,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 371,
                height: 371,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(38, 115, 221, 0.13),
                    borderRadius: BorderRadius.circular(300)),
              ),
              Image.asset('images/Vector 485.png'),
              Align(
                alignment: Alignment(-0.07, -0.01),
                child: Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(38, 115, 221, 0.13),
                      borderRadius: BorderRadius.circular(100)),
                ),
              ),
              Logotext(),
            ],
          ),
        ));
  }
}

class MyWidget4 extends StatefulWidget {
  const MyWidget4({super.key});

  @override
  State<MyWidget4> createState() => _MyWidget4State();
}

class _MyWidget4State extends State<MyWidget4> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
     Future.delayed(Duration(milliseconds:900), () {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Choosethetheme()), (route)=>false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 371,
                height: 371,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(38, 115, 221, 0.13),
                    borderRadius: BorderRadius.circular(300)),
              ),
              Align(alignment: Alignment(-0.13, 0.15),child: Image.asset('images/lojain.png')),
              Align(
                alignment: Alignment(-0.07, -0.0),
                child: Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Color.fromRGBO(255, 255, 255, 0.15),blurRadius: 25,spreadRadius: 0,offset: Offset(0,0))
                    ],
                      color: Color.fromRGBO(38, 115, 221, 0.1),
                      borderRadius: BorderRadius.circular(100)),
                ),
              ),
              Logotext(),
            ],
          ),
        ));
  }
}