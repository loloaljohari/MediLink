import 'package:MediLink/lojain/Controllers/onboarding/ExpansionCubit.dart';
import 'package:MediLink/lojain/Controllers/onboarding/SelectionType.dart';
import 'package:MediLink/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Controllers/onboarding/SelectionLang.dart';

// ignore: must_be_immutable
class Expansionwidget extends StatelessWidget {

  Expansionwidget({super.key});

  @override
  Widget build(BuildContext context) {
      List<Widget> list = [
    Text(
      context.watch<Selection>().state == 2?'larg' :  'كبير',
      style: TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
    ),
    Text(
      context.watch<Selection>().state == 2?'medium' :  'متوسط',
      style: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
    ),
    Text(
    context.watch<Selection>().state == 2?'small' :    'صغير',
      style: TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
    ),
  ];

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ExpansionCubit()),
          BlocProvider(create: (context) => SelectionType())
        ],
        child: BlocBuilder<ExpansionCubit, bool>(builder: (context, state) {
          return ExpansionTile(
            backgroundColor: Colors.white12,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            collapsedBackgroundColor: Colors.white12,
            collapsedShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onExpansionChanged: (value) {
              context.read<ExpansionCubit>().changestate();
            },
            leading: Text(
              context.watch<Selection>().state == 2?'Choose the font that suits you' :  'اختر الخط المناسب لك',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.right,
            ),
            trailing: state
                ? Image.asset('images/Vector1.png')
                : Image.asset('images/Vector2.png'),
            title: Text(''),
            children: List.generate(list.length, (index) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: BlocBuilder<SelectionType, int?>(
                      builder: (context, option) {
                    return ElevatedButton(
                      onPressed: () =>
                          context.read<SelectionType>().choose(index),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(double.infinity,option==index?45 : 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              
                                width: option==index?3:2,
                                color: option == index
                                    ? Colors.blue
                                    : Colors.white12)),
                        backgroundColor: option == index
                            ? Color.fromRGBO(64, 123, 255, 0.2)
                            : Colors.white10,
                      ),
                      child: Container(
                          width: double.infinity,
                          alignment: Alignment.centerRight,
                          child: list[index]),
                    );
                  }));
            }),
          );
        }));
  }
}
