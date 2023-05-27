
import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key, required this.isSelected, required this.color}) : super(key: key);
  final bool isSelected ;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isSelected ?
    CircleAvatar(
      radius: 30,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 28,
        backgroundColor: color,
      ),
    ) : CircleAvatar(
      radius: 28,
      backgroundColor: color,
    );
  }
}