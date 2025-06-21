import 'package:flutter/material.dart';

class DashedGradientBar extends StatelessWidget {
  final int segments;
  final double bmi;
  const DashedGradientBar({super.key, this.segments = 60, required this.bmi});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 35,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                 left: bmi * 5.4+6,
                 top: 0,
                child: Text('$bmi',
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400)),
              ),
              Positioned(
                left: bmi * 5.4, // تحديد موقع المؤشر بناءً على النسبة
                top: 0,
                child:
                    Icon(Icons.arrow_drop_down_rounded, color: Colors.blue, size: 30),
              ),
              CustomPaint(
                size: const Size(double.infinity, 10),
                painter: _DashedGradientPainter(segments),
              ),
            ],
          ),
        ),
        Row(
          
          children: [
            SizedBox(width: 20,)
            ,Text(
              'very skinny',
              style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              width: 40,
            ),
            Column(
              children: [
                Container(
                  height: 17,
                  width: 1,
                  color: Colors.white,
                ),
                Text(
                  '18.5',
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 7.0),
              child: Text(
                'Normal',
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 17,
                  width: 1,
                  color: Colors.white,
                ),
                Text(
                  '25.5',
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(width: 80,),
            Text(
              'very fat',
              style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400),
            ),
          ],
        )
      ],
    );
  }
}

class _DashedGradientPainter extends CustomPainter {
  final int segments;
  _DashedGradientPainter(this.segments);

  @override
  void paint(Canvas canvas, Size size) {
    double segmentWidth = size.width / segments;
    double height = size.height;

    for (int i = 0; i < segments; i++) {
      // احسب نسبة اللون
      double t = i / (segments - 1);

      // مثال لتدرج من الأحمر إلى الأخضر إلى البرتقالي إلى الأحمر
      Color color = _getColorAt(t);

      Paint paint = Paint()..color = color;
      Rect rect = Rect.fromLTWH(i * segmentWidth, 0, segmentWidth - 4, height);
      canvas.drawRect(rect, paint);
    }
  }

  Color _getColorAt(double t) {
    const redLight = Color.fromRGBO(217, 57, 57, 1);
    const redDark = Color.fromRGBO(115, 30, 30, 1);
    const green = Color.fromRGBO(57, 217, 75, 1);
    const yellow = Color.fromRGBO(196, 176, 73, 1);

    if (t < 0.24) {
      return Color.lerp(redDark, redLight, t / 0.2)!;
    } else if (t < 0.33) {
      return Color.lerp(redLight, green, (t - 0.23) / 0.15)!;
    } else if (t < 0.46) {
      return Color.lerp(green, yellow, (t - 0.35) / 0.15)!;
    } else {
      return Color.lerp(const Color.fromARGB(255, 196, 159, 73), redLight, (t - 0.55) / 0.25)!;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
