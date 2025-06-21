import 'package:MediLink/View/SplashScrean/splashscreen.dart';
import 'package:MediLink/widgets/HomeWidgets/Doctors/doctorWidget.dart';
import 'package:MediLink/widgets/HomeWidgets/home/theNearestDate.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Image.asset('images/Vector0.png'),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'How are your feeling today ?',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:19.0),
                  child: Image.asset('images/Vector4.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Upcoming Appointments',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text('view all',
                        style: TextStyle(
                            color: Color.fromRGBO(38, 115, 221, 1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16)))
              ],
            ),
            TheNearestDate(
              Dates: false,
              Imagepath: 'images/unsplash_7bMdiIqz_J4 (2).png',
              medSpecialty: 'Cardiomyopathy',
              namedoctor: 'Dr. Ali Kane',
              Date: '15 May , Monday',
              Time: '8:00 - 9:00 PM',
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Image.asset('images/Vector13.png'),
                ),
                Text(
                  'Available Doctor',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 80,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text('view all',
                        style: TextStyle(
                            color: Color.fromRGBO(38, 115, 221, 1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16)))
              ],
            ),
          
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:[
                   DoctorWidget(
                    showStar: true,
                      imageDoctor: 'images/unsplash_7bMdiIqz_J4 (2).png',
                      medSpecialty: 'Cardiomyopathy',
                      namedoctor: 'Dr. Ali Kane',
                      star: '  4.5',
                    ),
                     DoctorWidget(
                      showStar: true,
                      imageDoctor: 'images/unsplash_NMkGww4E7B0.png',
                      medSpecialty: 'Psychiatry',
                      namedoctor: 'Dr. Alaa',
                      star: '4.8',
                    )
                    ,
                     DoctorWidget(
                      showStar: true,
                      imageDoctor: 'images/unsplash_jnodpAk8H7c.png',
                      medSpecialty: 'Cardiomyopathy',
                      namedoctor: 'Dr. Ali Kane',
                      star: '4.6',
                    )
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}
