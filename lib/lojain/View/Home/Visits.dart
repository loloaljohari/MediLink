import 'package:MediLink/lojain/Controllers/onboarding/SelectionTheme.dart';
import 'package:MediLink/lojain/Controllers/record/SliderValueCubit.dart';
import 'package:MediLink/lojain/models/Visits/getallvisits.dart';
import 'package:MediLink/lojain/models/Visits/postEvaluate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../Controllers/onboarding/SelectionLang.dart';

class Visits extends StatelessWidget {
  Visits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GetallvisitsCubit>().fetchProfile();
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
            padding: EdgeInsets.only(left: 100, right: 100),
            child: Text(
              context.watch<Selection>().state == 1 ? 'الزيارات' : 'Visits',
              // style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: BlocBuilder<GetallvisitsCubit, GetallvisitsState>(
          builder: (context, state) {
         if(state is GetallvisitsLoading){
          return  Center(
            child: CircularProgressIndicator(
              color:  context .watch<SelectionTheme>().state==3? Colors.white:Colors.black,
            ),
          );
         }
          else  if (state is GetallvisitsLoaded) {

              if (state.visits['data'].length!=0) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: state.visits['data'].length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(evaluate(
                                    id: state.visits['data'][index]['id'],
                                    doctorname: state.visits['data'][index]
                                        ['doctor']['name'],
                                    date: state.visits['data'][index]['date']));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20)),
                                child: ListTile(
                                  title: Text(
                                    " ${index + 1}. ${state.visits['data'][index]['type']}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12),
                                          state.visits['data'][index]['doctor']
                                              ['name']),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else
                return Text('empty');
            } else
              return SizedBox();
          },
        ));
  }
}

class evaluate extends StatelessWidget {
  final id;
  final doctorname;
  final date;
  const evaluate(
      {super.key,
      required this.id,
      required this.doctorname,
      required this.date});

