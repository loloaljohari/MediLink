import 'package:flutter/material.dart';

class PdfwidgetExarnination extends StatelessWidget {
  final String name;

  final String date;
  const PdfwidgetExarnination({Key? key, required this.name, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 72,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(64, 124, 255, 0.076),
            Color.fromRGBO(24, 47, 99, 1)
          ]),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('images/Vector (21).png'),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset('images/Vector (17).png'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(name)
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Image.asset('images/Vector (20).png'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          date,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            InkWell(
              onTap: () {
                
              },
              child: Icon(
                Icons.file_download_outlined,
                color: Color.fromRGBO(15, 102, 222, 1),
                size: 60,
              ),
            )
          ],
        ),
      ),
    );
  }
}
