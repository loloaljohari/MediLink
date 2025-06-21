import 'package:MediLink/widgets/HomeWidgets/Services/Profile/edatProfile.dart';
import 'package:flutter/material.dart';
    
class MyProfile extends StatelessWidget {

  const MyProfile({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
         Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
           child: const Text(
                'My Profile',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14),
              ),
         ),
            InkWell(
              onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => EdatProfile(),));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                height: 86,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: const Color.fromRGBO(38, 115, 221, 0.1)),
                child: Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset('images/Ellipse 97 (1).png'),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.66,
                            child: Text(
                              'Omar Abo Hawa',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20),
                            )),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.66,
                            child: Text(
                              'omarabohawa@gmail.com',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            )),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Color.fromRGBO(38, 115, 221, 1),
                    ),
                  ],
                ),
              ),
            ),
        
    ],
    );
  }
}