import 'package:betna/constants.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/core/widgets/custom_button.dart';
import 'package:betna/views/auth/widgets/image_with_text.dart';
import 'package:betna/views/auth/widgets/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpCode extends StatefulWidget {
  const OtpCode({super.key});

  @override
  State<OtpCode> createState() => _OtpCodeState();
}

class _OtpCodeState extends State<OtpCode> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(
        padding: kMainPadding,
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 20,
            children: [
              ImageWithText(
                imagePath: "assets/images/forgot_password.png",
                text: "Forgot Password",
              ),
              Pinput(
                controller: _pinController,
                //smsRetriever: SmsRetriever,
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (String verificationCode) {},
                onChanged: (code) {},
                defaultPinTheme: customPinTheme(color: kBackgroundColor),
                focusedPinTheme: customPinTheme(color: kSecondaryColor),
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // margin: const EdgeInsets.only(bottom: 9),
                      width: 1,
                      height: 25,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Resend code?",
                    style: FontStyles.textStyle16.copyWith(
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
              CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResetPassword()),
                  );
                },
                text: "continue",
              ),
            ],
          ),
        ),
      ),
    );
  }

  PinTheme customPinTheme({required Color? color}) {
    return PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 25),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        border: Border(
          bottom: BorderSide(
            color: kPrimaryColor, // Border color
            width: 2.0, // Border width
          ),
        ),
      ),
    );
  }
}
