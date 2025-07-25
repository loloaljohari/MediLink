import 'package:MediLink/ammar/lib/view/screen/aouth/sinup.dart';
import 'package:MediLink/lojain/models/record/Getpatientrecord/pulbicmodel.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Record/Public/BmiScale%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Puplic extends StatelessWidget {
  const Puplic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GetPublicCubit>().fetch();
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
      body: BlocBuilder<GetPublicCubit, GetPublicState>(
          builder: (context, state) {
        if (state is GetPublicLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetPublicLoaded) {
          if (state.public.containsKey('data')) {
            if (state.public['data'].isNotEmpty) {
              return Padding(
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
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
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
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              colors: [
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Omar Abo howa',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "${state.public['data']['bmi']}",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        'BMI Score',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        '${state.public['data']['age']['years']} yrs',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        'Age',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
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
                                        '${state.public['data']['height']} cm',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        'Height',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
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
                                        '${state.public['data']['weight']} Kg',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        'Weight',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
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
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                colors: [
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Last update',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        '9 Jun , 2025',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "${state.public['data']['bmi']}",
                                    style: TextStyle(
                                        fontSize: 44,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              DashedGradientBar(
                                segments: 60,
                                bmi: state.public['data']['bmi'],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                  child: Text(
                                      'You are Normal ,you should:\n keep your health like this , And exercise sports',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)))
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
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset('images/Group 1001.png'),
                                  Text('${state.public['data']['weight']}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset('images/Vector (16).png'),
                                  Text('${state.public['data']['height']}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.male,
                                    color: Color.fromRGBO(15, 102, 222, 1),
                                  ),
                                  Text(state.public['data']['gender'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
                                padding: EdgeInsets.all(2),
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
                                  child: Text(
                                      '${state.public['data']['age']['formatted']}',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                ))
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
                                child: Center(
                                  child: Text(
                                      '${state.public['data']['date_birth']}',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                ))
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
                                  child: Text(
                                      state.public['data']['matital_status'],
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                ))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset('images/Vector (15).png'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Blood clique',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('your',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                padding: EdgeInsets.all(2),
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
                                  child: Text(
                                      '${state.public['data']['blood_type']}',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                ))
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Acceptable',
                                style: TextStyle(
                                    color: Color.fromRGBO(16, 175, 11, 1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400)),
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
                                  child: Container(
                                    child: Expanded(
                                      child: Wrap(
                                          children: List.generate(
                                        state.public['data']['can_receive_from']
                                            .length,
                                        (index) {
                                          return Text(
                                              "${state.public['data']['can_receive_from'][index]} ${index + 1 == state.public['data']['can_receive_from'].length ? "" : ','} ",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400));
                                        },
                                      ).toList()),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Forbidden',
                                style: TextStyle(
                                    color: Color.fromRGBO(175, 11, 11, 1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                padding: EdgeInsets.all(2),
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
                                  child: Container(
                                    height: 170,
                                    child: Expanded(
                                      child: Wrap(
                                          children: List.generate(
                                        state
                                            .public['data']
                                                ['cannot_receive_from']
                                            .length,
                                        (index) {
                                          return Text(
                                              "${state.public['data']['cannot_receive_from'][index]} ${index + 1 == state.public['data']['cannot_receive_from'].length ? " ." : ','} ",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400));
                                        },
                                      ).toList()),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset('images/Vector (15).png'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Addictions',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 52,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              colors: [
                                Color.fromRGBO(64, 124, 255, 0.055),
                                Color.fromRGBO(64, 124, 255, 0.344)
                              ])),
                      child: Center(
                        child: Wrap(
                          children: [
                            Text(
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                                ' ${state.public['data']['addictions']['smoker'] == true ? '• smoker' : ''}  ${state.public['data']['addictions']['alcohol'] == true ? '• alcohol' : ''}    ${state.public['data']['addictions']['drug'] == true ? '• drug' : ''}')
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            } else
              return Text('empty');
          } else if(state.public['message']=='Unauthenticated')
            return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 150,
                    width: double.infinity,
                    
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color:  Color.fromRGBO(130, 182, 255, 1),blurRadius: 18,spreadRadius: 1),

                      ],
                      color:  Color.fromRGBO(21, 62, 120, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                    Text(
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                        '${state.public['message']}: To view your medical record, you must have an account on the app. Sign up for our app to access our services.'),
                    ElevatedButton(
                        style: ButtonStyle(
                            fixedSize: WidgetStatePropertyAll(Size(120, 20)),
                            backgroundColor: WidgetStatePropertyAll(
                                Color.fromRGBO(38, 115, 221, 1))),
                        onPressed: () {
                          Get.to(Sinup(
                            conte: context,
                          ));
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        )),
                                  ],
                                ),
                  ),
                ));
        else return Text(state.public['message']);
        } else if (state is GetPublicError) {
          return Container(height: MediaQuery.of(context).size.height,child: Center(child: Text(state.messageError.toString())));
        } else
          return SizedBox();
      }),
    );
  }
}
