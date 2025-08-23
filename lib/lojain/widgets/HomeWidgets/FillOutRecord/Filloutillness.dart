import 'dart:math';

import 'package:MediLink/lojain/Controllers/record/dropgeneral.dart';
import 'package:MediLink/lojain/models/record/FillOutRecord/postillness.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controllers/onboarding/SelectionLang.dart';
import '../../../Controllers/onboarding/SelectionTheme.dart';

class Filloutillness extends StatelessWidget {
  Filloutillness({Key? key}) : super(key: key);
  final type = DropgeneralCubit();
  TextEditingController name = TextEditingController();
  TextEditingController doctor = TextEditingController();
  TextEditingController advice = TextEditingController();
  TextEditingController prohibitions = TextEditingController();
  TextEditingController day = TextEditingController();
  TextEditingController month = TextEditingController();
  TextEditingController year = TextEditingController();
  var list = [
    'current',
    'chronic',
  ];
  var init = 'chronic';
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
              context.watch<Selection>().state == 1 ? 'الامراض' :  'Illness',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                            sheetAnimationStyle: AnimationStyle( reverseCurve:Curves.easeIn,reverseDuration: Duration(seconds: 1) , curve: Curves.easeIn,duration: Duration(seconds: 2)),
                        isScrollControlled: true,
                      backgroundColor:  context.read<SelectionTheme>().state == 4 ?Color.fromRGBO(   38, 115, 221, 1): Color.fromRGBO(19, 57, 111, 1),
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                                Expanded(
                                    child: ListView(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          color:   context.read<SelectionTheme>().state == 4? Colors.white24 : Color.fromRGBO(15, 102, 222, 1)
                                        ),
                                        height: 52,
                                        width: MediaQuery.of(context).size.width,
                                        child: Expanded(
                                            child: BlocBuilder<DropgeneralCubit,
                                                    DropgeneralState>(
                                                bloc: type,
                                                builder: (context, state) {
                                                  if (state.selectedValue !=
                                                          null &&
                                                      list.contains(
                                                          state.selectedValue)) {
                                                    init = state.selectedValue!;
                                                  }
                                                  type.loadSelectedValue(init);
                                                  return CustomDropdown<String>(
                                                    hideSelectedFieldWhenExpanded:
                                                        true,
                                                    decoration:
                                                        CustomDropdownDecoration(
                                                      hintStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 16),
                                                      closedFillColor:
                                                          Colors.transparent,
                                                      expandedFillColor: Theme.of(
                                                              context)
                                                          .scaffoldBackgroundColor,
                                                      headerStyle:
                                                          const TextStyle(
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                              fontSize: 16),
                                                      listItemStyle:
                                                          const TextStyle(
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                              fontSize: 16),
                                                      closedSuffixIcon:
                                                          Transform.rotate(
                                                              angle: -90 *
                                                                  (pi / 180),
                                                              child: const Icon(
                                                                Icons
                                                                    .arrow_back_ios_new,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        38,
                                                                        115,
                                                                        221,
                                                                        1),
                                                                size: 15,
                                                              )),
                                                    ),
                                                    closedHeaderPadding:
                                                        const EdgeInsets.all(9),
                                                    disabledDecoration:
                                                        const CustomDropdownDisabledDecoration(
                                                            fillColor: Colors
                                                                .transparent),
                                                    items: list,
                                                    hintText:context.watch<Selection>().state == 1 ? 'الحالة' : 'State',
                                                    onChanged: (value) {
                                                      print(type
                                                          .state.selectedValue);
                                                      type.setSelectedValue(
                                                          value!);
                                                    },
                                                  );
                                                }))),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color:   context.read<SelectionTheme>().state == 4? Colors.white24 : Color.fromRGBO(15, 102, 222, 1)
                                          ),
                                          height: 52,
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  2.3,
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
                                                  hintText: context.watch<Selection>().state == 1 ? 'ادخل اسم المرض' : 'Enter Name illness',
                                                  hintStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
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
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color:   context.read<SelectionTheme>().state == 4? Colors.white24 : Color.fromRGBO(15, 102, 222, 1)
                                          ),
                                          height: 52,
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  2.3,
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
                                                  hintText: context.watch<Selection>().state == 1 ? 'ادخل اسم الطبيب' : 'Enter Name Doctor',
                                                  hintStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  border: InputBorder.none,
                                                  enabledBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                ),
                                                controller: doctor,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ),
                                          ),
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
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color:   context.read<SelectionTheme>().state == 4? Colors.white24 : Color.fromRGBO(15, 102, 222, 1)
                                          ),
                                          height: 52,
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  2.3,
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
                                                  hintText:context.watch<Selection>().state == 1 ? 'النصائح' : 'Advices',
                                                  hintStyle: TextStyle(
                                                      color: Color.fromRGBO(15, 153, 10, 1),
                                                      
                                                      fontSize: 14,
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  border: InputBorder.none,
                                                  enabledBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                ),
                                                controller: advice,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color:   context.read<SelectionTheme>().state == 4? Colors.white24 : Color.fromRGBO(15, 102, 222, 1)
                                          ),
                                          height: 52,
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  2.3,
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
                                                  hintText: context.watch<Selection>().state == 1 ? 'محظورات' :'prohibitions',
                                                  hintStyle: TextStyle(
                                                      color: Color.fromRGBO(
                                                          175, 11, 11, 1),
                                                      fontSize: 14,
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  border: InputBorder.none,
                                                  enabledBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                ),
                                                controller: prohibitions,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(context.watch<Selection>().state == 1 ? 'التاريخ' : ' date'),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color:   context.read<SelectionTheme>().state == 4? Colors.white24 : Color.fromRGBO(15, 102, 222, 1)
                                          ),
                                          height: 52,
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  4,
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
                                                decoration: const InputDecoration(
                                                  fillColor: Colors.white,
                                                  hintText: 'dd',
                                                  hintStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  border: InputBorder.none,
                                                  enabledBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                ),
                                                controller: day,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color:   context.read<SelectionTheme>().state == 4? Colors.white24 : Color.fromRGBO(15, 102, 222, 1)
                                          ),
                                          height: 52,
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  4,
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
                                                decoration: const InputDecoration(
                                                  fillColor: Colors.white,
                                                  hintText: 'mm',
                                                  hintStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  border: InputBorder.none,
                                                  enabledBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                ),
                                                controller: month,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color:   context.read<SelectionTheme>().state == 4? Colors.white24 : Color.fromRGBO(15, 102, 222, 1)
                                          ),
                                          height: 52,
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  4,
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
                                                decoration: const InputDecoration(
                                                  fillColor: Colors.white,
                                                  hintText: 'yy',
                                                  hintStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  border: InputBorder.none,
                                                  enabledBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                ),
                                                controller: year,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    BlocBuilder<Postillness, bool>(
                                        builder: (context, state) {
                                      return ElevatedButton(
                                          style: ButtonStyle(
                                              fixedSize: WidgetStatePropertyAll(
                                                  Size(double.infinity, 54)),
                                              shape: WidgetStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(20))),
                                              backgroundColor:
                                                  WidgetStatePropertyAll(
                                                     context.read<SelectionTheme>().state == 4? Colors.white24 : Color.fromRGBO(15, 102, 222, 1))),
                                          onPressed: () async {
                                            print('================');
                                            var isSuccess = await context
                                                .read<Postillness>()
                                                .post(
                                                    d_type:
                                                        type.state.selectedValue,
                                                    d_name: name.text,
                                                    d_diagnosis_date:
                                                        '${year.text}-${month.text}-${day.text}',
                                                    d_doctor: doctor.text,
                                                    d_advice: advice.text,
                                                    d_prohibition:
                                                        prohibitions.text);
                          
                                            if (isSuccess) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text('success'),
                                                backgroundColor: Colors.green,
                                                duration: Duration(seconds: 2),
                                              ));
                                              Navigator.of(context).pop();
                          
                                            } else {
                                              // ignore: use_build_context_synchronously
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text('error'),
                                                backgroundColor: Colors.red,
                                                duration: Duration(seconds: 2),
                                              ));
                                              
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
                        );
                      },
                    );
                  },
                  child: Text(
                   context.watch<Selection>().state == 1 ? 'اضف+' : 'Add+',
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
