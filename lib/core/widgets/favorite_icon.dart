import 'package:betna/constants.dart';
import 'package:flutter/material.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key, this.size = 20, this.padding = 1});

  final double? size;

final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          Icons.favorite_border_outlined,
          size: size,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
