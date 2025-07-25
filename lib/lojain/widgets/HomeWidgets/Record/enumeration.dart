import 'package:flutter/material.dart';
    
class Enumeration extends StatelessWidget {
final String text;
  const Enumeration({ Key? key, required this.text }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.circle,size: 3.5,),
        SizedBox(width: 5,),
         Text(text,style: TextStyle(fontSize: 8,fontWeight: FontWeight.w400),)
      ],
    );
  }
}