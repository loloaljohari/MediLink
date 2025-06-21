import 'package:MediLink/widgets/HomeWidgets/Record/Public/BmiScale%20.dart';
import 'package:flutter/material.dart';

class Puplic extends StatelessWidget {
  const Puplic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromRGBO(38, 115, 221, 1),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 70),
          child: Text(
            'Public',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: ListView(
          children: [
            Row(
              children: [
                Image.asset('images/Group (3).png'),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'BMI Calculator',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 218,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(begin: Alignment.topLeft, colors: [
                    Color.fromRGBO(64, 123, 255, 0.4),
                    Color.fromRGBO(64, 123, 255, 0.05)
                  ])),
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 27.0, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Omar Abo howa',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                '37.5',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w900),
                              ),
                              Text(
                                'BMI Score',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Image.asset('images/Character.png'),
                        ],
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                '22 yrs',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'Age',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Container(
                            height: 34,
                            width: 1,
                            color: Colors.white,
                          ),
                          Column(
                            children: [
                              Text(
                                '165 cm',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'Height',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Container(
                            height: 34,
                            width: 1,
                            color: Colors.white,
                          ),
                          Column(
                            children: [
                              Text(
                                '61 Kg',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'Weight',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: double.infinity,
                height: 218,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(begin: Alignment.topLeft, colors: [
                      Color.fromRGBO(64, 123, 255, 0.4),
                      Color.fromRGBO(64, 123, 255, 0.05)
                    ])),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Last update',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                '9 Jun , 2025',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Text(
                            '37.5',
                            style: TextStyle(
                                fontSize: 44, fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DashedGradientBar(
                        segments: 60,
                        bmi: 37.5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: Text(
                              'You are Normal ,you should:\n keep your health like this , And exercise sports',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400)))
                    ],
                  ),
                )),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Image.asset('images/Vector (15).png'),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'your Details',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Weight:',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 108,
                      height: 52,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              colors: [
                                Color.fromRGBO(64, 124, 255, 0.055),
                                Color.fromRGBO(64, 124, 255, 0.344)
                              ])),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('images/Group 1001.png'),
                          Text('61.53',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700)),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Height:',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 108,
                      height: 52,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              colors: [
                                Color.fromRGBO(64, 124, 255, 0.055),
                                Color.fromRGBO(64, 124, 255, 0.344)
                              ])),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('images/Vector (16).png'),
                          Text('176.3',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700)),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Gender:',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 108,
                      height: 52,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              colors: [
                                Color.fromRGBO(64, 124, 255, 0.055),
                                Color.fromRGBO(64, 124, 255, 0.344)
                              ])),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.male,
                            color: Color.fromRGBO(15, 102, 222, 1),
                          ),
                          Text('male',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700)),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
           ,
           SizedBox(height: 15,),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Age:',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 108,
                      height: 52,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              colors: [
                                Color.fromRGBO(64, 124, 255, 0.055),
                                Color.fromRGBO(64, 124, 255, 0.344)
                              ])),
                      child: Center(
                        child: Text('year month day', style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400)),
                      )
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Birthday:',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 108,
                      height: 52,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              colors: [
                                Color.fromRGBO(64, 124, 255, 0.055),
                                Color.fromRGBO(64, 124, 255, 0.344)
                              ])),
                      child:Center(
                        child: Text('24 / 11 / 2004', style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400)),
                      )
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Social Status:',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 108,
                      height: 52,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              colors: [
                                Color.fromRGBO(64, 124, 255, 0.055),
                                Color.fromRGBO(64, 124, 255, 0.344)
                              ])),
                      child: Center(
                        child: Text('Single', style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400)),
                      )
                    )
                  ],
                ),
              ],
            )
           ,
           
          ],
        ),
      ),
    );
  }
}
