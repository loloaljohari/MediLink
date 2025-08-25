import 'package:MediLink/ammar/lib/view/screen/aouth/sinup.dart';
import 'package:MediLink/lojain/models/record/Getpatientrecord/Sensitivitymodel.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Record/SensitivityWidget.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Record/enumeration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../Controllers/onboarding/SelectionLang.dart';

class Sensitivity extends StatelessWidget {
  Sensitivity({Key? key}) : super(key: key);
  List list = [
    {
      'senstype': 'Spring eyelash',
      'type': 'semester',
      'reason': 'Spring',
      'treatment': 'Eye drops'
    },
    {
      'senstype': 'allergy',
      'type': 'Animals',
      'reason': 'Cat',
      'treatment': 'Moisturizer'
    },
  ];

  @override
  Widget build(BuildContext context) {
    context.read<GetSensitivityCubit>().fetch();
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
        title:  Padding(
          padding: EdgeInsets.only(left: 70,right: 70),
          child: Text(
             context.watch<Selection>().state==1?'الحساسية':   'Sensitivity',
            style: TextStyle(),
          ),
        ),
      ),
      body: BlocBuilder<GetSensitivityCubit, GetSensitivityState>(
          builder: (context, state) {
        if (state is GetSensitivityLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetSensitivityLoaded) {
          if (state.Sensitivity.containsKey('data')) {
            if (state.Sensitivity['data'].isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Image.asset('images/Group 1034.png'),
                        const SizedBox(
                          width: 10,
                        ),
                         Text(
                          context.watch<Selection>().state==1?'الحساسية القوية':    'Strong Sensitivity',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    state.Sensitivity['data']['strong'] != []
                        ? Column(
                            children: List.generate(
                              state.Sensitivity['data']['strong'].length,
                              (index) {
                                return SensitivityWidget(
                                  width: double.infinity,
                                  senstype: state.Sensitivity['data']['strong']
                                      [index]['aller_name'],
                                  type: state.Sensitivity['data']['strong']
                                      [index]['aller_type'],
                                  reason: state.Sensitivity['data']['strong']
                                      [index]['aller_cause'],
                                  treatment: state.Sensitivity['data']['strong']
                                      [index]['aller_treatment'],
                                  pervention: state.Sensitivity['data']
                                      ['strong'][index]['aller_pervention'],
                                  reasons: state.Sensitivity['data']['strong']
                                      [index]['aller_reasons'],
                                );
                              },
                            ).toList(),
                          )
                        : Center(child: Text('no thing')),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Image.asset('images/Group 1034 (1).png'),
                        const SizedBox(
                          width: 10,
                        ),
                         Text(
                        context.watch<Selection>().state==1?'الحساسية المعتدلة':   'Medium Sensitivity',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    state.Sensitivity['data']['medium'] != []
                        ? Column(
                            children: List.generate(
                              state.Sensitivity['data']['medium'].length,
                              (index) {
                                return SensitivityWidget(
                                  width: double.infinity,
                                  senstype: state.Sensitivity['data']['medium']
                                      [index]['aller_name'],
                                  type: state.Sensitivity['data']['medium']
                                      [index]['aller_type'],
                                  reason: state.Sensitivity['data']['medium']
                                      [index]['aller_cause'],
                                  treatment: state.Sensitivity['data']['medium']
                                      [index]['aller_treatment'],
                                  pervention: state.Sensitivity['data']
                                      ['medium'][index]['aller_pervention'],
                                  reasons: state.Sensitivity['data']['medium']
                                      [index]['aller_reasons'],
                                );
                              },
                            ).toList(),
                          )
                        : Center(child: Text('no thing')),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Image.asset('images/Group 1034 (1).png'),
                        const SizedBox(
                          width: 10,
                        ),
                         Text(
                        context.watch<Selection>().state==1?'الحساسية الخفيفة':   'Weak Sensitivity',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    state.Sensitivity['data']['weak'] != []
                        ? Column(
                            children: List.generate(
                              state.Sensitivity['data']['weak'].length,
                              (index) {
                                return SensitivityWidget(
                                  width: double.infinity,
                                  senstype: state.Sensitivity['data']['weak']
                                      [index]['aller_name'],
                                  type: state.Sensitivity['data']['weak'][index]
                                      ['aller_type'],
                                  reason: state.Sensitivity['data']['weak']
                                      [index]['aller_cause'],
                                  treatment: state.Sensitivity['data']['weak']
                                      [index]['aller_treatment'],
                                  pervention: state.Sensitivity['data']['weak']
                                      [index]['aller_pervention'],
                                  reasons: state.Sensitivity['data']['weak']
                                      [index]['aller_reasons'],
                                );
                              },
                            ).toList(),
                          )
                        : Center(
                            child: Text(
                          context.watch<Selection>().state==1?'لا شيء':   'no thing',
                            style: TextStyle(),
                          )),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            } else
              return Text( context.watch<Selection>().state==1?'فارغ':  'empty');
          } else
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
                       context.watch<Selection>().state == 1
                            ? 'للاطلاع على سجلك الطبي، يجب أن يكون لديك حساب على التطبيق. سجل في تطبيقنا للوصول إلى خدماتنا.'
                            : '${state.Sensitivity['message']}: To view your medical record, you must have an account on the app. Sign up for our app to access our services.'),
                  ElevatedButton(
                        style: ButtonStyle(
                            fixedSize: WidgetStatePropertyAll(Size(120, 20)),
                            backgroundColor: WidgetStatePropertyAll(
                                Color.fromRGBO(38, 115, 221, 1))),
                        onPressed: () {
                          Get.to(Sinup(
                            
                          ));
                        },
                        child:  Text(
                         context.watch<Selection>().state==1?'اشتراك':  'Register',
                          style: TextStyle(color: Colors.white),
                        )),
                                  ],
                                ),
                  ),
                ));
       ;
        } else if (state is GetSensitivityError) {
          return Text(state.messageError.toString());
        } else
          return SizedBox();
      }),
    );
  }
}
