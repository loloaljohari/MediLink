import 'package:MediLink/widgets/HomeWidgets/Record/Exarnination/FancyImageSwipe.dart';
import 'package:flutter/material.dart';

class ImageExarnination extends StatelessWidget {
  const ImageExarnination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('images/Group (4).png'),
              SizedBox(
                width: 10,
              ),
              Text(
                'Diabetic analysis',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          FancyImageSwipe(
            imagePaths: [
              'images/7ec56b601e5941ce957ebd8403b1279ad9d05424.jpg',
              'images/unsplash_7bMdiIqz_J4.png',
              'images/7ec56b601e5941ce957ebd8403b1279ad9d05424.jpg',
            ],
            name: 'AI omar',
            date: '22/10/2020',
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Image.asset('images/Group (4).png'),
              SizedBox(
                width: 10,
              ),
              Text(
                'Pressure analysis',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          FancyImageSwipe(
            imagePaths: [
              'images/4ef35cc699ca1a7a14513db53fb9bd76b803cd23 (2).jpg',
              'images/unsplash_7bMdiIqz_J4.png',
              'images/4ef35cc699ca1a7a14513db53fb9bd76b803cd23 (2).jpg',
            ],
            name: 'Alaa Medca',
            date: '11/2/2017',
          ),
        ],
      ),
    );
  }
}
