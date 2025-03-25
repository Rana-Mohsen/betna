import 'dart:convert';

import 'package:betna/constants.dart';
import 'package:betna/core/errors/auth_check_error.dart';
import 'package:betna/core/services/login_api.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/core/utils/snack_bar.dart';
import 'package:betna/core/utils/validators.dart';
import 'package:betna/core/widgets/bottom_navigation_bar.dart';
import 'package:betna/core/widgets/custom_button.dart';
import 'package:betna/views/auth/login_view.dart';
import 'package:betna/views/auth/widgets/auth_textfield.dart';
import 'package:betna/views/auth/widgets/image_with_text.dart';
import 'package:betna/views/auth/widgets/other_login_method.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  bool visible = true;
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthApi auth = AuthApi();

  String? emailOrPhone;
  String? name;
  String? password;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 100.h,
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageWithText(
                  imagePath: "assets/images/signup.png",
                  text: "Create new account",
                ),
                AuthTextField(
                  hintText: "Full name",
                  validator: (_) => null,
                  onChange: (value) {
                    name = value;
                  },
                ),
                AuthTextField(
                  hintText: "Email or Phone",
                  validator: Validators.emailOrPhoneValidator,
                  onChange: (value) {
                    emailOrPhone = value;
                  },
                ),
                AuthTextField(
                  hintText: "Password",
                  validator: Validators.passwordValidator,
                  obscure: visible,
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      icon:
                          visible
                              ? const Icon(Icons.remove_red_eye_outlined)
                              : const Icon(Icons.visibility_off_outlined),
                      color: kGrayColor,
                      iconSize: 20,
                      onPressed: () {
                        setState(() {
                          visible = !visible;
                        });
                      },
                    ),
                  ),
                  onChange: (value) {
                    password = value;
                  },
                ),
                CustomButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});

                      var data = await auth.signupUser(
                        context: context,
                        body: {
                          "name": name,
                          "password": password,
                          "email": emailOrPhone,
                          "phone": emailOrPhone,
                          "address": "",
                        },
                      );
                          checkError(data, context);

                    }

                    isLoading = false;
                    setState(() {});
                  },
                  text: "Sign up",
                ),
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.black)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Or", style: FontStyles.textStyle16),
                    ),
                    Expanded(child: Divider(color: Colors.black)),
                  ],
                ),
                OtherLoginMethods(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: FontStyles.textStyle16,
                    ),
                    GestureDetector(
                      onTap:
                          () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginView(),
                            ),
                          ),
                      child: Text(
                        "Log in",
                        style: FontStyles.textStyle18.copyWith(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
