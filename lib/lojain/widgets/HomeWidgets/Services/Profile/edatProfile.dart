import 'package:MediLink/lojain/Class/ImagePick.dart';
import 'package:MediLink/lojain/models/Proflie/getProfile.dart';
import 'package:MediLink/lojain/models/Proflie/updateProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EdatProfile extends StatelessWidget {
  EdatProfile({Key? key}) : super(key: key);
  FocusNode focusNode = FocusNode();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  final edit1 = UpdateprofileCubit();
  final edit2 = UpdateprofileCubit();
  final edit3 = UpdateprofileCubit();
  final edit4 = UpdateprofileCubit();

  void showImageDialog(BuildContext context, String image) {
   
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: const EdgeInsets.symmetric(vertical: 1),
            content:InteractiveViewer(
                  minScale: 0.5, maxScale: 4, child: SizedBox(
              child:  Image.network(image)),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromRGBO(38, 115, 221, 1),
          ),
        ),
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'My Profile',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 10),
        child: ListView(
          children: [
            BlocBuilder<GetprofileCubit, GetProfileState>(
                builder: (context, state) {
              if (state is GetProfileLoading) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              } else if (state is GetProfileLoaded) {
                TextEditingController name =
                    TextEditingController(text: state.myprofile['name']);
                TextEditingController email =
                    TextEditingController(text: state.myprofile['email']);
                TextEditingController phone =
                    TextEditingController(text: state.myprofile['phone']);

                return Column(
                  children: [
                    BlocBuilder<UpdateprofileCubit, bool>(
                        bloc: edit1,
                        builder: (context, state1) {
                          return state1
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showImageDialog(
                                            context, state.myprofile['photo']);
                                      },
                                      child: Container(
                                        width: 185,
                                        height: 185,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: ClipOval(
                                          child: Image.network(
                                            state.myprofile['photo'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        var image = await Imagepick().image();
                                        print(image);
                                        print('================');
                                        var isSuccess = await edit1.update(
                                            null, null, image, null);

                                        if (isSuccess) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text('success'),
                                            backgroundColor: Colors.green,
                                            duration: Duration(seconds: 2),
                                          ));
                                          context
                                              .read<GetprofileCubit>()
                                              .fetchProfile();
                                        } else {
                                          // ignore: use_build_context_synchronously
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text('error'),
                                            backgroundColor: Colors.red,
                                            duration: Duration(seconds: 2),
                                          ));
                                        }
                                      },
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color.fromRGBO(
                                                217, 217, 217, 1)),
                                        child: Image.asset(
                                            'images/Vector (11).png'),
                                      ),
                                    )
                                  ],
                                );
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User Name',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          width: double.infinity,
                          height: 54,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color.fromRGBO(38, 115, 221, 0.1)),
                          child: Row(
                            children: [
                              Container(
                                child: Expanded(
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                        textSelectionTheme:
                                            TextSelectionThemeData(
                                                selectionColor: Colors.white,
                                                selectionHandleColor:
                                                    Colors.white,
                                                cursorColor: Colors.white)),
                                    child: TextFormField(
                                      onFieldSubmitted: (value) async {
                                        print('================');
                                        var isSuccess = await edit2.update(
                                            name.text, null, null, null);

                                        if (isSuccess) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text('success'),
                                            backgroundColor: Colors.green,
                                            duration: Duration(seconds: 2),
                                          ));
                                          context
                                              .read<GetprofileCubit>()
                                              .fetchProfile();
                                        } else {
                                          // ignore: use_build_context_synchronously
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text('error'),
                                            backgroundColor: Colors.red,
                                            duration: Duration(seconds: 2),
                                          ));
                                        }
                                      },
                                      focusNode: focusNode,
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                      controller: name,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                              BlocBuilder<UpdateprofileCubit, bool>(
                                  bloc: edit2,
                                  builder: (context, state) {
                                    return InkWell(
                                        onTap: () {
                                          FocusScope.of(context)
                                              .requestFocus(focusNode);
                                        },
                                        child: state
                                            ? CircularProgressIndicator(
                                                color: Colors.white,
                                              )
                                            : Image.asset(
                                                'images/Vector (11).png'));
                                  })
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Email Adrees',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          width: double.infinity,
                          height: 54,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color.fromRGBO(38, 115, 221, 0.1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Expanded(
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                        textSelectionTheme:
                                            TextSelectionThemeData(
                                                selectionColor: Colors.white,
                                                selectionHandleColor:
                                                    Colors.white,
                                                cursorColor: Colors.white)),
                                    child: TextFormField(
                                      focusNode: focusNode1,
                                      controller: email,
                                      onFieldSubmitted: (value) async {
                                        print('================');
                                        var isSuccess = await edit3.update(
                                            null, null, null, email.text);

                                        if (isSuccess) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text('success'),
                                            backgroundColor: Colors.green,
                                            duration: Duration(seconds: 2),
                                          ));
                                          context
                                              .read<GetprofileCubit>()
                                              .fetchProfile();
                                        } else {
                                          // ignore: use_build_context_synchronously
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text('error'),
                                            backgroundColor: Colors.red,
                                            duration: Duration(seconds: 2),
                                          ));
                                        }
                                      },
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                              BlocBuilder<UpdateprofileCubit, bool>(
                                  bloc: edit3,
                                  builder: (context, state) {
                                    return InkWell(
                                        onTap: () {
                                          FocusScope.of(context)
                                              .requestFocus(focusNode1);
                                        },
                                        child: state
                                            ? CircularProgressIndicator(
                                                color: Colors.white,
                                              )
                                            : Image.asset(
                                                'images/Vector (11).png'));
                                  })
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Phone Number',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          width: double.infinity,
                          height: 54,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color.fromRGBO(38, 115, 221, 0.1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Expanded(
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                        textSelectionTheme:
                                            TextSelectionThemeData(
                                                selectionColor: Colors.white,
                                                selectionHandleColor:
                                                    Colors.white,
                                                cursorColor: Colors.white)),
                                    child: TextFormField(
                                      controller: phone,
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                      focusNode: focusNode2,
                                      onFieldSubmitted: (value) async {
                                        print('================');
                                        var isSuccess = await edit4.update(
                                            null, phone.text, null, null);

                                        if (isSuccess) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text('success'),
                                            backgroundColor: Colors.green,
                                            duration: Duration(seconds: 2),
                                          ));
                                          context
                                              .read<GetprofileCubit>()
                                              .fetchProfile();
                                        } else {
                                          // ignore: use_build_context_synchronously
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text('error'),
                                            backgroundColor: Colors.red,
                                            duration: Duration(seconds: 2),
                                          ));
                                        }
                                      },
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                              BlocBuilder<UpdateprofileCubit, bool>(
                                  bloc: edit4,
                                  builder: (context, state) {
                                    return InkWell(
                                        onTap: () {
                                          FocusScope.of(context)
                                              .requestFocus(focusNode2);
                                        },
                                        child: state
                                            ? CircularProgressIndicator(
                                                color: Colors.white,
                                              )
                                            : Image.asset(
                                                'images/Vector (11).png'));
                                  })
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                );
              } else if (state is GetProfileError) {
                return Text(state.messageError);
              } else
                return SizedBox();
            }),
          ],
        ),
      ),
    );
  }
}
