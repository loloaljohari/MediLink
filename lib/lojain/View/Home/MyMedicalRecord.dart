import 'package:MediLink/lojain/Controllers/mydates/ButtonsDates.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Doctors/LastVisit.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Record/lastupdate.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Record/recordsection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class MyMedicalRecord extends StatelessWidget {
   MyMedicalRecord({Key? key}) : super(key: key);
  
  List list=[

    {
      'id':'1',
      'image':'images/Group 942.png',
      'text':'Public',
       
    },
    {
      'id':'2',
      'image':'images/Group 978.png',
      'text':'Visits',
       
    },
    {
      'id':'3',
      'image':'images/Group 957.png',
      'text':'Medicine',
       
    },
     {
      'id':'4',
      'image':'images/Group 953 (2).png',
      'text':'Illness',
       
    },
     {
      'id':'5',
      'image':'images/Group 950.png',
      'text':'Sensitivity',
       
    },
     {
      'id':'6',
      'image':'images/Group 964.png',
      'text':'Surgical operations',
       
    },
     {
      'id':'7',
      'image':'images/Group 968.png',
      'text':'Medical examinations',
       
    },
     {
      'id':'8',
      'image':'images/Group 973.png',
      'text':'Medical file',
       
    },
   
  ];


  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create:  (context) => Buttonsdates())
      ],
      child: Scaffold(
        appBar: AppBar(
        
          title: Center(
              child: const Text(
            'My Medical Record',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          )),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('images/Group 929.png'),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    'Last Update',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Lastupdate(
                imagePath: 'images/Rectangle 675.png',
                date: '15 May',
                medSpecialty: 'Cardiomyopathy',
                namedoctor: 'Dr. Ali Kane',
              ),
              SizedBox(
                height: 10,
              ),
            Row(
                children: [
                  Image.asset('images/Mask group.png'),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    'Record Section',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
           SizedBox(height: 10,),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 25,mainAxisExtent: 170,mainAxisSpacing: 10),
                itemCount: list.length,
                 itemBuilder: (context, index) {
                    return Recordsection(image: list[index]['image'],text: list[index]['text'],id:list[index]['id'] ,);
      
                 },
              ),
            ),
            SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
