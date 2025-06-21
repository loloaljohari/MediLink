import 'package:MediLink/widgets/HomeWidgets/Doctors/LastVisit.dart';
import 'package:MediLink/widgets/HomeWidgets/Doctors/doctorWidget.dart';
import 'package:flutter/material.dart';
    
class AllDoctors extends StatelessWidget {

  const AllDoctors({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: const Text('All Doctors',style: TextStyle(color: Colors.white),)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
           Container(
                 
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('images/Group 929.png'), 
                        SizedBox(width: 10,),
                        Text('Last Visit',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 16))
                      ],
                    ),
                    SizedBox(height: 10,),
                    Lastvisit(imagePath: 'images/Rectangle 675.png',day: 'monday',date: '15 May',medSpecialty:'Cardiomyopathy' ,namedoctor: 'Dr. Ali Kane',),
                    SizedBox(height: 25,),
                    Row(children: [
                       Image.asset('images/Vector20.png'),
                       SizedBox(width: 10,),
                       Text('Available Doctor',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 16))
                    ],),
                
                  ],
                ),
           
            ),
SizedBox(height: 10,),
            
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 25,mainAxisExtent: 265,mainAxisSpacing: 10), children: [
                          DoctorWidget(
                            showStar: false,
                        imageDoctor: 'images/unsplash_pTrhfmj2jDA.png',
                        medSpecialty: 'Cardiomyopathy',
                        namedoctor: 'Dr. Ali Kane',
                        star: '  4.5',
                      ),
                     
                       DoctorWidget(
                        showStar: false,
                        imageDoctor: 'images/unsplash_jnodpAk8H7c.png',
                        medSpecialty: 'Psychologist',
                        namedoctor: 'Dr. Adnan',
                        star: '4.6',
                      ),
                        DoctorWidget(
                          showStar: false,
                        imageDoctor: 'images/unsplash_7bMdiIqz_J4 (2).png',
                        medSpecialty: 'Cardiomyopathy',
                        namedoctor: 'Dr. Abd Othman',
                        star: '  4.5',
                      ),  DoctorWidget(
                        showStar: false,
                        imageDoctor: 'images/unsplash_FVh_yqLR9eA.png',
                        medSpecialty: 'Nervous',
                        namedoctor: 'Dr. Malak',
                        star: '  4.5',
                      ),
              ]),
            ),
            
           
          ],
        ),
      ),
    );
  }
}