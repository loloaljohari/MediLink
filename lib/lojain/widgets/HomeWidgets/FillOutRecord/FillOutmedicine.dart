import 'dart:math';

import 'package:MediLink/lojain/Controllers/record/dropgeneral.dart';
import 'package:MediLink/lojain/models/record/FillOutRecord/postmedicine.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controllers/onboarding/SelectionLang.dart';
import '../../../Controllers/onboarding/SelectionTheme.dart';

class FillOutmedicine extends StatelessWidget {
  FillOutmedicine({Key? key}) : super(key: key);
  var list = [
    'current',
    'chronic',
  ];
  var init = 'chronic';
  var list1 = [
    'once_daily',
    'twice_daily',
    'three_times_daily',
    'daily',
    'weekly',
    'monthly',
    'yearly',
  ];
  var init1 = 'once_daily';
  var list2 = [
    'before_food',
    'after_food',
    'morinng',
  ];
  var init2 = 'before_food';
  var list3 = [
    'tablet',
    'capsule',
    'pills',
    'syrup',
    'liquid',
    'drops',
    'sprays',
    'patches',
    'injections',
  ];
  var init3 = 'tablet';
  final timing = DropgeneralCubit();
  final type = DropgeneralCubit();
  final dosageform = DropgeneralCubit();
  final frequency = DropgeneralCubit();
  TextEditingController name = TextEditingController();
  TextEditingController med_end_date = TextEditingController();
  TextEditingController med_start_date = TextEditingController();
  TextEditingController med_dose = TextEditingController();
  TextEditingController med_prescribed_by_doctor = TextEditingController();

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
                context.watch<Selection>().state == 1 ? 'الادوية' : 'Medicine',
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
                      backgroundColor: context.read<SelectionTheme>().state == 4
                          ? Color.fromRGBO(38, 115, 221, 1)
                          : Color.fromRGBO(19, 57, 111, 1),
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
                                          color: context
                                                      .read<SelectionTheme>()
                                                      .state ==
                                                  4
                                              ? Colors.white24
                                              : Color.fromRGBO(34, 34, 34, 1),
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
                                                labelText:
                                                    context.watch<Selection>().state == 1 ? 'ادخل اسم الدواء' : 'Enter Name Medicine',
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
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: context
                                                            .read<
                                                                SelectionTheme>()
                                                            .state ==
                                                        4
                                                    ? Colors.white24
                                                    : Color.fromRGBO(
                                                        34, 34, 34, 1),
                                              ),
                                              height: 52,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.3,
                                              child: Expanded(
                                                  child: BlocBuilder<
                                                          DropgeneralCubit,
                                                          DropgeneralState>(
                                                      bloc: type,
                                                      builder:
                                                          (context, state) {
                                                        if (state.selectedValue !=
                                                                null &&
                                                            list.contains(state
                                                                .selectedValue)) {
                                                          init = state
                                                              .selectedValue!;
                                                        }
                                                        type.loadSelectedValue(
                                                            init);
                                                        return CustomDropdown<
                                                            String>(
                                                          hideSelectedFieldWhenExpanded:
                                                              true,
                                                          decoration:
                                                              CustomDropdownDecoration(
                                                            hintStyle: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 16),
                                                            closedFillColor:
                                                                Colors
                                                                    .transparent,
                                                            expandedFillColor:
                                                                Theme.of(
                                                                        context)
                                                                    .scaffoldBackgroundColor,
                                                            headerStyle:
                                                                const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        16),
                                                            listItemStyle:
                                                                const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        16),
                                                            closedSuffixIcon: Transform
                                                                .rotate(
                                                                    angle: -90 *
                                                                        (pi /
                                                                            180),
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .arrow_back_ios_new,
                                                                      color: Color.fromRGBO(
                                                                          38,
                                                                          115,
                                                                          221,
                                                                          1),
                                                                      size: 15,
                                                                    )),
                                                          ),
                                                          closedHeaderPadding:
                                                              const EdgeInsets
                                                                  .all(9),
                                                          disabledDecoration:
                                                              const CustomDropdownDisabledDecoration(
                                                                  fillColor: Colors
                                                                      .transparent),
                                                          items: list,
                                                          hintText:context.watch<Selection>().state == 1 ? 'الحالة' : 'State',
                                                          onChanged: (value) {
                                                            print(type.state
                                                                .selectedValue);
                                                            type.setSelectedValue(
                                                                value!);
                                                          },
                                                        );
                                                      }))),
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: context
                                                            .read<
                                                                SelectionTheme>()
                                                            .state ==
                                                        4
                                                    ? Colors.white24
                                                    : Color.fromRGBO(
                                                        34, 34, 34, 1),
                                              ),
                                              height: 52,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.3,
                                              child: Expanded(
                                                  child: BlocBuilder<
                                                          DropgeneralCubit,
                                                          DropgeneralState>(
                                                      bloc: frequency,
                                                      builder:
                                                          (context, state) {
                                                        if (state.selectedValue !=
                                                                null &&
                                                            list1.contains(state
                                                                .selectedValue)) {
                                                          init1 = state
                                                              .selectedValue!;
                                                        }
                                                        frequency
                                                            .loadSelectedValue(
                                                                init1);
                                                        return CustomDropdown<
                                                            String>(
                                                          hideSelectedFieldWhenExpanded:
                                                              true,
                                                          decoration:
                                                              CustomDropdownDecoration(
                                                            hintStyle: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 16),
                                                            closedFillColor:
                                                                Colors
                                                                    .transparent,
                                                            expandedFillColor:
                                                                Theme.of(
                                                                        context)
                                                                    .scaffoldBackgroundColor,
                                                            headerStyle:
                                                                const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        16),
                                                            listItemStyle:
                                                                const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        16),
                                                            closedSuffixIcon: Transform
                                                                .rotate(
                                                                    angle: -90 *
                                                                        (pi /
                                                                            180),
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .arrow_back_ios_new,
                                                                      color: Color.fromRGBO(
                                                                          38,
                                                                          115,
                                                                          221,
                                                                          1),
                                                                      size: 15,
                                                                    )),
                                                          ),
                                                          closedHeaderPadding:
                                                              const EdgeInsets
                                                                  .all(9),
                                                          disabledDecoration:
                                                              const CustomDropdownDisabledDecoration(
                                                                  fillColor: Colors
                                                                      .transparent),
                                                          items: list1,
                                                          hintText: context.watch<Selection>().state == 1 ? 'التكرار' :'frequency',
                                                          onChanged: (value) {
                                                            print(frequency
                                                                .state
                                                                .selectedValue);
                                                            frequency
                                                                .setSelectedValue(
                                                                    value!);
                                                          },
                                                        );
                                                      }))),
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
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: context
                                                            .read<
                                                                SelectionTheme>()
                                                            .state ==
                                                        4
                                                    ? Colors.white24
                                                    : Color.fromRGBO(
                                                        34, 34, 34, 1),
                                              ),
                                              height: 52,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.3,
                                              child: Expanded(
                                                  child: BlocBuilder<
                                                          DropgeneralCubit,
                                                          DropgeneralState>(
                                                      bloc: timing,
                                                      builder:
                                                          (context, state) {
                                                        if (state.selectedValue !=
                                                                null &&
                                                            list2.contains(state
                                                                .selectedValue)) {
                                                          init2 = state
                                                              .selectedValue!;
                                                        }
                                                        timing
                                                            .loadSelectedValue(
                                                                init2);
                                                        return CustomDropdown<
                                                            String>(
                                                          hideSelectedFieldWhenExpanded:
                                                              true,
                                                          decoration:
                                                              CustomDropdownDecoration(
                                                            hintStyle: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 16),
                                                            closedFillColor:
                                                                Colors
                                                                    .transparent,
                                                            expandedFillColor:
                                                                Theme.of(
                                                                        context)
                                                                    .scaffoldBackgroundColor,
                                                            headerStyle:
                                                                const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        16),
                                                            listItemStyle:
                                                                const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        16),
                                                            closedSuffixIcon: Transform
                                                                .rotate(
                                                                    angle: -90 *
                                                                        (pi /
                                                                            180),
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .arrow_back_ios_new,
                                                                      color: Color.fromRGBO(
                                                                          38,
                                                                          115,
                                                                          221,
                                                                          1),
                                                                      size: 15,
                                                                    )),
                                                          ),
                                                          closedHeaderPadding:
                                                              const EdgeInsets
                                                                  .all(9),
                                                          disabledDecoration:
                                                              const CustomDropdownDisabledDecoration(
                                                                  fillColor: Colors
                                                                      .transparent),
                                                          items: list2,
                                                          hintText:
                                                            context.watch<Selection>().state == 1 ? 'وقت الدواء' :  'medicine timing',
                                                          onChanged: (value) {
                                                            print(timing.state
                                                                .selectedValue);
                                                            timing
                                                                .setSelectedValue(
                                                                    value!);
                                                          },
                                                        );
                                                      }))),
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: context
                                                            .read<
                                                                SelectionTheme>()
                                                            .state ==
                                                        4
                                                    ? Colors.white24
                                                    : Color.fromRGBO(
                                                        34, 34, 34, 1),
                                              ),
                                              height: 52,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.3,
                                              child: Expanded(
                                                  child: BlocBuilder<
                                                          DropgeneralCubit,
                                                          DropgeneralState>(
                                                      bloc: dosageform,
                                                      builder:
                                                          (context, state) {
                                                        if (state.selectedValue !=
                                                                null &&
                                                            list3.contains(state
                                                                .selectedValue)) {
                                                          init3 = state
                                                              .selectedValue!;
                                                        }
                                                        dosageform
                                                            .loadSelectedValue(
                                                                init3);
                                                        return CustomDropdown<
                                                            String>(
                                                          hideSelectedFieldWhenExpanded:
                                                              true,
                                                          decoration:
                                                              CustomDropdownDecoration(
                                                            hintStyle: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 16),
                                                            closedFillColor:
                                                                Colors
                                                                    .transparent,
                                                            expandedFillColor:
                                                                Theme.of(
                                                                        context)
                                                                    .scaffoldBackgroundColor,
                                                            headerStyle:
                                                                const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        16),
                                                            listItemStyle:
                                                                const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        16),
                                                            closedSuffixIcon: Transform
                                                                .rotate(
                                                                    angle: -90 *
                                                                        (pi /
                                                                            180),
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .arrow_back_ios_new,
                                                                      color: Color.fromRGBO(
                                                                          38,
                                                                          115,
                                                                          221,
                                                                          1),
                                                                      size: 15,
                                                                    )),
                                                          ),
                                                          closedHeaderPadding:
                                                              const EdgeInsets
                                                                  .all(9),
                                                          disabledDecoration:
                                                              const CustomDropdownDisabledDecoration(
                                                                  fillColor: Colors
                                                                      .transparent),
                                                          items: list3,
                                                          hintText:
                                                             context.watch<Selection>().state == 1 ? 'شكل الجرعة' : 'dosage form',
                                                          onChanged: (value) {
                                                            print(dosageform
                                                                .state
                                                                .selectedValue);
                                                            dosageform
                                                                .setSelectedValue(
                                                                    value!);
                                                          },
                                                        );
                                                      }))),
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
                                              Text(context.watch<Selection>().state == 1 ? 'بداية اخذ الدواء' : 'medicine start date: '),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  color: context
                                                              .read<
                                                                  SelectionTheme>()
                                                              .state ==
                                                          4
                                                      ? Colors.white24
                                                      : Color.fromRGBO(
                                                          34, 34, 34, 1),
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
                                                          const InputDecoration(
                                                        fillColor: Colors.white,
                                                        labelText: ' yyyy-mm-dd',
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
                                                          med_start_date,
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
                                              Text( context.watch<Selection>().state == 1 ? 'نهاية اخذ الدواء اذا كان الدواء مؤقتاً' :'medicine end date:'),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  color: context
                                                              .read<
                                                                  SelectionTheme>()
                                                              .state ==
                                                          4
                                                      ? Colors.white24
                                                      : Color.fromRGBO(
                                                          34, 34, 34, 1),
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
                                                          const InputDecoration(
                                                        fillColor: Colors.white,
                                                        labelText: ' yyyy-mm-dd',
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
                                                      controller: med_end_date,
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
                                                  color: context
                                                              .read<
                                                                  SelectionTheme>()
                                                              .state ==
                                                          4
                                                      ? Colors.white24
                                                      : Color.fromRGBO(
                                                          34, 34, 34, 1),
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
                                                           context.watch<Selection>().state == 1 ? 'جرعة الدواء' : ' medicine dose',
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
                                                      controller: med_dose,
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
                                                  color: context
                                                              .read<
                                                                  SelectionTheme>()
                                                              .state ==
                                                          4
                                                      ? Colors.white24
                                                      : Color.fromRGBO(
                                                          34, 34, 34, 1),
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
                                                           context.watch<Selection>().state == 1 ? 'الطبيب الذي وصفها ' : ' The doctor who prescribed it',
                                                        labelStyle: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10,
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
                                                          med_prescribed_by_doctor,
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
                                      BlocBuilder<Postmedicine, bool>(
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
                                                    WidgetStatePropertyAll(context
                                                                .read<
                                                                    SelectionTheme>()
                                                                .state ==
                                                            4
                                                        ? Colors.white24
                                                        : Color.fromRGBO(
                                                            15, 102, 222, 1))),
                                            onPressed: () async {
                                              print('================');
                                              var isSuccess = await context
                                                  .read<Postmedicine>()
                                                  .post(
                                                      med_type: type
                                                          .state.selectedValue,
                                                      med_name: name.text,
                                                      med_start_date:
                                                          med_start_date.text,
                                                      med_end_date:
                                                          med_end_date.text,
                                                      med_frequency: frequency
                                                          .state.selectedValue,
                                                      med_dosage_form:
                                                          dosageform.state
                                                              .selectedValue,
                                                      med_dose: med_dose.text,
                                                      med_prescribed_by_doctor:
                                                          med_prescribed_by_doctor
                                                              .text,
                                                      med_timing: timing
                                                          .state.selectedValue);

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
                                              }
                                            },
                                            child: state
                                                ? CircularProgressIndicator(
                                                    color: context
                                                                .read<
                                                                    SelectionTheme>()
                                                                .state ==
                                                            3
                                                        ? Colors.white24
                                                        : Color.fromRGBO(
                                                            34, 34, 34, 1),
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
