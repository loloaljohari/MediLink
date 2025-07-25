import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class PdfwidgetExarnination extends StatelessWidget {
  final String name;
  final pdfpath;
  final String date;
  const PdfwidgetExarnination(
      {Key? key, required this.name, required this.date, required this.pdfpath})
      : super(key: key);

  Future<void> downloadFile(String fileUrl,BuildContext context) async {

 int i=1;
    
  var status = await Permission.storage.request();
  if (!status.isGranted) {
    print("Permission denied");
    return;
  }


 final downloadsDir = Directory('/storage/emulated/0/Documents');
    if (!downloadsDir.existsSync()) {
      downloadsDir.createSync(recursive: true);
    }
  final filePath = '${downloadsDir.path}/my_file.pdf';

  try {
    await Dio().download(fileUrl, filePath);
    print("✅ تم حفظ الملف في: $filePath");
   
     ScaffoldMessenger.of(context).showSnackBar(

         SnackBar(duration: Duration(seconds: 7),content: Text("✅  Documents/my_file.pdf : تم حفظ الملف في")),
      );
  } catch (e) {
    print("❌ فشل التنزيل: $e");
  }
   
  }

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
              onTap: () async {
              
                await downloadFile(pdfpath,context);
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
