import 'package:flutter/material.dart';

class TheNearestDate extends StatelessWidget {
  final String Imagepath;
  final String namedoctor;
  final String medSpecialty;
  final String Date;
  final String Time;
  final bool Dates;
  const TheNearestDate(
      {Key? key,
      required this.Imagepath,
      required this.namedoctor,
      required this.medSpecialty,
      required this.Date,
      required this.Time,
      required this.Dates})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 358,
          height: Dates ? 185 : 229,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(38, 115, 221, 1).withOpacity(0.20),
              borderRadius: BorderRadius.circular(20)),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          width: 358,
          height: Dates ? 175 : 219,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(38, 115, 221, 1),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 62,
                    height: 62,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            width: 2, color: const Color.fromRGBO(38, 115, 221, 1)),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                              blurRadius: 2,
                              offset: Offset(0, 2),
                              spreadRadius: 0)
                        ]),
                    child: ClipOval(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 2.3),
                        child: Container(
                          width: 62,
                          height: 62,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(38, 115, 221, 1),
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.1),
                                    blurRadius: 2,
                                    offset: Offset(0, -290),
                                    spreadRadius: 9)
                              ]),
                          child: ClipOval(
                              child: Padding(
                            padding: const EdgeInsets.only(
                                top: 3.0, left: 8, right: 8),
                            child: Image.asset(
                              Imagepath,
                              fit: BoxFit.fill,
                            ),
                          )),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('images/Vector333.png'),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                namedoctor,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 14),
                              )
                            ],
                          )),
                      SizedBox(
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('images/Vector9.png'),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                medSpecialty,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 10),
                              )
                            ],
                          )),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Dates
                      ? InkWell(
                          onTap: () {},
                          child: const Column(
                            children: [
                              Icon(
                                Icons.cancel_outlined,
                                size: 36,
                                color: Color.fromRGBO(168, 40, 48, 1),
                              ),
                              Text(
                                'Cancel',
                                style: TextStyle(
                                    color: Color.fromRGBO(168, 40, 48, 1),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              )
                            ],
                          ),
                        )
                      : const SizedBox()
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('images/Group 830.png'),
                  const SizedBox(
                    width: 9,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        width: 80,
                        child: Text(
                          textAlign: TextAlign.left,
                          'Date',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.6),
                              fontWeight: FontWeight.w700,
                              fontSize: 10),
                        ),
                      ),
                      Text(
                        Date,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 10),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Image.asset('images/Group 832.png'),
                  const SizedBox(
                    width: 9,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        width: 70,
                        child: Text(
                          textAlign: TextAlign.left,
                          'Time',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.6),
                              fontWeight: FontWeight.w700,
                              fontSize: 10),
                        ),
                      ),
                      Text(
                        Time,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 10),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Dates
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            style: const ButtonStyle(
                                overlayColor:
                                    WidgetStatePropertyAll(Colors.white30),
                                fixedSize:
                                    WidgetStatePropertyAll(Size(123, 35)),
                                backgroundColor: WidgetStatePropertyAll(
                                    Color.fromRGBO(18, 18, 18, 1))),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset('images/Vector11.png'),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Details',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color.fromRGBO(38, 115, 221, 1)),
                                )
                              ],
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            style: const ButtonStyle(
                                overlayColor:
                                    WidgetStatePropertyAll(Colors.white30),
                                fixedSize:
                                    WidgetStatePropertyAll(Size(123, 35)),
                                backgroundColor: WidgetStatePropertyAll(
                                    Color.fromRGBO(168, 40, 48, 1))),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset('images/Vector12.png'),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Cancel',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ))
                      ],
                    )
            ],
          ),
        ),
      ],
    );
  }
}
