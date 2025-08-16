import 'package:MediLink/ammar/lib/view/screen/aouth/sinup.dart';
import 'package:MediLink/lojain/Static/Static.dart';
import 'package:MediLink/lojain/models/Proflie/getProfile.dart';
import 'package:MediLink/lojain/widgets/HomeWidgets/Services/Profile/edatProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetprofileCubit, GetProfileState>(
        builder: (context, state) {
      if (state is GetProfileLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is GetProfileLoaded) {
        if (state.myprofile.containsKey('name')) {
          return Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  'My Profile',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EdatProfile(),
                  ));
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  height: 86,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color.fromRGBO(38, 115, 221, 0.1)),
                  child: Row(
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: ClipOval(
                            child:(state.myprofile['photo'] ==
                                      '$Imagepathurl/storage/avatars/defaults.jpg' ||
                                  state.myprofile['photo'] ==
                                      '$Imagepathurl/storage/avatars/6681221.png')? Image.asset('images/Group 1013.png',   fit: BoxFit.cover,): Image.network(
                          state.myprofile['photo'],
                          fit: BoxFit.cover,
                        )),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.66,
                              child: Text(
                                state.myprofile['name'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20),
                              )),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.66,
                              child: Text(
                                state.myprofile['email'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              )),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Color.fromRGBO(38, 115, 221, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else
          return ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(Size(60,20)),
                    backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(38, 115, 221, 1))
                  ),
                    onPressed: () {
                      Get.to( Sinup(conte: context,));
                    },
                    child: const Text('Register',style: TextStyle(color: Colors.white),));
           
      } else if (state is GetProfileError) {
        return Text(state.messageError);
      } else
        return SizedBox();
    });
  }
}
