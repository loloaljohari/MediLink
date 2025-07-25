
import 'package:pdf/widgets.dart' ;
import 'package:printing/printing.dart';

class PdfApi {

static Future<void> generat(Widget child) async{
 final pdf = Document();
  pdf.addPage(
    Page(
      build: (Context context) => Container(
        child: child
          ),
    ),
  );

  await Printing.sharePdf(bytes: await pdf.save(), filename: 'Medicine.pdf');
     print("✅ تم الحفظ:");
   
}

}