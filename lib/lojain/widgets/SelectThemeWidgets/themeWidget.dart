import 'package:MediLink/lojain/Controllers/onboarding/SelectionLang.dart';
import 'package:MediLink/lojain/Controllers/onboarding/SelectionTheme.dart';
import 'package:MediLink/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
    
class ThemeWidget extends StatelessWidget {

  const ThemeWidget({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
      create: (context) => SelectionTheme(),
      child: BlocBuilder<SelectionTheme,int?>(
          builder: (context,option) {
            return Row(
             
                      children: [
                       
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(option==4? Color.fromRGBO(64, 123, 255, 1):Colors.white24)),
                            onPressed: () {
                              context.read<SelectionTheme>().selecttheme(4);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset('images/Group 46.png'),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  lang=='en'?'light' :  'نهاري',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )),
                            SizedBox(width: 20,), ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(option==3?Color.fromRGBO(64, 123, 255, 1) : Colors.white24)),
                            onPressed: () {
                                   context.read<SelectionTheme>().selecttheme(3);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color.fromRGBO(64, 123, 255, 0.3)),
                                    child:
                                        Image.asset('images/arcticons_nightmode.png')),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  lang=='en'?'dark' :  'ليلي',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )),
                      ],
                    );
          }
        ),
    );
  }
}