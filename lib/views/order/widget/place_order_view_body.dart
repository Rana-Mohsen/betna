import 'package:betna/constants.dart';
import 'package:betna/core/widgets/custom_button.dart';
import 'package:betna/views/order/widget/custom_phone_intl.dart';
import 'package:betna/views/order/widget/place_order_textfield.dart';
import 'package:flutter/material.dart';

class PlaceOrderViewBody extends StatefulWidget {
  const PlaceOrderViewBody({super.key});

  @override
  State<PlaceOrderViewBody> createState() => _PlaceOrderViewBodyState();
}

class _PlaceOrderViewBodyState extends State<PlaceOrderViewBody> {
  String? name, location, city, address;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kMainPadding,
      child: Column(
        children: [
          PlaceOrderTextField(
            hintText: "Location",
            validator: (_) => null,
            onChange: (value) {
              location = value;
            },
          ),
          PlaceOrderTextField(
            hintText: "Full name",
            validator: (_) => null,
            onChange: (value) {
              name = value;
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: CustomPhoneIntl(),
          ),

          PlaceOrderTextField(
            hintText: "City",
            validator: (_) => null,
            onChange: (value) {
              city = value;
            },
          ),
          PlaceOrderTextField(
            hintText: "Address",
            validator: (_) => null,
            onChange: (value) {
              address = value;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CustomButton(text: "Continue", onTap: () {}),
          ),
        ],
      ),
    );
  }
}
