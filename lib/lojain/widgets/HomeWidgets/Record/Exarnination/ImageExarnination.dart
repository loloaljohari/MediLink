import 'package:MediLink/lojain/models/record/Getpatientrecord/Medicalexaminationsmodel.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Record/Exarnination/FancyImageSwipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../ammar/lib/view/screen/aouth/sinup.dart';

class ImageExarnination extends StatelessWidget {
  const ImageExarnination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GetMedicalexaminationsCubit>().fetch();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
      child: Column(
        children: [
          BlocBuilder<GetMedicalexaminationsCubit, GetMedicalexaminationsState>(
              builder: (context, state) {
            if (state is GetMedicalexaminationsLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetMedicalexaminationsLoaded) {
              if (state.Medicalexaminations.containsKey('data')) {
                if (state.Medicalexaminations['data']['images'].isNotEmpty) {
                  return Column(
                      children: List.generate(
                    state.Medicalexaminations['data']['images'].keys
                        .toList()
                        .length,
                    (index) {
                      var data = state
                          .Medicalexaminations['data']['images'].keys
                          .toList();
                      print(data);
                      var l = data[index];

                      return Column(
                        children: [
                          Row(
                            children: [
                              Image.asset('images/Group (4).png'),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                l.toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FancyImageSwipe(
                            items: List.generate(
                              state.Medicalexaminations['data']['images'][l]
                                  .length,
                              (index1) {
                                print(state.Medicalexaminations['data']
                                    ['images'][l]);
                                return {
                                  'imagePath': state.Medicalexaminations['data']
                                      ['images'][l][index1]['file_url'],
                                  'name': state.Medicalexaminations['data']
                                      ['images'][l][index1]['test_laboratory'],
                                  'date': state.Medicalexaminations['data']
                                      ['images'][l][index1]['test_date']
                                };
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ));
                } else
                  return Text('empty');
              } else
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 150,
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
                            '${state.Medicalexaminations['message']}: To view your medical record, you must have an account on the app. Sign up for our app to access our services.'),
                        ElevatedButton(
                            style: ButtonStyle(
                                fixedSize:
                                    WidgetStatePropertyAll(Size(120, 20)),
                                backgroundColor: WidgetStatePropertyAll(
                                    Color.fromRGBO(38, 115, 221, 1))),
                            onPressed: () {
                              Get.to(Sinup(
                                conte: context,
                              ));
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                ));
              ;
            } else if (state is GetMedicalexaminationsError) {
              return Text(state.messageError.toString());
            } else
              return SizedBox();
          }),
        ],
      ),
    );
  }
}
