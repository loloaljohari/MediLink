import 'package:flutter/material.dart';
    
class AlarmContainer extends StatelessWidget {

  const AlarmContainer({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return   Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              height: 86,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Color.fromRGBO(38, 115, 221, 0.1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 37,
                    height: 37,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset('images/Group 1017.png'),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('10:00 AM',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),),
                      Text('Daily',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w400)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset('images/Vector (9).png'),
                          SizedBox(width: 3,),
                           Text('Aspirin',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700)),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('images/Vector (10).png'),
                          SizedBox(width: 3,),
                           Text('2 Pill',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ],
                  ),
                 InkWell(onTap: () {
                   
                 },child: Image.asset('images/Vector (11).png')) 
                ],
              ),
            );
  }
}