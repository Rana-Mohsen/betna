import 'package:betna/constants.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/core/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CustomPhoneIntl extends StatefulWidget {
  const CustomPhoneIntl({super.key, this.onSaved});
  final void Function(PhoneNumber)? onSaved;
  @override
  State<CustomPhoneIntl> createState() => _CustomPhoneIntlState();
}

class _CustomPhoneIntlState extends State<CustomPhoneIntl> {
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

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'EG';
  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        // print(number.phoneNumber);
        // print(number.isoCode);
      },
      // onInputValidated: (bool value) {
      //   print(value);
      // },
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      initialValue: number,
      textFieldController: controller,
      formatInput: true,
      keyboardType: const TextInputType.numberWithOptions(
        signed: true,
        decimal: true,
      ),
      cursorColor: Colors.black,
      inputDecoration: phoneFieldDecoration(),
      //  inputBorder: OutlineInputBorder(),
      onSaved: widget.onSaved,
    );
  }

  InputDecoration phoneFieldDecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(16),
      // suffixIcon: widget.icon,
      hintText: _isFocused ? null : "Phone",
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
    );
  }
}
