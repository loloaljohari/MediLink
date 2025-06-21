import 'package:MediLink/Controllers/onboarding/SelectionColors.dart';
import 'package:MediLink/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorsButtons extends StatelessWidget {
  const ColorsButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>SelectionColors() ,
      child: BlocBuilder<SelectionColors, int?>(builder: (context, option) {
        return Row(
  
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<SelectionColors>().selectcolor(5);
              },
              child: Text(
               lang=='en'?'red' :   'احمر',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              style: ButtonStyle(
                 shape:WidgetStatePropertyAll( RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(
                                
                                  width: option==5?3:2,
                                  color: option == 5
                                      ? Colors.blue
                                      : Colors.white12))),
                    backgroundColor: WidgetStatePropertyAll(Colors.red),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<SelectionColors>().selectcolor(6);
                },
                child: Text(
                   lang=='en'?'green' : 'اخضر',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                style: ButtonStyle(
                   shape:WidgetStatePropertyAll( RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(
                                
                                  width: option==6?3:2,
                                  color: option == 6
                                      ? Colors.blue
                                      : Colors.white12))),
                    backgroundColor: WidgetStatePropertyAll(Colors.green))),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<SelectionColors>().selectcolor(7);
                },
                child: Text(
                 lang=='en'?'yellow' :   'اصفر',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                style: ButtonStyle(
                   shape:WidgetStatePropertyAll( RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(
                                
                                  width: option==7?3:2,
                                  color: option == 7
                                      ? Colors.blue
                                      : Colors.white12))),
                    backgroundColor: WidgetStatePropertyAll(Colors.yellow))),
          ],
        );
      }),
    );
  }
}
