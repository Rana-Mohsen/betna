import 'package:betna/constants.dart';
import 'package:flutter/material.dart';

class ItemRating extends StatelessWidget {
  const ItemRating({super.key, this.iconSize = 12, this.fontSize = 10});
  final double? iconSize;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, size: iconSize, color: kPrimaryColor),
        Text(
          "(4.8)",
          style: TextStyle(color: kPrimaryColor, fontSize: fontSize),
        ),
      ],
    );
  }
}
