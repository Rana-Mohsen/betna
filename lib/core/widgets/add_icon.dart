import 'package:betna/constants.dart';
import 'package:flutter/material.dart';

class AddIcon extends StatelessWidget {
  const AddIcon({super.key, this.size = 20});
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
      child: Icon(Icons.add, size: size, color: Colors.white),
    );
  }
}
