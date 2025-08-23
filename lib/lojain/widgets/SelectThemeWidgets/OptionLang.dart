import 'package:MediLink/lojain/Controllers/onboarding/SelectionLang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class buildOptionButton extends StatelessWidget {
  buildOptionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Selection(),
      child: BlocBuilder<Selection, int?>(
        builder: (context, selectedOption) {
          print(selectedOption);
          return Column(
            children: [
              ElevatedButton(
                onPressed: () => context.read<Selection>().selectLang(1),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                  fixedSize: Size(double.infinity, 64),
                  backgroundColor: selectedOption == 1
                      ? Color.fromRGBO(64, 123, 255, 1)
                      : Colors.white12, // تغيير اللون عند التحديد
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('العربية',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 24)),
                    SizedBox(width: 8),
                    Container(
                      child: Image.asset("images/Ellipse 8.png"),
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => context.read<Selection>().selectLang(2),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                  fixedSize: Size(double.infinity, 64),
                  backgroundColor: selectedOption == 2
                      ? Color.fromRGBO(64, 123, 255, 1)
                      : Colors.white12, // تغيير اللون عند التحديد
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('English',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 24)),
                    SizedBox(width: 8),
                    Container(
                      child: Image.asset("images/Ellipse 8 (1).png"),
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
