import 'package:betna/constants.dart';
import 'package:betna/models/Item_model.dart';
import 'package:flutter/material.dart';

class FavoriteIcon extends StatefulWidget {
  FavoriteIcon({
    super.key,
    this.size = 20,
    this.padding = 1,
    required this.item,
  });

  final double? size;
  ItemModel item;
  final double padding;

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.item.isFav = !widget.item.isFav;
          });
        },
        child: Container(
          padding: EdgeInsets.all(widget.padding),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Icon(
            widget.item.isFav ? Icons.favorite : Icons.favorite_border_outlined,
            size: widget.size,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
