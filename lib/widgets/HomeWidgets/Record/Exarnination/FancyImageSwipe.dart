import 'package:flutter/material.dart';

class FancyImageSwipe extends StatefulWidget {
  final List<String> imagePaths;
  final String name;
  final String date;

  FancyImageSwipe(
      {super.key,
      required this.imagePaths,
      required this.name,
      required this.date});
  @override
  _FancyImageSwipeState createState() => _FancyImageSwipeState();
}

class _FancyImageSwipeState extends State<FancyImageSwipe> {
  double dragOffset = 0.0;

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      dragOffset += details.delta.dx;
    });
  }

  void _onDragEnd(DragEndDetails details) {
    if (dragOffset > 130) {
      // إذا سحب كفاية، نزيح الصورة للأخير
      setState(() {
        final first = widget.imagePaths.removeAt(0);
        widget.imagePaths.add(first);
        dragOffset = 0.0;
      });
    } else {
      // يرجع مكانه
      setState(() {
        dragOffset = 0.0;
      });
    }
  }

  Widget buildImageLayer(String path) {
    return Container(
      height: 366,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          path,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget buildSwipeCard() {
    return Container(
      height: 374,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          // صورة خلفية
          buildImageLayer(widget.imagePaths[1 % widget.imagePaths.length]),

          // Container أزرق شفاف
          Container(
            height: 374,
            width: 370,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(38, 115, 221, 0.3),
            ),
          ),

          // الصورة الأمامية القابلة للسحب
          Positioned(
            left: dragOffset + 20,
            child: GestureDetector(
              onHorizontalDragUpdate: _onDragUpdate,
              onHorizontalDragEnd: _onDragEnd,
              child: Container(
                height: 366,
                width: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    widget.imagePaths[0],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  widget.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
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
                  widget.date,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        buildSwipeCard()
      ],
    );
  }
}
