import 'package:MediLink/ammar/lib/view/screen/aouth/sinup.dart';
import 'package:MediLink/lojain/models/record/Getpatientrecord/pulbicmodel.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Record/Public/BmiScale%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../Controllers/onboarding/SelectionLang.dart';
import '../../Controllers/onboarding/SelectionTheme.dart';


class Puplic extends StatelessWidget {
  const Puplic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GetPublicCubit>().fetch();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromRGBO(38, 115, 221, 1),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 70, right: 70),
          child: Text(
            context.watch<Selection>().state == 1 ? 'العامة' : 'Public',
            // style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: BlocBuilder<GetPublicCubit, GetPublicState>(
          builder: (context, state) {
        if (state is GetPublicLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: context.watch<SelectionTheme>().state == 3
                  ? Colors.white
                  : Colors.black,
            ),
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
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          context.watch<Selection>().state == 1
                              ? 'حاسبة مؤشر كتلة الجسم'
                              : 'BMI Calculator',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      height: 218,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
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
                                        '${state.public['data']['name']}',
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "${state.public['data']['bmi']}",
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        context.watch<Selection>().state == 1
                                            ? 'مؤشر كتلة الجسم'
                                            : 'BMI Score',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Image.asset('images/Character.png'),
                                ],
                              ),
                              const Divider(
                                color: Colors.white,
                              ),
                              const SizedBox(
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
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        context.watch<Selection>().state == 1
                                            ? 'العمر'
                                            : 'Age',
                                        style: const TextStyle(
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
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        context.watch<Selection>().state == 1
                                            ? 'الطول'
                                            : 'Height',
                                        style: const TextStyle(
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
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        context.watch<Selection>().state == 1
                                            ? 'الوزن'
                                            : 'Weight',
                                        style: const TextStyle(
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
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: double.infinity,
                        height: 218,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
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
                                  // Column(
                                  //   crossAxisAlignment:
                                  //       CrossAxisAlignment.start,
                                  //   children: [
                                  //     Text(
                                  //       'Last update',
                                  //       style: TextStyle(
                                  //           fontSize: 12,
                                  //           fontWeight: FontWeight.w400),
                                  //     ),
                                  //     Text(
                                  //       '9 Jun , 2025',
                                  //       style: TextStyle(
                                  //           fontSize: 16,
                                  //           fontWeight: FontWeight.w400),
                                  //     ),
                                  //   ],
                                  // ),
                                  Text(
                                    "${state.public['data']['bmi']}",
                                    style: const TextStyle(
                                        fontSize: 44,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              DashedGradientBar(
                                segments: 60,
                                bmi: state.public['data']['bmi'],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                  child: Text(
                                      state.public['data']['bmi'] > 25.5
                                          ? context.watch<Selection>().state ==
                                                  1
                                              ? 'ذلك مؤشرًا على زيادة الوزن:\nاحرص على شرب كمية كافية من الماء يوميًا، فالماء يساعد في تحسين الهضم، وتنظيم درجة حرارة الجسم، ويعزز من صحة البشرة. يُنصح بشرب حوالي 8 أكواب من الماء يوميًا>'
                                              : 'This is an indicator of weight gain:\n Make sure to drink enough water daily, as water helps improve digestion, regulate body temperature, and enhances skin health. It is recommended to drink about 8 cups of water daily.'
                                          : state.public['data']['bmi'] < 18.5
                                              ? context
                                                          .watch<Selection>()
                                                          .state ==
                                                      1
                                                  ? 'تعاني من نقص الوزن:\nلزيادة الوزن بشكل صحي يتطلب تناول أطعمة غنية بالسعرات الحرارية والمغذيات مع ممارسة الرياضة بانتظام.'
                                                  : 'Underweight: To gain weight healthily, it requires consuming foods rich in calories and nutrients while exercising regularly.'
                                              : context
                                                          .watch<Selection>()
                                                          .state ==
                                                      1
                                                  ? 'أنت طبيعي، يجب عليك: \nالحفاظ على صحتك هكذا، وممارسة الرياضة'
                                                  : 'You are Normal ,you should:\n keep your health like this , And exercise sports',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)))
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Image.asset('images/Vector (15).png'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          context.watch<Selection>().state == 1
                              ? 'تفاصيلك'
                              : 'your Details',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                context.watch<Selection>().state == 1
                                    ? 'الوزن'
                                    : 'Weight:',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400)),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 108,
                              height: 52,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: const LinearGradient(
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
                                      style: const TextStyle(
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
                            Text(
                                context.watch<Selection>().state == 1
                                    ? 'الطول'
                                    : 'Height:',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400)),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 108,
                              height: 52,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: const LinearGradient(
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
                                      style: const TextStyle(
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
                            Text(
                                context.watch<Selection>().state == 1
                                    ? 'الجنس'
                                    : 'Gender:',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400)),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 108,
                              height: 52,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      colors: [
                                        Color.fromRGBO(64, 124, 255, 0.055),
                                        Color.fromRGBO(64, 124, 255, 0.344)
                                      ])),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(
                                    Icons.male,
                                    color: Color.fromRGBO(15, 102, 222, 1),
                                  ),
                                  Text(state.public['data']['gender'],
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                context.watch<Selection>().state == 1
                                    ? 'العمر'
                                    : 'Age:',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400)),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                                padding: const EdgeInsets.all(2),
                                width: 108,
                                height: 52,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        colors: [
                                          Color.fromRGBO(64, 124, 255, 0.055),
                                          Color.fromRGBO(64, 124, 255, 0.344)
                                        ])),
                                child: Center(
                                  child: Text(
                                      context.watch<Selection>().state == 1
                                          ? '${state.public['data']['age']['years']} سنة'
                                          : '${state.public['data']['age']['years']} years',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                ))
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                context.watch<Selection>().state == 1
                                    ? 'تاريخ الميلاد'
                                    : 'Birthday:',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400)),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                                width: 108,
                                height: 52,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        colors: [
                                          Color.fromRGBO(64, 124, 255, 0.055),
                                          Color.fromRGBO(64, 124, 255, 0.344)
                                        ])),
                                child: Center(
                                  child: Text(
                                      '${state.public['data']['date_birth']}',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                ))
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                context.watch<Selection>().state == 1
                                    ? 'الحالة الاجتماعية'
                                    : 'Social Status:',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400)),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                                width: 108,
                                height: 52,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        colors: [
                                          Color.fromRGBO(64, 124, 255, 0.055),
                                          Color.fromRGBO(64, 124, 255, 0.344)
                                        ])),
                                child: Center(
                                  child: Text(
                                      state.public['data']['matital_status'],
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                ))
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset('images/Vector (15).png'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          context.watch<Selection>().state == 1
                              ? 'زمرة الدم'
                              : 'Blood clique',
                          style: const TextStyle(
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
                            Text(
                                context.watch<Selection>().state == 1
                                    ? 'التي لديك'
                                    : 'your',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400)),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                                padding: const EdgeInsets.all(2),
                                width: 108,
                                height: 52,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        colors: [
                                          Color.fromRGBO(64, 124, 255, 0.055),
                                          Color.fromRGBO(64, 124, 255, 0.344)
                                        ])),
                                child: Center(
                                  child: Text(
                                      '${state.public['data']['blood_type']}',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                ))
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                context.watch<Selection>().state == 1
                                    ? 'مقبول'
                                    : 'Acceptable',
                                style: const TextStyle(
                                    color: Color.fromRGBO(16, 175, 11, 1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400)),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                                width: 108,
                                height: 52,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: const LinearGradient(
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
                                              style: const TextStyle(
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
                            Text(
                                context.watch<Selection>().state == 1
                                    ? 'مرفوض'
                                    : 'Forbidden',
                                style: const TextStyle(
                                    color: Color.fromRGBO(175, 11, 11, 1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400)),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                                padding: const EdgeInsets.all(2),
                                width: 108,
                                height: 52,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: const LinearGradient(
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
                                              style: const TextStyle(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset('images/Vector (15).png'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          context.watch<Selection>().state == 1
                              ? 'الأدمانات'
                              : 'Addictions',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 52,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              colors: [
                                Color.fromRGBO(64, 124, 255, 0.055),
                                Color.fromRGBO(64, 124, 255, 0.344)
                              ])),
                      child: Center(
                        child: Wrap(
                          children: [
                            Text(
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                                ' ${state.public['data']['addictions']['smoker'] == true ? '• smoker' : ''}  ${state.public['data']['addictions']['alcohol'] == true ? '• alcohol' : ''}    ${state.public['data']['addictions']['drug'] == true ? '• drug' : ''}')
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            } else
           {   return Text(
                  context.watch<Selection>().state == 1 ? 'فارغ' : 'empty');
         } } else if (state.public['message'] == 'Unauthenticated') {
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(130, 182, 255, 1),
                        blurRadius: 18,
                        spreadRadius: 1),
                  ],
                  color: const Color.fromRGBO(21, 62, 120, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        context.watch<Selection>().state == 1
                            ? 'للاطلاع على سجلك الطبي، يجب أن يكون لديك حساب على التطبيق. سجل في تطبيقنا للوصول إلى خدماتنا.'
                            : '${state.public['message']}: To view your medical record, you must have an account on the app. Sign up for our app to access our services.'),
                    ElevatedButton(
                        style: const ButtonStyle(
                            fixedSize: WidgetStatePropertyAll(Size(120, 20)),
                            backgroundColor: WidgetStatePropertyAll(
                                Color.fromRGBO(38, 115, 221, 1))),
                        onPressed: () {
                          Get.to(Sinup(
                            
                          ));
                        },
                        child: Text(
                          context.watch<Selection>().state == 1
                              ? 'اشتراك'
                              : 'Register',
                          style: const TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ),
            ));
          } else {
            return Text(state.public['message']);
          }
        } else if (state is GetPublicError) {
          return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Center(child: Text(state.messageError.toString())));
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
