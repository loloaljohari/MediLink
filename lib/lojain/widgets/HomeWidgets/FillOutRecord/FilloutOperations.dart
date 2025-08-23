import 'package:MediLink/lojain/models/record/FillOutRecord/postOperations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controllers/onboarding/SelectionLang.dart';
import '../../../Controllers/onboarding/SelectionTheme.dart';

class FilloutOperations extends StatelessWidget {
  FilloutOperations({Key? key}) : super(key: key);
  TextEditingController name = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController doctor = TextEditingController();
  TextEditingController hospital = TextEditingController(); 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
               context.watch<Selection>().state == 1 ? 'العمليات الجراحية' : 'surgical Operation',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      sheetAnimationStyle: AnimationStyle(
                          reverseCurve: Curves.easeIn,
                          reverseDuration: Duration(seconds: 1),
                          curve: Curves.easeIn,
                          duration: Duration(seconds: 1)),
                      isScrollControlled: true,
                      backgroundColor:   context.read<SelectionTheme>().state == 4 ?Color.fromRGBO(   38, 115, 221, 1): Color.fromRGBO(19, 57, 111, 1),
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height / 2.3,
                              child: Column(
                                children: [
                                  Center(
                                    child: Container(
                                      height: 5,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                  ),
                                  Expanded(
                                      child: ListView(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  color:  context.read<SelectionTheme>().state == 4? Colors.white24 : Color.fromRGBO(0, 0, 0, 1)
                                                ),
                                                height: 52,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.3,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Expanded(
                                                  child: Theme(
                                                    data: Theme.of(context).copyWith(
                                                        textSelectionTheme:
                                                            const TextSelectionThemeData(
                                                                selectionColor:
                                                                    Colors
                                                                        .white,
                                                                selectionHandleColor:
                                                                    Colors
                                                                        .white,
                                                                cursorColor:
                                                                    Colors
                                                                        .white)),
                                                    child: TextFormField(
                                                      cursorColor: Colors.white,
                                                      decoration:
                                                           InputDecoration(
                                                        fillColor: Colors.white,
                                                        labelText:
                                                           context.watch<Selection>().state == 1 ? 'ادخل اسم العملية' : 'enter name the Operation',
                                                        labelStyle: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                        border:
                                                            InputBorder.none,
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        disabledBorder:
                                                            InputBorder.none,
                                                      ),
                                                      controller: name,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  color:  context.read<SelectionTheme>().state == 4? Colors.white24 : Color.fromRGBO(0, 0, 0, 1)
                                                ),
                                                height: 52,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.3,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Expanded(
                                                  child: Theme(
                                                    data: Theme.of(context).copyWith(
                                                        textSelectionTheme:
                                                            const TextSelectionThemeData(
                                                                selectionColor:
                                                                    Colors
                                                                        .white,
                                                                selectionHandleColor:
                                                                    Colors
                                                                        .white,
                                                                cursorColor:
                                                                    Colors
                                                                        .white)),
                                                    child: TextFormField(
                                                      cursorColor: Colors.white,
                                                      decoration:
                                                           InputDecoration(
                                                        fillColor: Colors.white,
                                                        labelText:
                                                        context.watch<Selection>().state == 1 ? 'اسم الطبيب' :    'name the doctor',
                                                        labelStyle: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                        border:
                                                            InputBorder.none,
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        disabledBorder:
                                                            InputBorder.none,
                                                      ),
                                                      controller: doctor,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  color:  context.read<SelectionTheme>().state == 4? Colors.white24 : Color.fromRGBO(0, 0, 0, 1)
                                                ),
                                                height: 52,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.3,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Expanded(
                                                  child: Theme(
                                                    data: Theme.of(context).copyWith(
                                                        textSelectionTheme:
                                                            const TextSelectionThemeData(
                                                                selectionColor:
                                                                    Colors
                                                                        .white,
                                                                selectionHandleColor:
                                                                    Colors
                                                                        .white,
                                                                cursorColor:
                                                                    Colors
                                                                        .white)),
                                                    child: TextFormField(
                                                      cursorColor: Colors.white,
                                                      decoration:
                                                           InputDecoration(
                                                        fillColor: Colors.white,
                                                        labelText:
                                                       context.watch<Selection>().state == 1 ? 'ادخل اسم المشفى' :     'enter name the hospital',
                                                        labelStyle: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                        border:
                                                            InputBorder.none,
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        disabledBorder:
                                                            InputBorder.none,
                                                      ),
                                                      controller: hospital,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  color:  context.read<SelectionTheme>().state == 4? Colors.white24 : Color.fromRGBO(0, 0, 0, 1)
                                                ),
                                                height: 52,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.3,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Expanded(
                                                  child: Theme(
                                                    data: Theme.of(context).copyWith(
                                                        textSelectionTheme:
                                                            const TextSelectionThemeData(
                                                                selectionColor:
                                                                    Colors
                                                                        .white,
                                                                selectionHandleColor:
                                                                    Colors
                                                                        .white,
                                                                cursorColor:
                                                                    Colors
                                                                        .white)),
                                                    child: TextFormField(
                                                      cursorColor: Colors.white,
                                                      decoration:
                                                           InputDecoration(
                                                        fillColor: Colors.white,
                                                        labelText:
                                                         context.watch<Selection>().state == 1 ? 'تاريخ العملية yyyy-mm-dd' :   ' opiration date yy-mm-dd',
                                                        labelStyle: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                        border:
                                                            InputBorder.none,
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        disabledBorder:
                                                            InputBorder.none,
                                                      ),
                                                      controller: date,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      BlocBuilder<PostOperations, bool>(
                                          builder: (context, state) {
                                        return ElevatedButton(
                                            style: ButtonStyle(
                                                fixedSize:
                                                    WidgetStatePropertyAll(Size(
                                                        double.infinity, 54)),
                                                shape: WidgetStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20))),
                                                backgroundColor:
                                                    WidgetStatePropertyAll(
                                                          context.read<SelectionTheme>().state == 4? Colors.white24 : Color.fromRGBO(15, 102, 222, 1))),
                                            onPressed: () async {
                                              print('================');
                                              var isSuccess = await context
                                                  .read<PostOperations>()
                                                  .post(
                                                      op_name: name.text,
                                                      op_hospital_name:
                                                          hospital.text,
                                                      op_doctor_name:
                                                          doctor.text,
                                                      op_date: date.text);

                                              if (isSuccess) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text('success'),
                                                  backgroundColor: Colors.green,
                                                  duration:
                                                      Duration(seconds: 2),
                                                ));
                                                Navigator.of(context).pop();
                                              } else {
                                                // ignore: use_build_context_synchronously
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text('error'),
                                                  backgroundColor: Colors.red,
                                                  duration:
                                                      Duration(seconds: 2),
                                                ));
                                                Navigator.of(context).pop();
                                              }
                                            },
                                            child: state
                                                ? CircularProgressIndicator(
                                                    color: Colors.white,
                                                  )
                                                : Text(
                                                 context.watch<Selection>().state == 1 ? 'حفظ' :   'save',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ));
                                      })
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                  context.watch<Selection>().state == 1 ? 'اضف+' :  'Add+',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(64, 123, 255, 1),
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor: Color.fromRGBO(64, 123, 255, 1)),
                  ))
            ],
          ),
          // BlocBuilder<GetSensitivityCubit, GetSensitivityState>(
          //     builder: (context, state) {
          //   if (state is GetSensitivityLoaded)
          //     return SingleChildScrollView(
          //       scrollDirection: Axis.horizontal,
          //       child: Expanded(
          //         child: Container(
          //           child: Row(
          //             children: [
          //               Wrap(
          //                 children: List.generate(
          //                   state.Sensitivity['data']['strong'].length,
          //                   (index) {
          //                     return Row(
          //                       children: [
          //                         SensitivityWidget(
          //                           senstype: state.Sensitivity['data']
          //                               ['strong'][index]['aller_name'],
          //                           type: state.Sensitivity['data']['strong']
          //                               [index]['aller_type'],
          //                           reason: state.Sensitivity['data']['strong']
          //                               [index]['aller_cause'],
          //                           treatment: state.Sensitivity['data']
          //                               ['strong'][index]['aller_treatment'],
          //                           pervention: state.Sensitivity['data']
          //                               ['strong'][index]['aller_pervention'],
          //                           reasons: state.Sensitivity['data']['strong']
          //                               [index]['aller_reasons'],
          //                           width: 300,
          //                         ),
          //                         SizedBox(
          //                           width: 10,
          //                         )
          //                       ],
          //                     );
          //                   },
          //                 ).toList(),
          //               ),
          //               SizedBox(
          //                 width: 10,
          //               ),
          //               Wrap(
          //                 children: List.generate(
          //                   state.Sensitivity['data']['medium'].length,
          //                   (index) {
          //                     return Row(
          //                       children: [
          //                         SensitivityWidget(
          //                           senstype: state.Sensitivity['data']
          //                               ['medium'][index]['aller_name'],
          //                           type: state.Sensitivity['data']['medium']
          //                               [index]['aller_type'],
          //                           reason: state.Sensitivity['data']['medium']
          //                               [index]['aller_cause'],
          //                           treatment: state.Sensitivity['data']
          //                               ['medium'][index]['aller_treatment'],
          //                           pervention: state.Sensitivity['data']
          //                               ['medium'][index]['aller_pervention'],
          //                           reasons: state.Sensitivity['data']['medium']
          //                               [index]['aller_reasons'],
          //                           width: 300,
          //                         ),
          //                         SizedBox(
          //                           width: 10,
          //                         )
          //                       ],
          //                     );
          //                   },
          //                 ).toList(),
          //               ),
          //               SizedBox(
          //                 width: 10,
          //               ),
          //               Wrap(
          //                 children: List.generate(
          //                   state.Sensitivity['data']['weak'].length,
          //                   (index) {
          //                     return Row(
          //                       children: [
          //                         SensitivityWidget(
          //                           width: 300,
          //                           senstype: state.Sensitivity['data']['weak']
          //                               [index]['aller_name'],
          //                           type: state.Sensitivity['data']['weak']
          //                               [index]['aller_type'],
          //                           reason: state.Sensitivity['data']['weak']
          //                               [index]['aller_cause'],
          //                           treatment: state.Sensitivity['data']['weak']
          //                               [index]['aller_treatment'],
          //                           pervention: state.Sensitivity['data']
          //                               ['weak'][index]['aller_pervention'],
          //                           reasons: state.Sensitivity['data']['weak']
          //                               [index]['aller_reasons'],
          //                         ),
          //                         SizedBox(
          //                           width: 10,
          //                         )
          //                       ],
          //                     );
          //                   },
          //                 ).toList(),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     );
          //   return SizedBox();
          // }),
        ],
      ),
    );
  }
}
