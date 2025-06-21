import 'dart:io';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:MediLink/widgets/HomeWidgets/Services/PrescriptionWidget/MedicineWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';

class Exportprescription extends StatelessWidget {
  final String date;
  final List medicine;
  int id;
  final String patientname;
  final String doctorname;

  Exportprescription(
      {super.key,
      required this.date,
      required this.patientname,
      required this.doctorname,
      required this.id,
      required this.medicine});
  final GlobalKey _globalKey = GlobalKey();

  Future<void> requestPermissions() async {
    if (await Permission.storage.request().isGranted) {
      print("تم منح الأذونات!");
    } else {
      print("تم رفض الأذونات!");
    }
  }

  Future<void> savePdf(BuildContext context) async {
    await requestPermissions(); // طلب الأذونات أولًا
    final pdf = pw.Document();
    
    
  final ByteData imageData = await rootBundle.load('images/Group (2).png');
  final Uint8List imageBytes = imageData.buffer.asUint8List();

 final ByteData imageData1 = await rootBundle.load('images/Vector (12).png');
  final Uint8List imageBytes1 = imageData1.buffer.asUint8List();


    pdf.addPage(
      pw.Page(
        build: (pw.Context context) =>pw. Padding(
          padding: pw. EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
          child: pw.Column(
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                
                children: [
               pw.Text(
                    'MedaiLink',
                    style: pw.TextStyle(
                        color: PdfColor.fromHex('#2673DD'),
                        fontSize: 40,
                        fontWeight: pw.FontWeight.bold),
                  ),
               
                pw.Text(
                    date,
                    style: pw.TextStyle(
                        color: PdfColor.fromHex('#2673DD'),
                        fontSize: 20,
                        fontWeight: pw.FontWeight.bold),
                  ),
              
              ]),
              pw.SizedBox(height: 30),
              pw.ListView.builder(
                itemBuilder: (context, index) {
                  return pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                    pw.Text(
                      'Medicine_${medicine[index]['id']}:',
                      style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 25,
                          fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                      children: [
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              'Medical name',
                              style: pw.TextStyle(
                                  color: PdfColors.grey700,
                                  fontSize: 20,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                            pw.Text(
                              medicine[index]['Medicalname'],
                              style: pw.TextStyle(
                                color: PdfColors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        pw.SizedBox(
                          width: 40,
                        ),
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              'Trade name',
                              style: pw.TextStyle(
                                  color: PdfColors.grey700, fontSize: 20,
                                  fontWeight: pw.FontWeight.bold,
                                  ),
                            ),
                            pw.Text(
                              medicine[index]['Tradename'],
                              style: pw.TextStyle(
                                  color: PdfColors.black,
                                  fontSize: 20,)
                            ),
                          ],
                        ),
                        pw.SizedBox(
                          width: 40,
                        ),
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              'alternative',
                              style: pw.TextStyle(
                                  color: PdfColors.grey700,
                                  fontSize: 20,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                            pw.Text(
                              medicine[index]['alternative'],
                              style: pw.TextStyle(
                                color: PdfColors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                    ,pw.SizedBox(height: 30)
                  ]);
                },
                itemCount: medicine.length,
              )
             , pw.  Row(
                      mainAxisAlignment:pw. MainAxisAlignment.spaceBetween,
                      children: [
                       pw. Row(
                          children: [
                        pw.   Container( width: 30,height: 30, child:pw. Image(pw.MemoryImage(imageBytes))),
                           pw.  SizedBox(
                              width: 10,
                            ),
                          pw.  Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw. Text(
                                  'Patient Name',
                                  style:pw. TextStyle(
                                      color: PdfColors.black,
                                      fontSize: 16,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                              pw.  Text(
                                  patientname,
                                  style: pw. TextStyle(
                                      color: PdfColor.fromHex('#2673DD'),
                                      fontSize: 16,
                                      fontWeight: pw.FontWeight.bold,
                                                              )                                ),
                              ],
                            )
                          ],
                        ),
                        pw.Row(
                          children: [
                             pw.   Container( width: 30,height: 30, child :pw.Image(pw.MemoryImage(imageBytes1)),),
                            pw. SizedBox(
                              width: 10,
                            ),
                          pw.  Column(
                              crossAxisAlignment:pw. CrossAxisAlignment.start,
                              children: [
                                pw. Text(
                                  'Doctor Name :',
                                  style:pw. TextStyle(
                                      color: PdfColors.black,
                                      fontSize: 16,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                               pw. Text(
                                  doctorname,
                                  style: pw. TextStyle(
                                      color: PdfColor.fromHex('#2673DD'),
                                      fontSize: 16,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                
            ],
          ),
        ),
      ),
    );

    final directory = Directory('/storage/emulated/0/Documents');
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }

    final file = File("${directory.path}/prescription ${++id}.pdf");
    await file.writeAsBytes(await pdf.save());

    print("تم حفظ PDF في: ${file.path}");
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text('Documents في  prescription ${++id}.pdf تم حفظ الملف   ')),
    );
  }

  Future<void> saveContainerAsImage(BuildContext context) async {
    // 1. طلب صلاحية الوصول للتخزين
    var status = await Permission.storage.request();
    if (!status.isGranted) {
      print("🚫 تم رفض صلاحية التخزين");
      return;
    }

    try {
      // 2. أخذ صورة من الـ Container
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;

      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // 3. حفظ الصورة في المعرض
      final result = await ImageGallerySaverPlus.saveImage(
        pngBytes,
        quality: 100,
        name: "container_image_${DateTime.now().millisecondsSinceEpoch}",
      );

      print("✅ تم الحفظ: $result");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('✅ تم حفظ الصورة في المعرض')),
      );
    } catch (e) {
      print("❌ خطأ أثناء الحفظ: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RepaintBoundary(
          key: _globalKey,
          child: Container(
            color: Colors.black,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: const Color.fromRGBO(38, 115, 221, 0.1)),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'MedaiLink',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 0.87),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              date,
                              style: const TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 0.87),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Medicinewidget(
                          id: 1,
                          alternative: 'Aspiren 81 ',
                          Medicalname: 'Aspiren 81 ',
                          Tradename: 'Aspiren 81 ',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Medicinewidget(
                          id: 2,
                          alternative: 'Aspiren 81 ',
                          Medicalname: 'Aspiren 81 ',
                          Tradename: 'Aspiren 81 ',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('images/Group (2).png'),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Patient Name',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  patientname,
                                  style: const TextStyle(
                                      color: Color.fromRGBO(38, 115, 221, 1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset('images/Vector (12).png'),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Doctor Name :',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  doctorname,
                                  style: const TextStyle(
                                      color: Color.fromRGBO(38, 115, 221, 1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Export as',
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(Color.fromRGBO(38, 115, 221, 1)),
                  fixedSize: WidgetStatePropertyAll(Size(143, 34)),
                ),
                onPressed: () {
                  savePdf(context);
                },
                child: const Text(
                  'PDF',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                )),
            ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(Color.fromRGBO(38, 115, 221, 1)),
                  fixedSize: WidgetStatePropertyAll(Size(143, 34)),
                ),
                onPressed: () {
                  saveContainerAsImage(context);
                },
                child: const Text(
                  'Image',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 28),
          child: Center(
              child: Container(
            width: 267,
            height: 2,
            color: Colors.white,
          )),
        )
      ],
    );
  }
}
