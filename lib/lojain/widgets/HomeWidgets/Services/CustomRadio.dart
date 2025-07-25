import 'package:flutter/material.dart';

class CustomRadio extends StatelessWidget {
  final int value;
  final int groupValue;
  final ValueChanged<int?> onChanged;

  const CustomRadio({
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:isSelected?  Border.all(color: Color.fromRGBO(38, 115, 221, 1), width: 1): Border.all(color: Color.fromRGBO(38, 115, 221, 0.3), width: 1),
          
        ),
        child: isSelected
            ? Center(
                child: Container(
                  width: 10,
                  height: 10,
                  decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).canvasColor, // اللون الداخلي
                  ),
                ),
              )
            : null,
      ),
    );
  }
}