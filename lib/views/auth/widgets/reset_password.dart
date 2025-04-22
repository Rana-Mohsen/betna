import 'package:betna/constants.dart';
import 'package:betna/core/utils/validators.dart';
import 'package:betna/core/widgets/custom_button.dart';
import 'package:betna/views/auth/widgets/auth_textfield.dart';
import 'package:betna/views/auth/widgets/image_with_text.dart';
import 'package:betna/views/auth/widgets/otp_code.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(
        padding: kMainPadding,
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 20,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ImageWithText(
                imagePath: "assets/images/reset_password.png",
                text: "Forgot Password",
              ),
              AuthTextField(
                hintText: "Email or Phone",
                validator: Validators.emailOrPhoneValidator,
                onChange: (value) {},
              ),
              AuthTextField(
                hintText: "Confirm Password",
                validator: Validators.passwordValidator,
                onChange: (value) {},
              ),

              CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OtpCode()),
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
}
