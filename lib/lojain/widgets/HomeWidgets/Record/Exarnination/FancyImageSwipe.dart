import 'package:MediLink/lojain/Controllers/record/SwipeCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FancyImageSwipe extends StatelessWidget {
  final List<Map<String, String>> items;

  FancyImageSwipe({super.key, required this.items});

  void showImageDialog(BuildContext context, String image) {
    showDialog(
      barrierColor: const Color.fromARGB(201, 0, 0, 0),
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(side: BorderSide()),
          backgroundColor: Colors.transparent,
          contentPadding: const EdgeInsets.symmetric(vertical: 1),
          content: InteractiveViewer(
            minScale: 0.5,
            maxScale: 4,
            child: SizedBox(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height / 2,
              child: Image.network(
                image,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildCard(Map<String, String> item, BuildContext context) {
    return Container(
      height: 366,
      width: 370,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // الاسم والتاريخ
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('images/Vector (17).png'),
                  SizedBox(width: 10),
                  Text(
                    item['name']!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset('images/Vector (20).png'),
                  SizedBox(width: 10),
                  Text(
                    item['date']!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              showImageDialog(context, item['imagePath']!);
            },
            child: Container(
              height: 325,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  item['imagePath']!,
                  fit: BoxFit.fill,
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
    return BlocProvider(
      create: (_) => SwipeCubit(items),
      child: BlocBuilder<SwipeCubit, List<Map<String, String>>>(
        builder: (context, state) {
          final cubit = context.read<SwipeCubit>();
          return Container(
            height: 384,
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
               
                if (state.length > 1) // الكارد الخلفي
             Positioned(
                  left: 0,
                  bottom: 10,
                  child: Container(
                    height: 366,
                    width: 360,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: buildCard(state[1 % state.length], context),
                  ),
                ),

                // طبقة شفافة
                state.length>1?     Positioned(
                  left: 10,
                  bottom: 13,
                  child: Container(
                    height: 369,
                    width: 370,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(38, 115, 221, 0.9),
                    ),
                  ),
                ): Positioned(
                
                  child: Container(
                    height: 369,
                    width: 370,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(38, 115, 221, 0.9),
                    ),
                  ),
                ),

                // الكارد الأمامي القابل للسحب

            state.length>1?   AnimatedPositioned(
                  duration: Duration(
                      milliseconds: 600), // مدة الحركة (زدها لتكون أبطأ)
                  curve: Curves.easeOut, // أكثر سلاسة


                  left: cubit.dragOffset + 18,
                  child: Positioned(
                    child: GestureDetector(
                      onHorizontalDragUpdate: (details) {
                        cubit.updateDrag(details.delta.dx);
                      },
                      onHorizontalDragEnd: (details) {
                        cubit.endDrag();
                      },
                      child: Container(
                        height: 366,
                        width: 360,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: buildCard(state[0], context),
                      ),
                    ),
                  ),
                ):Positioned(
                  left: 5,
                    child: GestureDetector(
                      onHorizontalDragUpdate: (details) {
                        cubit.updateDrag(details.delta.dx);
                      },
                      onHorizontalDragEnd: (details) {
                        cubit.endDrag();
                      },
                      child: Container(
                        height: 366,
                        width: 360,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: buildCard(state[0], context),
                      ),
                    ),
                  ),
              
              ],
            ),
          );
        },
      ),
    );
  }
}
