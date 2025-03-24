import 'package:betna/constants.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:flutter/material.dart';

class ItemCount extends StatefulWidget {
  //  final int count; // Current count value
  final double iconSize; // Size of the icons
  final double fontSize; // Font size of the count text
  final VoidCallback onAdd; // Callback for the add button
  final VoidCallback onRemove; // Callback for the remove button
  final EdgeInsetsGeometry iconPadding;
    final EdgeInsetsGeometry countPadding;

  const ItemCount({
    super.key,
    this.iconSize = 24.0, // Default icon size
    this.fontSize = 16.0, // Default font size
    //required this.count, // Current count value is required
    required this.onAdd, // Callback for add button
    required this.onRemove,
    required this.iconPadding, required this.countPadding, // Callback for remove button
  });

  @override
  State<ItemCount> createState() => _ItemCountState();
}

class _ItemCountState extends State<ItemCount> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.iconPadding,
      child: Row(
        spacing: 4,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customCountIcon(
            icon: Icons.add,
            iconSize: widget.iconSize,
            onTap: widget.onAdd,
          ),
          Padding(
            padding:  widget.countPadding,
            child: Text(
              "2",
              style: FontStyles.textStyle24.copyWith(
                fontSize: widget.fontSize, // Use customizable font size
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          customCountIcon(
            icon: Icons.remove,
            iconSize: widget.iconSize,
            onTap: widget.onRemove,
          ),
        ],
      ),
    );
  }

  Widget customCountIcon({
    required VoidCallback onTap,
    required IconData icon,
    required double iconSize,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffF5F5F5),
          borderRadius: BorderRadius.circular(iconSize / 2),
        ),
        child: Padding(
          padding: EdgeInsets.all(iconSize * 0.2),
          child: Icon(
            icon,
            color: kPrimaryColor,
            size: iconSize, // Use customizable icon size
          ),
        ),
      ),
    );
  }
}
