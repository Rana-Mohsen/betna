import 'package:betna/constants.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PlaceOrderTextField extends StatefulWidget {
  PlaceOrderTextField({
    super.key,
    this.hintText,
    required this.onChange,
    required this.validator,
    this.obscure = false,
    this.icon,
  });

  String? hintText;
  Function(String) onChange;

  String? Function(String?)? validator;
  bool obscure;
  Widget? icon;

  @override
  State<PlaceOrderTextField> createState() => _PlaceOrderTextFieldState();
}

class _PlaceOrderTextFieldState extends State<PlaceOrderTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        focusNode: _focusNode,
        obscureText: widget.obscure,
        validator: widget.validator,
        onChanged: widget.onChange,
        cursorColor: Colors.black,
        cursorHeight: 20,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          suffixIcon: widget.icon,
          hintText: _isFocused ? null : widget.hintText,
          hintStyle: FontStyles.textStyle14.copyWith(color: kGrayColor),
          errorStyle: const TextStyle(
            color: kPrimaryColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          filled: true,
          fillColor: _isFocused ? kSecondaryColor : kBackgroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
