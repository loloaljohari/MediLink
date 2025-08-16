import 'package:MediLink/lojain/Controllers/onboarding/SelectionTheme.dart';
import 'package:MediLink/lojain/View/Home/HomePages.dart';
import 'package:MediLink/lojain/models/Aouth/changeAccount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Changeacount extends StatefulWidget {
  Changeacount({Key? key}) : super(key: key);

  @override
  State<Changeacount> createState() => _ChangeacountState();
}

class _ChangeacountState extends State<Changeacount> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password_confirmation = TextEditingController();
  bool obscureText = true;
  bool obscureText1 = true;
  @override
  Widget build(BuildContext context) {
    var mode = context.watch<SelectionTheme>().state;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(150),
                  bottomRight: Radius.circular(150)),
              color: Color.fromRGBO(31, 90, 172, 0.961),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                    child: Container(
                        height: 130,
                        width: 130,
                        child: Image.asset(
                          'images/Untitled1.png',
                          fit: BoxFit.contain,
                        ))),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Center(
              child: Text(
            'you should change the account',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 14, left: 25, right: 25),
            child: TextField(
              cursorColor: Colors.white,
              controller: email,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(31, 90, 172, 0.961),
                          width: 2.4)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(31, 90, 172, 0.961))),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color.fromRGBO(31, 90, 172, 0.961),
                  )),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color.fromRGBO(31, 90, 172, 0.961),
                  )),
                  labelStyle: TextStyle(color: Colors.white, fontSize: 13),
                  labelText: 'enter new email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
            child: TextField(
              obscureText: obscureText,
              cursorColor: Colors.white,
              controller: password,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: obscureText
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(31, 90, 172, 0.961),
                          width: 2.4)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(31, 90, 172, 0.961))),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color.fromRGBO(31, 90, 172, 0.961),
                  )),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color.fromRGBO(31, 90, 172, 0.961),
                  )),
                  labelStyle: TextStyle(color: Colors.white, fontSize: 13),
                  labelText: 'enter new password'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
            child: TextField(
              obscureText: obscureText1,
              cursorColor: Colors.white,
              controller: password_confirmation,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText1 = !obscureText1;
                        });
                      },
                      icon: obscureText
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(31, 90, 172, 0.961),
                          width: 2.4)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(31, 90, 172, 0.961))),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color.fromRGBO(31, 90, 172, 0.961),
                  )),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color.fromRGBO(31, 90, 172, 0.961),
                  )),
                  labelStyle: TextStyle(color: Colors.white, fontSize: 13),
                  labelText: 'password confirmation'),
            ),
          ),
          SizedBox(height: 23),
          BlocBuilder<ChangeAccount, bool>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: WidgetStatePropertyAll(Size(70, 30)),
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromRGBO(31, 90, 172, 0.961))),
                    onPressed: () async {
                      bool s = await context.read<ChangeAccount>().post(
                          email: email.text,
                          password: password.text,
                          password_confirmation: password_confirmation.text);
                           if (s) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Color.fromRGBO(20, 210, 86, 1),
                            content: Text('success'),
                          ),
                        );
                        Get.offAll(HomePages());
                      } else
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Color.fromRGBO(210, 48, 20, 1),
                            content: Text('error'),
                          ),
                        );
                    },
                    child: state
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'save',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          )),
              );
            },
          )
        ],
      ),
    );
  }
}
