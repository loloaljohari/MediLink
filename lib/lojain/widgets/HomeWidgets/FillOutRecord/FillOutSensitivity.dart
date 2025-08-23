import 'dart:math';

import 'package:MediLink/lojain/Controllers/onboarding/SelectionTheme.dart';
import 'package:MediLink/lojain/Controllers/record/dropgeneral.dart';
import 'package:MediLink/lojain/models/record/FillOutRecord/postsensitivity.dart';
import 'package:MediLink/lojain/models/record/Getpatientrecord/Sensitivitymodel.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Record/SensitivityWidget.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controllers/onboarding/SelectionLang.dart';

class FillOutSensitivity extends StatelessWidget {
  FillOutSensitivity({Key? key}) : super(key: key);

  TextEditingController name = TextEditingController();
  TextEditingController dueTo = TextEditingController();
  TextEditingController termmenet = TextEditingController();

  TextEditingController reasons = TextEditingController();

  TextEditingController prevention = TextEditingController();
  final power = DropgeneralCubit();
  final type = DropgeneralCubit();
  var list = [
    'strong',
    'medium',
    'weak',
  ];
  var init = 'strong';
  var list1 = [
    'animal',
    'pollen',
    'Food',
    'dust',
    'mold',
    'medicine',
    'seasons',
    'other',
  ];
  var init1 = 'animal';
  List data = [];

  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      sheetAnimationStyle: AnimationStyle( reverseCurve:Curves.easeIn,reverseDuration: Duration(seconds: 1) , curve: Curves.easeIn,duration: Duration(seconds: 2)),
      backgroundColor:  context.read<SelectionTheme>().state == 4 ?Color.fromRGBO(   38, 115, 221, 1): Color.fromRGBO(19, 57, 111, 1),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: MediaQuery.of(context).size.height / 2.3,
            padding: EdgeInsets.all(16),
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
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color:  context.read<SelectionTheme>().state == 4? Colors.white24 :Color.fromRGBO(34, 34, 34, 1),
                        ),
                        height: 52,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Expanded(
                          child: Theme(
                            data: Theme.of(context).copyWith(
                                textSelectionTheme:
                                    const TextSelectionThemeData(
                                        selectionColor: Colors.white,
                                        selectionHandleColor: Colors.white,
                                        cursorColor: Colors.white)),
                            child: TextFormField(
                              cursorColor: Colors.white,
                              decoration:  InputDecoration(
                                fillColor: Colors.white,
                                hintText:  context.watch<Selection>().state == 1 ? 'ادخل اسم الحساسية' :'Enter Name Sensitivity',
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
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
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                            color:   context.read<SelectionTheme>().state == 4? Colors.white24 :Color.fromRGBO(34, 34, 34, 1),
                              ),
                              height: 52,
                              width: MediaQuery.of(context).size.width / 2.3,
                              child: Expanded(
                                  child: BlocBuilder<DropgeneralCubit,
                                          DropgeneralState>(
                                      bloc: power,
                                      builder: (context, state) {
                                        if (state.selectedValue != null &&
                                            list.contains(
                                                state.selectedValue)) {
                                          init = state.selectedValue!;
                                        }
                                        power.loadSelectedValue(init);
                                        return CustomDropdown<String>(
                                          hideSelectedFieldWhenExpanded: true,
                                          decoration: CustomDropdownDecoration(
                                            hintStyle: TextStyle(
                                              color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16),
                                            closedFillColor: Colors.transparent,
                                            expandedFillColor: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            headerStyle: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16),
                                            listItemStyle: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16),
                                            closedSuffixIcon: Transform.rotate(
                                                angle: -90 * (pi / 180),
                                                child: const Icon(
                                                  Icons.arrow_back_ios_new,
                                                  color: Color.fromRGBO(
                                                      38, 115, 221, 1),
                                                  size: 15,
                                                )),
                                          ),
                                          closedHeaderPadding:
                                              const EdgeInsets.all(9),
                                          disabledDecoration:
                                              const CustomDropdownDisabledDecoration(
                                               
                                                  fillColor:
                                                      Colors.transparent),
                                          items: list,
                                          hintText:  context.watch<Selection>().state == 1 ? 'القوة' :'Severity',
                                          onChanged: (value) {
                                            print(power.state.selectedValue);
                                            power.setSelectedValue(value!);
                                          },
                                        );
                                      }))),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color:context.read<SelectionTheme>().state == 4? Colors.white24 :Color.fromRGBO(34, 34, 34, 1), 
                              ),
                              height: 52,
                              width: MediaQuery.of(context).size.width / 2.3,
                              child: Expanded(
                                  child: BlocBuilder<DropgeneralCubit,
                                          DropgeneralState>(
                                      bloc: type,
                                      builder: (context, state) {
                                        if (state.selectedValue != null &&
                                            list1.contains(
                                                state.selectedValue)) {
                                          init1 = state.selectedValue!;
                                        }
                                        type.loadSelectedValue(init1);
                                        return CustomDropdown<String>(
                                          hideSelectedFieldWhenExpanded: true,
                                          decoration: CustomDropdownDecoration(
                                            hintStyle: TextStyle(
                                              color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16),
                                            closedFillColor: Colors.transparent,
                                            expandedFillColor: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            headerStyle: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16),
                                            listItemStyle: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16),
                                            closedSuffixIcon: Transform.rotate(
                                                angle: -90 * (pi / 180),
                                                child: const Icon(
                                                  Icons.arrow_back_ios_new,
                                                  color: Color.fromRGBO(
                                                      38, 115, 221, 1),
                                                  size: 15,
                                                )),
                                          ),
                                          closedHeaderPadding:
                                              const EdgeInsets.all(9),
                                          disabledDecoration:
                                              const CustomDropdownDisabledDecoration(
                                                  fillColor:
                                                      Colors.transparent),
                                          items: list1,
                                          hintText:  context.watch<Selection>().state == 1 ? 'النوع' :'Type',
                                          onChanged: (value) {
                                            print(type.state.selectedValue);
                                            type.setSelectedValue(value!);
                                          },
                                        );
                                      }))),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: context.read<SelectionTheme>().state == 4? Colors.white24 :Color.fromRGBO(34, 34, 34, 1),
                            ),
                            height: 52,
                            width: MediaQuery.of(context).size.width / 2.3,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Expanded(
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                    textSelectionTheme:
                                        const TextSelectionThemeData(
                                            selectionColor: Colors.white,
                                            selectionHandleColor: Colors.white,
                                            cursorColor: Colors.white)),
                                child: TextFormField(
                                  cursorColor: Colors.white,
                                  decoration:  InputDecoration(
                                    fillColor: Colors.white,
                                    hintText:  context.watch<Selection>().state == 1 ? 'أدخل بسبب' :'Enter Due to',
                                    hintStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400),
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                  controller: dueTo,
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
                              borderRadius: BorderRadius.circular(16),
                              color: context.read<SelectionTheme>().state == 4? Colors.white24 :Color.fromRGBO(34, 34, 34, 1),
                            ),
                            height: 52,
                            width: MediaQuery.of(context).size.width / 2.3,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Expanded(
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                    textSelectionTheme:
                                        const TextSelectionThemeData(
                                            selectionColor: Colors.white,
                                            selectionHandleColor: Colors.white,
                                            cursorColor: Colors.white)),
                                child: TextFormField(
                                  cursorColor: Colors.white,
                                  decoration:  InputDecoration(
                                    fillColor: Colors.white,
                                    hintText:  context.watch<Selection>().state == 1 ? 'ادخل العلاج' : 'Enter Treatment',
                                    hintStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400),
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                  controller: termmenet,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: context.read<SelectionTheme>().state == 4? Colors.white24 :Color.fromRGBO(34, 34, 34, 1),
                            ),
                            height: 52,
                            width: MediaQuery.of(context).size.width / 2.3,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Expanded(
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                    textSelectionTheme:
                                        const TextSelectionThemeData(
                                            selectionColor: Colors.white,
                                            selectionHandleColor: Colors.white,
                                            cursorColor: Colors.white)),
                                child: TextFormField(
                                  cursorColor: const Color.fromRGBO(255, 255, 255, 1),
                                  decoration:  InputDecoration(
                                    fillColor: Colors.white,
                                    hintText:  context.watch<Selection>().state == 1 ? 'الاسباب' :'Reasons',
                                    hintStyle: TextStyle(
                                        color: Color.fromRGBO(137, 9, 9, 1),
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400),
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                  controller: reasons,
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
                              borderRadius: BorderRadius.circular(16),
                              color: context.read<SelectionTheme>().state == 4? Colors.white24 :Color.fromRGBO(34, 34, 34, 1),
                            ),
                            height: 52,
                            width: MediaQuery.of(context).size.width / 2.3,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Expanded(
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                    textSelectionTheme:
                                        const TextSelectionThemeData(
                                            selectionColor: Colors.white,
                                            selectionHandleColor: Colors.white,
                                            cursorColor: Colors.white)),
                                child: TextFormField(
                                  cursorColor: Colors.white,
                                  decoration:  InputDecoration(
                                    fillColor: Colors.white,
                                    hintText:  context.watch<Selection>().state == 1 ? 'الوقاية' :'Prevention',
                                    hintStyle: TextStyle(
                                        color: Color.fromRGBO(8, 93, 5, 1),
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400),
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                  controller: prevention,
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
                      BlocBuilder<Postsensitivity, bool>(
                          builder: (context, state) {
                        return ElevatedButton(
                            style: ButtonStyle(
                                fixedSize: WidgetStatePropertyAll(
                                    Size(double.infinity, 54)),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                backgroundColor: WidgetStatePropertyAll(
                                   context.read<SelectionTheme>().state == 4? Colors.white24 : Color.fromRGBO(15, 102, 222, 1))),
                            onPressed: () async {
                              print('================');
                              var isSuccess = await context
                                  .read<Postsensitivity>()
                                  .post(
                                      name: name.text,
                                      severity: power.state.selectedValue,
                                      type: type.state.selectedValue,
                                      dueTo: dueTo.text,
                                      termmenet: termmenet.text,
                                      reasons: reasons.text,
                                      prevention: prevention.text);

                              if (isSuccess) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text('success'),
                                  backgroundColor: Colors.green,
                                  duration: Duration(seconds: 2),
                                ));
                               context.read<GetSensitivityCubit>().fetch();
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
                               color:    context.read<SelectionTheme>().state == 4?  Color.fromRGBO(34, 34, 34, 1):Colors.white24,
                                  )
                                : Text(
                                    context.watch<Selection>().state == 1 ? 'حفظ' : 'save',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ));
                      })
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    context.read<GetSensitivityCubit>().fetch();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
               context.watch<Selection>().state == 1 ? 'الحساسيات' :  'Sensitivity',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              TextButton(
                  onPressed: () {
                    showCustomBottomSheet(context);
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
          BlocBuilder<GetSensitivityCubit, GetSensitivityState>(
              builder: (context, state) {
            if (state is GetSensitivityLoaded )
            { Map l;
               if(state.Sensitivity.containsKey('data'))
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            state.Sensitivity['data']['strong'].length,
                            (index) {
                              return Row(
                                children: [
                                  SensitivityWidget(
                                    senstype: state.Sensitivity['data']
                                        ['strong'][index]['aller_name'],
                                    type: state.Sensitivity['data']['strong']
                                        [index]['aller_type'],
                                    reason: state.Sensitivity['data']['strong']
                                        [index]['aller_cause'],
                                    treatment: state.Sensitivity['data']
                                        ['strong'][index]['aller_treatment'],
                                    pervention: state.Sensitivity['data']
                                        ['strong'][index]['aller_pervention'],
                                    reasons: state.Sensitivity['data']['strong']
                                        [index]['aller_reasons'],
                                    width: 300,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              );
                            },
                          ).toList(),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Wrap(
                          children: List.generate(
                            state.Sensitivity['data']['medium'].length,
                            (index) {
                              return Row(
                                children: [
                                  SensitivityWidget(
                                    senstype: state.Sensitivity['data']
                                        ['medium'][index]['aller_name'],
                                    type: state.Sensitivity['data']['medium']
                                        [index]['aller_type'],
                                    reason: state.Sensitivity['data']['medium']
                                        [index]['aller_cause'],
                                    treatment: state.Sensitivity['data']
                                        ['medium'][index]['aller_treatment'],
                                    pervention: state.Sensitivity['data']
                                        ['medium'][index]['aller_pervention'],
                                    reasons: state.Sensitivity['data']['medium']
                                        [index]['aller_reasons'],
                                    width: 300,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              );
                            },
                          ).toList(),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Wrap(
                          children: List.generate(
                            state.Sensitivity['data']['weak'].length,
                            (index) {
                              return Row(
                                children: [
                                  SensitivityWidget(
                                    width: 300,
                                    senstype: state.Sensitivity['data']['weak']
                                        [index]['aller_name'],
                                    type: state.Sensitivity['data']['weak']
                                        [index]['aller_type'],
                                    reason: state.Sensitivity['data']['weak']
                                        [index]['aller_cause'],
                                    treatment: state.Sensitivity['data']['weak']
                                        [index]['aller_treatment'],
                                    pervention: state.Sensitivity['data']
                                        ['weak'][index]['aller_pervention'],
                                    reasons: state.Sensitivity['data']['weak']
                                        [index]['aller_reasons'],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            else return  SizedBox();
           } return SizedBox();
          }),
        ],
      ),
    );
  }
}
