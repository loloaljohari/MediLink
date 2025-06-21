import 'package:flutter/material.dart';

class MedicalFile extends StatelessWidget {
  const MedicalFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Padding(
          padding: EdgeInsets.only(left: 50),
          child: Text(
            'Medical file',
            style: TextStyle(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Image.asset('images/Group 1053.png'),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'X-Ray Head',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('images/Vector (17).png'),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'name',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
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
                              'date',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
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
                          child: Image.asset(
                            'images/eaf762a7ec8306af59e2a12b195e9c678318a5a2.jpg',
                            fit: BoxFit.cover,
                          ),
                        ))
                  ],
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Image.asset('images/Group 1053.png'),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'X-Ray Hand',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('images/Vector (17).png'),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'name',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
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
                              'date',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
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
                          child: Image.asset(
                            'images/bd04e18b5f6486227968b1c8d1f92c72710254bc.jpg',
                            fit: BoxFit.cover,
                          ),
                        ))
                  ],
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
