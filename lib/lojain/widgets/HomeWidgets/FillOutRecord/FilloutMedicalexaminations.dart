import 'dart:io';

import 'package:MediLink/lojain/models/record/FillOutRecord/postMedicalexaminations.dart';
import 'package:MediLink/lojain/models/record/FillOutRecord/postmedicine.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controllers/onboarding/SelectionLang.dart';
import '../../../Controllers/onboarding/SelectionTheme.dart';

class FilloutMedicalexaminations extends StatefulWidget {
  FilloutMedicalexaminations({Key? key}) : super(key: key);

  @override
  State<FilloutMedicalexaminations> createState() => _FilloutMedicalexaminationsState();
}

class _FilloutMedicalexaminationsState extends State<FilloutMedicalexaminations> {
  TextEditingController name = TextEditingController();

  TextEditingController test_date = TextEditingController();

  TextEditingController test_laboratory = TextEditingController();

  String? path;
  Future<void> getPDF_Image() async {
    final XFile? file = await openFile();
    if (file != null) {
      print(file.path);
      print(file.path.endsWith('.pdf'));
      print(File(file.path).path);
      setState(() {
        path = file.path;
      });
    } else {
      print('dont choose any file');
    }
  }

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
            context.watch<Selection>().state == 1 ? 'التحاليل الطبية' :    'Medical Examinations',
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
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color:  context.read<SelectionTheme>().state == 4? Colors.white24 : Color.fromRGBO(0, 0, 0, 1)
                                        ),
                                        height: 52,
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Expanded(
                                          child: Theme(
                                            data: Theme.of(context).copyWith(
                                                textSelectionTheme:
                                                    const TextSelectionThemeData(
                                                        selectionColor:
                                                            Colors.white,
                                                        selectionHandleColor:
                                                            Colors.white,
                                                        cursorColor:
                                                            Colors.white)),
                                            child: TextFormField(
                                              cursorColor: Colors.white,
                                              decoration:  InputDecoration(
                                                fillColor: Colors.white,
                                                labelText: context.watch<Selection>().state == 1 ? 'ادخل اسم التحليل' :'Enter Test name',
                                                labelStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                border: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                              ),
                                              controller: name,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
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
                                                  color: context.read<SelectionTheme>().state == 4? Colors.white24 : Color.fromRGBO(0, 0, 0, 1)
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
                                                         context.watch<Selection>().state == 1 ? 'ادخل اسم المختبر' :   'enter test laboratory',
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
                                                      controller:
                                                          test_laboratory,
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
                                                  color: context.read<SelectionTheme>().state == 4? Colors.white24 : Color.fromRGBO(0, 0, 0, 1)
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
                                                        context.watch<Selection>().state == 1 ? 'تاريخ التحليل yyyy-mm-dd' :    'test date yy-mm-dd',
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
                                                      controller: test_date,
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

                                      Container(
                                        padding: EdgeInsets.all(10),
                                        height: 225,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color:  context.read<SelectionTheme>().state == 4? Colors.white24 : Color.fromRGBO(0, 0, 0, 1)
                                        ),
                                        child: Row(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                 context.watch<Selection>().state == 1 ? 'اضف صورة او pdf للتحليل' : 'add image or pdf to test  ',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            WidgetStatePropertyAll(
                                                                Color.fromRGBO(
                                                                    19,
                                                                    57,
                                                                    111,
                                                                    1))),
                                                    onPressed: () {
                                                      getPDF_Image();
                                                    },
                                                    child: Text(
                                                    context.watch<Selection>().state == 1 ? 'اضف' :  'add',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                              ],
                                            ),
                                            if (path != null)
                                              path!.endsWith('.pdf')
                                                  ? Text(path!)
                                                  : Container(
                                                    width: 160,
                                                    height: 225,
                                                    child: Stack(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        children: [
                                                          Container(
                                                            height: 215,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                color: Color
                                                                    .fromRGBO(
                                                                        35,
                                                                        107,
                                                                        209,
                                                                        1)),
                                                          ),
                                                          ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              child: Image.file(
                                                                File(path!),
                                                                width: 190,
                                                                fit: BoxFit.fill,
                                                              )),
                                                        ],
                                                      ),
                                                  )
                                          ],
                                        ),
                                      ),

                                        BlocBuilder<postMedicalexaminations, bool>(
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
                                                  .read<postMedicalexaminations>()
                                                .post(test_name: name.text, test_laboratory: test_laboratory.text, test_date: test_date.text, test_image_pdf: path);

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
                                                   context.watch<Selection>().state == 1 ? 'حفظ' : 'save',
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
