import 'dart:math';

import 'package:MediLink/lojain/Controllers/onboarding/SelectionLang.dart';
import 'package:MediLink/lojain/Controllers/onboarding/SelectionTheme.dart';
import 'package:MediLink/lojain/Controllers/onboarding/SelectionType.dart';
import 'package:MediLink/lojain/Controllers/services/DropdownCubit.dart';
import 'package:MediLink/lojain/Controllers/services/LangCubit.dart';
import 'package:MediLink/lojain/Controllers/services/darkcontrol.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Services/CustomRadio.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySetting extends StatefulWidget {
  MySetting({Key? key}) : super(key: key);

  @override
  State<MySetting> createState() => _MySettingState();
}

class _MySettingState extends State<MySetting> {
  List<String> _list = ['Larg', 'Medium', 'Small'];
  String? initFont;
  String? selectedValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<DropdownCubit>().loadSelectedValue();
  }

  @override
  Widget build(BuildContext context) {
    double font=(context.watch<DropdownCubit>().state.selectedValue=='Larg'?24:context.watch<DropdownCubit>().state.selectedValue=='Small'?14:16);
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          child:  Text(
            'My Setting',
            style: TextStyle(
            fontWeight: FontWeight.w700, fontSize: font),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: 184,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: const Color.fromRGBO(38, 115, 221, 0.1)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('images/Group (1).png'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Theme',
                        style: TextStyle(
                           
                            fontWeight: FontWeight.w400,
                            fontSize: font),
                      ),
                    ],
                  ),
                  BlocBuilder<SelectionTheme, int?>(builder: (context, select) {
                    return Row(children: [
                      Text(
                        select == 4 ? 'light' : 'Dark',
                        style: TextStyle(
                           
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      ),
                      Transform.scale(
                          scale: 0.87,
                          child: Switch(
                            activeColor: Color.fromRGBO(212, 184, 41, 1),
                            inactiveThumbImage:
                                AssetImage('images/Ellipse 101.png'),
                            trackOutlineColor: WidgetStatePropertyAll(
                                Color.fromRGBO(51, 51, 51, 1)),
                            inactiveThumbColor: Color.fromRGBO(40, 40, 40, 1),
                            inactiveTrackColor: Color.fromRGBO(18, 18, 18, 1),
                            value: select==4? true:false,
                            onChanged: (value) {

                              context.read<SelectionTheme>().selecttheme(value==true? 4:3);
                            },
                          ))
                    ]);
                  }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('images/Vector (8).png'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Languge',
                        style: TextStyle(
                           
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  BlocBuilder<Selection, int?>(builder: (context, select) {
                    return Row(
                      children: [
                        Row(children: [
                          Text(
                            'EN',
                            style: TextStyle(
                               
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CustomRadio(
                            value: 2,
                            groupValue: select!,
                            onChanged: (value) {
                              context.read<Selection>().selectLang(value!);
                            },
                          ),
                        ]),
                        SizedBox(
                          width: 15,
                        ),
                        Row(children: [
                          Text(
                            'AR',
                            style: TextStyle(
                               
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CustomRadio(
                            value: 1,
                            groupValue: select,
                            onChanged: (value) {
                              context.read<Selection>().selectLang(value!);
                            },
                          ),
                        ]),
                      ],
                    );
                  }),
                ],
              ),
             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('images/fluent_text-font-size-16-filled.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Size Font',
                        style: TextStyle(
                           
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Container(
                      width: 95,
                      height: 50,
                      child: BlocBuilder<DropdownCubit, DropdownState>(
                          builder: (context, state) {
                        if (state.selectedValue != null &&
                            _list.contains(state.selectedValue)) {
                          initFont = state.selectedValue;
                        }

                        return CustomDropdown<String>(
                          hideSelectedFieldWhenExpanded: true,
                          decoration: CustomDropdownDecoration(
                            closedBorder: Border.all(
                                color: const Color.fromRGBO(38, 115, 221, 1)),
                            closedFillColor: Colors.transparent,
                            expandedFillColor: Theme.of(context).scaffoldBackgroundColor,
                            headerStyle: TextStyle(
                               
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                            listItemStyle: TextStyle(
                               
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                            expandedBorder: Border.all(
                                color: const Color.fromRGBO(38, 115, 221, 1)),
                            closedSuffixIcon: Transform.rotate(
                                angle: 90 * (pi / 180),
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: const Color.fromRGBO(38, 115, 221, 1),
                                  size: 15,
                                )),
                          ),
                          closedHeaderPadding: EdgeInsets.all(5),
                          disabledDecoration: CustomDropdownDisabledDecoration(
                              fillColor: Colors.transparent),
                          items: _list,
                          initialItem: initFont,
                          onChanged: (value)  {
                            context.read<DropdownCubit>().setSelectedValue(value!);
                          },
                        );
                      }))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
