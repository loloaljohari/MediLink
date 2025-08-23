import 'package:MediLink/ammar/lib/view/screen/aouth/sinup.dart';
import 'package:MediLink/lojain/models/record/Getpatientrecord/medicalFilemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../Controllers/onboarding/SelectionLang.dart';
import '../../Controllers/onboarding/SelectionTheme.dart';

class MedicalFile extends StatelessWidget {
  const MedicalFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GetmedicalfileCubit>().fetch();
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromRGBO(38, 115, 221, 1),
          ),
        ),
        title:  Padding(
          padding: EdgeInsets.only(left: 50,right: 50),
          child: Text(
            context.watch<Selection>().state==1?'الأشعة الطبية': 'Medical file',
            style: TextStyle(),
          ),
        ),
      ),
      body: BlocBuilder<GetmedicalfileCubit, GetmedicalfileState>(
          builder: (context, state) {
        if (state is GetmedicalfileLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: context.watch<SelectionTheme>().state==3?Colors.white :Colors.black,
            ),
          );
        } else if (state is GetmedicalfileLoaded) {
          if (state.medicalfile.containsKey('data')) {
            if (state.medicalfile['data'].isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: ListView(
                  children: [
                    Column(
                      children: List.generate(
                        state.medicalfile['data'].length,
                        (index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset('images/Group 1053.png'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    state.medicalfile['data'][index]
                                        ['ray_name'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset('images/Vector (17).png'),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            state.medicalfile['data'][index]
                                                ['ray_laboratory'],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Image.asset('images/Vector (20).png'),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            state.medicalfile['data'][index]
                                                ['ray_date'],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      height: 366,
                                      width: double.infinity,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          state.medicalfile['data'][index]
                                              ['ray_image_url'],
                                          fit: BoxFit.cover,
                                        ),
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                            ],
                          );
                        },
                      ).toList(),
                    )
                  ],
                ),
              );
            } else
              return Text( 
                context.watch<Selection>().state==1?'فارغ': 'empty');
          } else
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(20),
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(130, 182, 255, 1),
                        blurRadius: 18,
                        spreadRadius: 1),
                  ],
                  color: Color.fromRGBO(21, 62, 120, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                       context.watch<Selection>().state == 1
                            ? 'للاطلاع على سجلك الطبي، يجب أن يكون لديك حساب على التطبيق. سجل في تطبيقنا للوصول إلى خدماتنا.'
                            : '${state.medicalfile['message']}: To view your medical record, you must have an account on the app. Sign up for our app to access our services.'),
                  ElevatedButton(
                        style: ButtonStyle(
                            fixedSize: WidgetStatePropertyAll(Size(120, 20)),
                            backgroundColor: WidgetStatePropertyAll(
                                Color.fromRGBO(38, 115, 221, 1))),
                        onPressed: () {
                          Get.to(Sinup(
                            conte: context,
                          ));
                        },
                        child:  Text(
                        context.watch<Selection>().state==1?'اشتراك':   'Register',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ),
            ));
        } else if (state is GetmedicalfileError) {
          return Center(
            child: Text(
            context.watch<Selection>().state==1?'خطأ':   'error'),
          );
        } else
          return SizedBox();
      }),
    );
  }
}
