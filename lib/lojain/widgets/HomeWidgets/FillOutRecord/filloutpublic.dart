import 'dart:math';

import 'package:MediLink/lojain/Controllers/record/checkAddictions.dart';
import 'package:MediLink/lojain/Controllers/record/dropgeneral.dart';
import 'package:MediLink/lojain/models/record/FillOutRecord/postpublic.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Filloutpublic extends StatelessWidget {
  Filloutpublic({Key? key}) : super(key: key);

  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController birthday = TextEditingController();
  final status = DropgeneralCubit();
  final gender = DropgeneralCubit();
  final blood = DropgeneralCubit();
  final smoking = CheckAddictions();
  final alcohol = CheckAddictions();
  final drugs = CheckAddictions();
  String init = 'single';
  List<String> list = ['single', 'married', 'widower', 'divorced'];
  String init1 = 'male';
  List<String> list1 = ['male', 'female'];
  String init2 = 'O+';
  List<String> list2 = [
    'A+',
    'B+',
    'O+',
    'AB+',
    'A-',
    'B-',
    'O-',
    'AB-',
    'Gwada-'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Public',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Image.asset('images/Group 1001.png'),
                    const SizedBox(
                      width: 7,
                    ),
                    const Text(
                      'Your Weight',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(255, 255, 255, 0.6),
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: const Color.fromRGBO(15, 102, 222, 1),
                          width: 2)),
                  height: 52,
                  width: 108,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Expanded(
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          textSelectionTheme: const TextSelectionThemeData(
                              selectionColor: Colors.white,
                              selectionHandleColor: Colors.white,
                              cursorColor: Colors.white)),
                      child: TextFormField(
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'Enter Your Weight',
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        controller: weight,
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
            Column(
              children: [
                Row(
                  children: [
                    Image.asset('images/Vector (16).png'),
                    const SizedBox(
                      width: 7,
                    ),
                    const Text(
                      'Your Height',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(255, 255, 255, 0.6),
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: const Color.fromRGBO(15, 102, 222, 1),
                          width: 2)),
                  height: 52,
                  width: 108,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Expanded(
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          textSelectionTheme: const TextSelectionThemeData(
                              selectionColor: Colors.white,
                              selectionHandleColor: Colors.white,
                              cursorColor: Colors.white)),
                      child: TextFormField(
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'Enter Your Height',
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        controller: height,
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
            Column(
              children: [
                const Row(
                  children: [
                    Text(
                      'Your Birthday',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(255, 255, 255, 0.6),
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: const Color.fromRGBO(15, 102, 222, 1),
                          width: 2)),
                  height: 52,
                  width: 108,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Expanded(
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          textSelectionTheme: const TextSelectionThemeData(
                              selectionColor: Colors.white,
                              selectionHandleColor: Colors.white,
                              cursorColor: Colors.white)),
                      child: TextFormField(
                        keyboardAppearance: Brightness.dark,
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'dd-mm-yy',
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        controller: birthday,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Text(
                  'Social Status',
                  style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(255, 255, 255, 0.6),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: const Color.fromRGBO(15, 102, 222, 1),
                            width: 2)),
                    height: 52,
                    width: 108,
                    child: Expanded(
                        child: BlocBuilder<DropgeneralCubit, DropgeneralState>(
                            bloc: status,
                            builder: (context, state) {
                              if (state.selectedValue != null &&
                                  list.contains(state.selectedValue)) {
                                init = state.selectedValue!;
                              }
                              status.loadSelectedValue(init);
                              return CustomDropdown<String>(
                                hideSelectedFieldWhenExpanded: true,
                                decoration: CustomDropdownDecoration(
                                  closedFillColor: Colors.transparent,
                                  expandedFillColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  headerStyle: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                  listItemStyle: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                  expandedBorder: Border.all(
                                      color: const Color.fromRGBO(
                                          38, 115, 221, 1)),
                                  closedSuffixIcon: Transform.rotate(
                                      angle: -90 * (pi / 180),
                                      child: const Icon(
                                        Icons.arrow_back_ios_new,
                                        color: Color.fromRGBO(38, 115, 221, 1),
                                        size: 15,
                                      )),
                                ),
                                closedHeaderPadding: const EdgeInsets.all(9),
                                disabledDecoration:
                                    const CustomDropdownDisabledDecoration(
                                        fillColor: Colors.transparent),
                                items: list,
                                initialItem: init,
                                onChanged: (value) {
                                  print(status.state.selectedValue);
                                  status.setSelectedValue(value!);
                                },
                              );
                            }))),
              ],
            ),
            Column(
              children: [
                const Text(
                  'Your Gender',
                  style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(255, 255, 255, 0.6),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: const Color.fromRGBO(15, 102, 222, 1),
                            width: 2)),
                    height: 52,
                    width: 128,
                    child: Expanded(
                        child: BlocBuilder<DropgeneralCubit, DropgeneralState>(
                            bloc: gender,
                            builder: (context, state) {
                              if (state.selectedValue != null &&
                                  list1.contains(state.selectedValue)) {
                                init1 = state.selectedValue!;
                              }
                              gender.loadSelectedValue(init1);
                              return Row(
                                children: [
                                  gender.state.selectedValue == 'male'
                                      ? const Icon(
                                          Icons.male,
                                          color:
                                              Color.fromRGBO(15, 102, 222, 1),
                                        )
                                      : const Icon(
                                          Icons.female,
                                          color:
                                              Color.fromRGBO(15, 102, 222, 1),
                                        ),
                                  Expanded(
                                    child: Container(
                                      width: 100,
                                      child: CustomDropdown<String>(
                                        hideSelectedFieldWhenExpanded: true,
                                        decoration: CustomDropdownDecoration(
                                          closedFillColor: Colors.transparent,
                                          expandedFillColor: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          headerStyle: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14),
                                          listItemStyle: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14),
                                          expandedBorder: Border.all(
                                              color: const Color.fromRGBO(
                                                  38, 115, 221, 1)),
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
                                                fillColor: Colors.transparent),
                                        items: list1,
                                        initialItem: init1,
                                        onChanged: (value) {
                                          print(gender.state.selectedValue);
                                          gender.setSelectedValue(value!);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }))),
              ],
            ),
            Column(
              children: [
                const Text(
                  'Your Blood clique',
                  style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(255, 255, 255, 0.6),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: const Color.fromRGBO(15, 102, 222, 1),
                            width: 2)),
                    height: 52,
                    width: 108,
                    child: Expanded(
                        child: BlocBuilder<DropgeneralCubit, DropgeneralState>(
                            bloc: blood,
                            builder: (context, state) {
                              if (state.selectedValue != null &&
                                  list2.contains(state.selectedValue)) {
                                init2 = state.selectedValue!;
                              }
                              blood.loadSelectedValue(init2);
                              return CustomDropdown<String>(
                                hideSelectedFieldWhenExpanded: true,
                                decoration: CustomDropdownDecoration(
                                  closedFillColor: Colors.transparent,
                                  expandedFillColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  headerStyle: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                  listItemStyle: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                  expandedBorder: Border.all(
                                      color: const Color.fromRGBO(
                                          38, 115, 221, 1)),
                                  closedSuffixIcon: Transform.rotate(
                                      angle: -90 * (pi / 180),
                                      child: const Icon(
                                        Icons.arrow_back_ios_new,
                                        color: Color.fromRGBO(38, 115, 221, 1),
                                        size: 15,
                                      )),
                                ),
                                closedHeaderPadding: const EdgeInsets.all(9),
                                disabledDecoration:
                                    const CustomDropdownDisabledDecoration(
                                        fillColor: Colors.transparent),
                                items: list2,
                                initialItem: init2,
                                onChanged: (value) {
                                  print(blood.state.selectedValue);
                                  blood.setSelectedValue(value!);
                                },
                              );
                            }))),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Your Addictions',
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.6),
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Text('Smoking'),
                    BlocBuilder<CheckAddictions, bool>(
                        bloc: smoking,
                        builder: (context, state) {
                          return Checkbox(
                            activeColor: Color.fromRGBO(64, 123, 255, 1),
                            side: BorderSide(
                                color: Color.fromRGBO(64, 123, 255, 1),
                                width: 2),
                            value: smoking.state,
                            onChanged: (value) {
                              smoking.check(value!);
                            },
                          );
                        }),
                  ],
                ),
                Row(
                  children: [
                    Text('Alcohol'),
                    BlocBuilder<CheckAddictions, bool>(
                        bloc: alcohol,
                        builder: (context, state) {
                          return Checkbox(
                            activeColor: Color.fromRGBO(64, 123, 255, 1),
                            side: BorderSide(
                                color: Color.fromRGBO(64, 123, 255, 1),
                                width: 2),
                            value: alcohol.state,
                            onChanged: (value) {
                              alcohol.check(value!);
                            },
                          );
                        }),
                  ],
                ),
                Row(
                  children: [
                    Text('Drugs'),
                    BlocBuilder<CheckAddictions, bool>(
                        bloc: drugs,
                        builder: (context, state) {
                          return Checkbox(
                            activeColor: Color.fromRGBO(64, 123, 255, 1),
                            value: drugs.state,
                            side: BorderSide(
                                color: Color.fromRGBO(64, 123, 255, 1),
                                width: 2),
                            onChanged: (value) {
                              drugs.check(value!);
                            },
                          );
                        }),
                  ],
                ),
              ],
            ),
            BlocBuilder<PostpublicState, bool>(builder: (context, state) {
              return TextButton(
                  onPressed: () async {
                    print('================');
                    var isSuccess = await context
                        .read<PostpublicState>()
                        .update(
                            weight.text,
                            height.text,
                            birthday.text,
                            gender.state.selectedValue,
                            blood.state.selectedValue,
                            status.state.selectedValue,
                            smoking.state,
                            alcohol.state,
                            drugs.state);

                    if (isSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('success'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ));
                    } else {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('error'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 2),
                      ));
                    }
                  },
                  child:state? CircularProgressIndicator(color: Colors.white,): Text(
                    'Save',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(64, 123, 255, 1),
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor: Color.fromRGBO(64, 123, 255, 1)),
                  ));
            })
          ],
        ),
      ],
    );
  }
}
