import 'package:MediLink/lojain/Controllers/onboarding/SelectionLang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


 Widget buildOptionButton(BuildContext context, int option, String text, String pathImage) {
    return BlocBuilder<Selection, int?>(
      builder: (context, selectedOption) {
        return ElevatedButton(

          onPressed: () => context.read<Selection>().selectLang(option),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(2) ),
            fixedSize: Size(double.infinity, 64),
            backgroundColor: selectedOption == option ? Color.fromRGBO(64, 123, 255, 1) : Colors.white12, // تغيير اللون عند التحديد
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                          Text(text, style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 24)),

              SizedBox(width: 8),
               Container
             (  
              child: Image.asset(pathImage),
              width: 55,
             height: 55,
              decoration: BoxDecoration(
                border: Border.all(color: option==1 ? Colors.black12:Colors.blue),
                borderRadius: BorderRadius.circular(50)
             ),),
            ],
          ),
        );
      },
    );
  }