  @override
  Widget build(BuildContext context) {
    final sliderCubit1 = SliderValueCubit();

    final sliderCubit2 = SliderValueCubit();

    final sliderCubit3 = SliderValueCubit();

    final sliderCubit4 = SliderValueCubit();
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
          padding: EdgeInsets.only(left: 100, right: 100),
          child: Text(
            context.watch<Selection>().state == 1 ? 'تقييم' : 'Evaluate',
            // style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
          child: Container(
            padding: EdgeInsets.all(20),
            height: 570,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(36, 67, 133, 0.877),
                  Color.fromRGBO(64, 124, 255, 0.108)
                ])),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              context.watch<Selection>().state == 1
                                  ? 'تاريخ المراجعة'
                                  : 'Preview history',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                            '${date}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Image.asset('images/Group 1173.png'),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              context.watch<Selection>().state == 1
                                  ? 'تقييم'
                                  : 'Evaluate',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              context.watch<Selection>().state == 1
                                  ? 'الأقسام المعدلة'
                                  : 'Edited Sections',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              ' Sections',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 12,
                              width: 12,
                              child: Image.asset(
                                'images/Vector (26).png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              context.watch<Selection>().state == 1
                                  ? 'د.$doctorname'
                                  : 'Dr.$doctorname',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                GradientSliderBar(
                  cubit: sliderCubit2,
                  text: context.watch<Selection>().state == 1
                      ? 'العلاج النهائي'
                      : 'Treatment final',
                ),
                GradientSliderBar(
                  cubit: sliderCubit3,
                  text: context.watch<Selection>().state == 1
                      ? 'المعاملة'
                      : 'Handling',
                ),
                GradientSliderBar(
                  cubit: sliderCubit4,
                  text: context.watch<Selection>().state == 1
                      ? 'الخدمات'
                      : 'Services',
                ),
                Divider(),
                BlocBuilder<SliderValueCubit, double>(
                    bloc: sliderCubit2,
                    builder: (context, val2) {
                      return BlocBuilder<SliderValueCubit, double>(
                          bloc: sliderCubit3,
                          builder: (context, val3) {
                            return BlocBuilder<SliderValueCubit, double>(
                                bloc: sliderCubit4,
                                builder: (context, val4) {
                                  var per =
                                      (val2) * 0.6 + val3 * 0.25 + val4 * 0.15;
                                  var per1 = per / 100;
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          context.watch<Selection>().state == 1
                                              ? 'التقييم النهائي'
                                              : 'Final Evaluate',
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(37, 125, 248, 1),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 32,
                                        width: double.infinity,
                                        child: Stack(
                                          alignment: Alignment.bottomLeft,
                                          children: [
                                            Positioned(
                                              left: 310 * (per1),
                                              bottom: 12,
                                              child: Container(
                                                height: 20,
                                                width: 30,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text('${per.toInt()}',
                                                        style: TextStyle(
                                                            fontSize: 8,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 1,
                                              left: 310 * (per1),
                                              child: Icon(
                                                  Icons.arrow_drop_down_rounded,
                                                  color: Colors.blue,
                                                  size: 30),
                                            ),
                                            Positioned(
                                              left: 12,
                                              child: Container(
                                                height: 6,
                                                width: 310,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                              ),
                                            ),
                                            Positioned(
                                              left: 12,
                                              child: Container(
                                                height: 6,
                                                width: 310 * per1,
                                                child: Container(
                                                  height: 6,
                                                  width: 310,
                                                  decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color.fromRGBO(
                                                              175, 11, 11, 1),
                                                          Color.fromRGBO(
                                                              255, 159, 26, 1),
                                                          Color.fromRGBO(
                                                              16, 175, 11, 1),
                                                        ],
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Image.asset(
                                              'images/🦆 emoji _angry face_.png',
                                              filterQuality: FilterQuality.high,
                                            ),
                                            Image.asset(
                                              'images/🦆 emoji _white frowning face_.png',
                                              filterQuality: FilterQuality.high,
                                            ),
                                            Image.asset(
                                              'images/image 1778.png',
                                              filterQuality: FilterQuality.high,
                                            ),
                                            Image.asset('images/image 27.png'),
                                            Image.asset('images/image 30.png'),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      BlocBuilder<PostEvaluate, bool>(
                                        builder: (context, state) {
                                          return ElevatedButton(
                                              onPressed: () async {
                                                var treatment_final =
                                                    sliderCubit2.state;
                                                var handling =
                                                    sliderCubit3.state;
                                                var services =
                                                    sliderCubit2.state;
                                                print(treatment_final);

                                                print(handling);
                                                print(services);
                                                print(per);

                                                bool issecc = await context
                                                    .read<PostEvaluate>()
                                                    .post(
                                                        id,
                                                        treatment_final.toInt(),
                                                        handling.toInt(),
                                                        services.toInt(),
                                                        per.toInt());

                                                if (issecc) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    content: Text('success'),
                                                  ));

                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    content: Text('error'),
                                                    backgroundColor: Colors.red,
                                                    duration:
                                                        Duration(seconds: 2),
                                                  ));
                                                }
                                              },
                                              child: state? Center(child: CircularProgressIndicator(),): Center(
                                                child: Text(
                                                  style:TextStyle(color: Colors.white) ,
                                                  context
                                                              .watch<Selection>()
                                                              .state ==
                                                          1
                                                      ? 'ارسل تقييمك'
                                                      : 'send your evaluate',
                                                ),
                                              ));
                                        },
                                      )
                                    ],
                                  );
                                });
                          });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GradientSliderBar extends StatelessWidget {
  final String text;
  final SliderValueCubit cubit;

  const GradientSliderBar({super.key, required this.text, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderValueCubit, double>(
      bloc: cubit,
      builder: (context, value) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // العنوان والنسبة
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '${value.toInt()} %',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // الشريط والسلايدر
              Container(
                height: 10,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // خلفية الألوان
                    _buildGradientBar(),
                    // السلايدر
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 6,
                        inactiveTrackColor: Colors.white,
                        activeTrackColor: Colors.transparent,
                        thumbColor: Colors.blue,
                      ),
                      child: FractionallySizedBox(
                        widthFactor: 1.14,
                        child: Slider(
                          min: 0,
                          max: 100,
                          value: value,
                          onChanged: cubit.updateValue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              _buildMarksRow(),
            ],
          ),
        );
      },
    );
  }

  // طريقة لبناء الشريط المتدرج اللوني
  Widget _buildGradientBar() {
    return Container(
      height: 6,
      child: Row(
        children: [
          _buildBarSegment(0.2, const Color(0xFFAF0B0B), left: true),
          _buildSeparator(),
          _buildBarSegment(0.2, const Color(0xFFDB7C00)),
          _buildSeparator(),
          _buildBarSegment(0.2, const Color(0xFFDB7C00)),
          _buildSeparator(),
          _buildBarSegment(0.2, const Color(0xFFAFAD0B)),
          _buildSeparator(),
          _buildBarSegment(0.2, const Color(0xFF10AF0B), right: true),
        ],
      ),
    );
  }

  Widget _buildBarSegment(double fraction, Color color,
      {bool left = false, bool right = false}) {
    return Expanded(
      flex: (fraction * 100).toInt(),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.horizontal(
            left: left ? const Radius.circular(6) : Radius.zero,
            right: right ? const Radius.circular(6) : Radius.zero,
          ),
        ),
      ),
    );
  }

  Widget _buildSeparator() {
    return Container(width: 1, height: 6, color: Colors.white);
  }

  Widget _buildMarksRow() {
    final marks = ['0%', '20%', '40%', '60%', '80%', '100%'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: marks.map((label) {
        return Column(
          children: [
            Container(height: 10, width: 1, color: Colors.white),
            Text(label, style: const TextStyle(fontSize: 8)),
          ],
        );
      }).toList(),
    );
  }
}
