import 'package:betna/constants.dart';
import 'package:betna/core/services/paymob_service/paymob_service.dart';
import 'package:betna/core/utils/validators.dart';
import 'package:betna/core/widgets/custom_button.dart';
import 'package:betna/views/order/widget/custom_phone_intl.dart';
import 'package:betna/views/order/widget/place_order_textfield.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';

class PlaceOrderViewBody extends StatefulWidget {
  const PlaceOrderViewBody({super.key});

  @override
  State<PlaceOrderViewBody> createState() => _PlaceOrderViewBodyState();
}

class _PlaceOrderViewBodyState extends State<PlaceOrderViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  String? firstName, lastName, location, email, address;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: kCircleProggress,
      inAsyncCall: isLoading,
      child: SingleChildScrollView(
        padding: kMainPadding,
        child: SizedBox(
          height: 100.h,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                PlaceOrderTextField(
                  hintText: "Location",
                  validator: validateString,
                  onChange: (value) {
                    location = value;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: PlaceOrderTextField(
                        hintText: "First name",
                        validator: validateString,
                        onChange: (value) {
                          firstName = value;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: PlaceOrderTextField(
                        hintText: "Second name",
                        validator: validateString,
                        onChange: (value) {
                          lastName = value;
                        },
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomPhoneIntl(),
                ),

                PlaceOrderTextField(
                  hintText: "Email",
                  validator: Validators.emailValidator,
                  onChange: (value) {
                    email = value;
                  },
                ),
                PlaceOrderTextField(
                  hintText: "Address",
                  validator: validateString,
                  onChange: (value) {
                    address = value;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomButton(
                    text: "Continue",
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        PaymobService paymob = PaymobService();
                        await paymob.launchCheckOutUrl(
                          100.50,
                          firstName!,
                          lastName!,
                          email!,
                          address!,
                          "+201120200408",
                          "EGP",
                        );
                      }
                      setState(() {
                        isLoading = false;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? validateString(data) {
    if (data == null || data.isEmpty) {
      return "This field is required";
    }
    return null;
  }
}
