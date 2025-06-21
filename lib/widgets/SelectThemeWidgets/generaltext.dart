import 'package:flutter/material.dart';
    
class Generaltext extends StatelessWidget {
final String text;
  const Generaltext({ Key? key, required this.text }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Container(
              width: double.infinity,
              height: 55,
              child: Row(
              
                children: [
                  
                  Text(
                    ' ⁛ ',
                    style: TextStyle(
                        color: Color.fromRGBO(64, 123, 255, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(text,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20)),
                    ),
                  ),
                ],
              ),
            );
  }
}